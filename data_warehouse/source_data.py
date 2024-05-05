import pyodbc
import re
import os
import shutil
from colorama import Fore, Style


def create_northwind():
    # Open the SQL script file and read its contents
    with open('source_data/sql/NorthWind.sql', 'r') as file:
        sql_script = file.read()

    # splitting the script into the database creation and the rest
    commands = re.split(r'GO\n', sql_script)

    # removing all \bGO\b from the commands
    commands = [re.sub(r'\bGO\b', '', command) for command in commands]

    # Execute the commands
    for command in commands:
        execute_command(command)


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
    print(f'Run the following command in SQL Server Management Studio to restore the AdventureWorks database:\n{Fore.GREEN}{sql_script}{Style.RESET_ALL}')
    print(f'After restoring the database, delete the files from the tempAdventureWorks folder at:\n{Fore.RED}{destination_dir} {Style.RESET_ALL}')

def create_aenc():
    # converting a microsoft access database to sql server
    # Define the connection string
    aenc_conn_str = (
        r'DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};'
        r'DBQ=path_to_your_database.accdb;'
    )

    aenc_conn = pyodbc.connect(aenc_conn_str)
    aenc_cursor = aenc_conn.cursor()

    sql_server_commands = []

    # Get the tables in the database
    tables = aenc_cursor.tables()

    # Create the tables in the SQL Server database
    for table in tables:
        table_name = table.table_name
        sql_server_commands.append(f'CREATE TABLE {table_name} ()')



# Define your server and database information
# database name
DB = {
    'servername': '(local)\\SQLEXPRESS',
    'database': 'master'}

# Connect to the SQL Server database, not a specific database but the master
connection_string = f'DRIVER=SQL Server;SERVER={DB["servername"]};DATABASE={DB["database"]};Trusted_Connection=yes'
conn = pyodbc.connect(connection_string, autocommit=True)
cursor = conn.cursor()


def execute_command(command):
    command = command.strip()
    # Skip if the command is empty or 'GO'
    if not command or command.upper() == 'GO':
        return
    try:
        cursor.execute(command)
        conn.commit()
    except pyodbc.Error as e:
        print(f'Error: {e} at command: {command}')

create_northwind()
create_adventureworks()


# Close the connection
cursor.close()
conn.close()
