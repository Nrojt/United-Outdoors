def drop_sk_datetime_added_columns(dataframe):
    # dropping all columns with 'rowguid' in their name
    columns_to_drop_mr = dataframe.filter(like='_sk').columns.append(dataframe.filter(like='_datetime_added').columns)

    # dropping the columns
    dataframe.drop(columns=columns_to_drop_mr, inplace=True)