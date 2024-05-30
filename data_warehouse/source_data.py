import pyodbc
import re
import os
import shutil
from colorama import Fore, Style


def split_and_execute(sql_script):
    # splitting the script into the database creation and the rest
    commands = re.split(r'GO\n', sql_script)

    # removing all \bGO\b from the commands
    commands = [re.sub(r'\bGO\b', '', command) for command in commands]

    # Execute the commands
    for command in commands:
        execute_command(command)


def create_northwind():
    # Open the SQL script file and read its contents
    with open('source_data/sql/NorthWind.sql', 'r') as file:
        sql_script = file.read()

    # Execute the commands
    split_and_execute(sql_script)


def create_adventureworks():
    # Open the SQL script file and read its contents
    with open('source_data/sql/AdventureWorks.sql', 'r') as file:
        sql_script = file.read()

    # getting the current os path
    path = os.getcwd()
    # getting the AdventureWorks bak file in source_data/AdevntureWorks.bak
    source_file = os.path.join(path, 'source_data', 'AdventureWorks.bak')

    # copying the bak file to root directory
    destination_dir = os.path.join(os.path.abspath(os.sep), 'tempAdventureWorks')

    # Check if a file with the same name exists
    if os.path.isfile(destination_dir):
        # If so, rename or delete it
        os.rename(destination_dir, destination_dir + '_old')

    os.makedirs(destination_dir, exist_ok=True)

    # Define the destination file path
    destination_bak = os.path.join(destination_dir, 'AdventureWorks.bak')
    destination_mdf = os.path.join(destination_dir, 'AdventureWorks2019.mdf')
    destination_ldf = os.path.join(destination_dir, 'AdventureWorks2019_log.ldf')

    # Copy the file
    shutil.copy(source_file, destination_bak)

    destination_bak = shutil.copy(source_file, destination_dir)

    print(f'Copied {source_file} to {destination_bak}')

    # replacing the example paths in the sql script with the actual file path
    sql_script = sql_script.replace('AdventureWorks.bak', destination_bak)
    sql_script = sql_script.replace('AdventureWorks2019.mdf', destination_mdf)
    sql_script = sql_script.replace('AdventureWorks2019_log.ldf', destination_ldf)

    # running the sql query through the execute_command function fails for some reason, so have to do it manually I guess
    print(
        f'Run the following command in SQL Server Management Studio to restore the AdventureWorks database:\n{Fore.GREEN}{sql_script}{Style.RESET_ALL}')
    print(
        f'After restoring the database, delete the files from the tempAdventureWorks folder at:\n{Fore.RED}{destination_dir} {Style.RESET_ALL}')


def create_aenc():
    # Open the SQL table creation script file and read its contents
    with open('source_data/sql/Aenc.sql', 'r') as file:
        sql_script = file.read()
        split_and_execute(sql_script)

    # getting the current os path
    path = os.getcwd()
    # getting the Aenc accdb file in source_data/Aenc.accdb
    source_file = os.path.join(path, 'source_data', 'Aenc.accdb')

    # converting a microsoft access database to sql server
    # Define the connection string
    aenc_conn_str = (
        r'DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};'
        f'DBQ={source_file};'
    )

    aenc_conn = pyodbc.connect(aenc_conn_str)
    aenc_cursor = aenc_conn.cursor()

    tables = aenc_cursor.tables().fetchall()

    skip_tables = ['Bonus', 'State', 'SalesOrderItem',
                   'Region']  # need to skip bonus and sales_order_item table, since it didn't have an identity column
    # in the access database. state uses a char column as the primary key, so it also needs to be skipped

    # copying over all the tables from the access database to the sql server database, the table and column names are
    # the same
    for table_info in tables:
        table_name = table_info.table_name

        if table_name.startswith('MSys'):
            continue

        # Execute a SELECT * FROM [table_name] query to get all rows
        aenc_cursor.execute(f"SELECT * FROM [{table_name}]")
        rows = aenc_cursor.fetchall()

        # turning on the identity insert
        if table_name not in skip_tables:
            execute_command(f'SET IDENTITY_INSERT [{table_name}] ON')

        # For each row, insert it into the SQL Server database
        for row in rows:
            # Prepare the INSERT INTO query
            placeholders = ', '.join('?' * len(row))
            columns = ', '.join([column[3] for column in aenc_cursor.columns(table=table_name)])  # get column names
            query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"

            # Execute the INSERT INTO query on the SQL Server database
            execute_command(query, tuple(row))

        # turning off the identity insert
        if table_name not in skip_tables:
            execute_command(f'SET IDENTITY_INSERT [{table_name}] OFF')

    # closing the connection
    aenc_cursor.close()
    aenc_conn.close()

    # adding the foreign key constraints
    with open('source_data/sql/Aenc_foreign_keys.sql', 'r') as file:
        sql_script = file.read()
        split_and_execute(sql_script)


# Define your server and database information
# database name
DB = {
    'servername': '(local)\\SQLEXPRESS',
    'database': 'master'}

# Connect to the SQL Server database, not a specific database but the master
connection_string = f'DRIVER=SQL Server;SERVER={DB["servername"]};DATABASE={DB["database"]};Trusted_Connection=yes'
conn = pyodbc.connect(connection_string, autocommit=True)
cursor = conn.cursor()


def execute_command(command, values=None):
    command = command.strip()
    # Skip if the command is empty or 'GO'
    if not command or command.upper() == 'GO':
        return
    try:
        if values is None:
            cursor.execute(command)
        else:
            cursor.execute(command, values)
        conn.commit()
    except pyodbc.Error as e:
        print(f'Error: {e} at command: {command}')


# Create the NorthWind, AdventureWorks and Aenc databases
create_northwind()
create_adventureworks()
create_aenc()

# Close the connection
cursor.close()
conn.close()
