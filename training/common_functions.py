from urllib import parse

import matplotlib.pyplot as plt
from sklearn.tree import plot_tree
from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError
import pandas as pd
import os

DB = {
    'servername': '(local)\\SQLEXPRESS',
    'united_outdoors_database': 'UnitedOutdoors',
}

parent_dir = os.path.dirname(os.path.dirname(os.getcwd()))


def drop_sk_datetime_added_columns(dataframe, drop_null_columns=True, fill_na=True):
    # dropping all columns with '_sk' and 'datetime_added' in their name
    columns_to_drop_mr = dataframe.filter(like='_sk').columns.append(dataframe.filter(like='_datetime_added').columns)

    # dropping the columns
    dataframe.drop(columns=columns_to_drop_mr, inplace=True)

    # dropping all columns with only null values
    if drop_null_columns:
        dataframe.dropna(axis=1, how='all', inplace=True)

    # filling all null values with -1
    if fill_na:
        dataframe.fillna(-1, inplace=True)


# Define a function for the training loop
def train_model(model, criterion, optimizer, train_loader, num_epochs):
    for epoch in range(num_epochs):
        for inputs, targets in train_loader:
            model.train()
            optimizer.zero_grad()
            outputs = model(inputs)
            loss = criterion(outputs, targets.view(-1, 1))
            loss.backward()
            optimizer.step()
        if epoch % 100 == 0:
            print(f'Epoch {epoch}, Loss: {loss.item()}')


def get_engine():
    params = parse.quote_plus(
        f'DRIVER={{SQL Server}};SERVER={DB["servername"]};DATABASE={DB["united_outdoors_database"]};Trusted_Connection=yes')
    engine = create_engine(f'mssql+pyodbc:///?odbc_connect={params}', use_setinputsizes=False,
                           connect_args={'options': '-c search_path=dbo'},
                           fast_executemany=True)  # setinputsizes needs to be turned off for sql server, idk why but
    # gives errors otherwise
    try:
        establish_conn = engine.connect()
        print(f'Connection to {DB["united_outdoors_database"]} database successful')
        return engine
    except OperationalError as e:
        print(f'Error: {e}')


def read_data_return_df(sql_query, engine):
    connection = engine.connect()
    try:
        df = pd.read_sql(sql_query, connection)
        return df
    except OperationalError as e:
        print(f'Error: {e}')
    finally:
        connection.close()
    return None


def plot_predictions(y_true, y_pred, title, dict_name, image_short_name):
    image_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'regression', dict_name,
                              image_short_name + '_scatter.png')

    print(image_path)

    # Create directory if it doesn't exist
    os.makedirs(os.path.dirname(image_path), exist_ok=True)

    plt.scatter(y_true, y_pred)
    plt.xlabel('True Values')
    plt.ylabel('Predictions')
    plt.title(title)
    plt.savefig(image_path)
    plt.show()


def plot_feature_importance(columns, importance, title, dir_name, image_short_name):
    image_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'regression', dir_name,
                              image_short_name + '_feature_importance.png')

    print(image_path)

    # Create directory if it doesn't exist
    os.makedirs(os.path.dirname(image_path), exist_ok=True)

    plt.barh(columns, importance)
    plt.xlabel('Importance')
    plt.ylabel('Feature')
    plt.title(title)
    plt.savefig(image_path)
    plt.show()


def plot_decision_tree(model, columns, title, dir_name, image_short_name):
    image_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'regression', dir_name,
                              image_short_name + '.png')

    print(image_path)

    # Create directory if it doesn't exist
    os.makedirs(os.path.dirname(image_path), exist_ok=True)

    plt.figure(figsize=(50, 50))
    plt.title(title)
    plot_tree(model, feature_names=columns, filled=True)
    plt.savefig(image_path)
    plt.show()
