from urllib import parse

import matplotlib.pyplot as plt
from sklearn.tree import plot_tree
from sqlalchemy import create_engine
from sqlalchemy.exc import OperationalError
import pandas as pd
import os
import numpy as np

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


def plot_predictions(y_true, y_pred, title, dir_name, image_short_name):
    dir_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'prediction', dir_name)
    image_path = os.path.join(dir_path, image_short_name + '_scatter.png')

    print(image_path)

    # Create directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    plt.scatter(y_true, y_pred)
    plt.xlabel('True Values')
    plt.ylabel('Predictions')
    plt.title(title)
    plt.savefig(image_path)
    plt.show()


def plot_feature_importance(columns, importance, title, dir_name, image_short_name):
    dir_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'prediction', dir_name)
    image_path = os.path.join(dir_path, image_short_name + '_feature_importance.png')

    print(image_path)

    # Create directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    plt.barh(columns, importance)
    plt.xlabel('Importance')
    plt.ylabel('Feature')
    plt.title(title)
    plt.savefig(image_path)
    plt.show()


def plot_decision_tree(model, columns, title, dir_name, image_short_name):
    dir_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'prediction', dir_name)
    file_path = os.path.join(dir_path, image_short_name + '.png')

    print(file_path)

    # Create directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    plt.figure(figsize=(50, 50))
    plt.title(title)
    plot_tree(model, feature_names=columns, filled=True)
    plt.savefig(file_path)
    plt.show()


def plot_intra_inter_silhouette(ks, intra_distances, inter_distances, silhouette_scores, dir_name):
    dir_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'cluster', dir_name)

    # Create directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    # Plotting the intra-cluster distances
    plt.figure(figsize=(20, 10))
    plt.plot(ks, intra_distances, marker='o')
    plt.title('Intra-cluster distances for different values of k')
    plt.xlabel('Number of clusters (k)')
    plt.ylabel('Intra-cluster distance (inertia)')
    plt.grid(True)
    plt.savefig(f'{dir_path}/intra.png')
    plt.show()

    # Plotting the inter-cluster distances
    plt.figure(figsize=(20, 10))
    plt.plot(ks, inter_distances, marker='o')
    plt.title('Inter-cluster distances for different values of k')
    plt.xlabel('Number of clusters (k)')
    plt.ylabel('Inter-cluster distance')
    plt.grid(True)
    plt.savefig(f'{dir_path}/inter.png')
    plt.show()

    # plotting the silhouette scores
    plt.figure(figsize=(20, 10))
    plt.plot(ks, silhouette_scores, marker='o')
    plt.title('Silhouette scores for different values of k')
    plt.xlabel('Number of clusters (k)')
    plt.ylabel('Silhouette score')
    plt.savefig(f'{dir_path}/silhouette.png')
    plt.grid(True)
    plt.show()


def plot_cluster_scatter(df, cluster_assignments, color_map, dir_name):
    dir_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'cluster', dir_name)
    image_path = os.path.join(dir_path, 'scatter.png')

    # Create directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    # Map the cluster assignments to colors
    color_assignments = list(map(color_map.get, cluster_assignments))

    # Create a scatter plot of the reduced data, colored by cluster assignment
    plt.figure(figsize=(10, 5))
    plt.title('Visualization of clusters')
    # PCA is unsupervised, so we don't have labels. We can only label the axes
    plt.xlabel('PCA X')
    plt.ylabel('PCA Y')

    # Create a scatter plot of the reduced data, colored by cluster assignment
    plt.scatter(df[:, 0], df[:, 1], c=np.array(color_assignments))

    # Create a legend
    handles = [plt.Line2D([], [], marker="o", ls="", color=color_map[i]) for i in np.unique(cluster_assignments)]
    plt.legend(handles, np.unique(cluster_assignments), title="Clusters", bbox_to_anchor=(1, 1))

    # Save the plot
    plt.savefig(image_path)

    plt.show()


def plot_unique_clusters(df, cluster_assignments, colors, dir_name):
    dir_path = os.path.join(parent_dir, 'visualization', 'static', 'training', 'cluster', dir_name, 'unique_clusters')

    print(dir_path)

    # Get the unique cluster labels
    unique_clusters = np.unique(cluster_assignments)

    # Create directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    # Create a figure and a set of subplots
    fig, axs = plt.subplots(len(unique_clusters), figsize=(10, 5 * len(unique_clusters)))

    # Iterate over the unique cluster labels
    for i, cluster in enumerate(unique_clusters):
        # Get the data points that belong to this cluster
        cluster_data = df[cluster_assignments == cluster]

        # Create a scatter plot for this cluster using a unique color
        axs[i].scatter(cluster_data[:, 0], cluster_data[:, 1], color=colors[i % len(colors)])
        axs[i].set_title(f'Cluster {cluster}')
        axs[i].set_xlabel('PCA X')
        axs[i].set_ylabel('PCA Y')
        plt.savefig(f'{dir_path}/cluster_{cluster}.png')

    # Display the plots
    plt.tight_layout()
    plt.show()
