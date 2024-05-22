def drop_sk_datetime_added_columns(dataframe):
    # dropping all columns with 'rowguid' in their name
    columns_to_drop_mr = dataframe.filter(like='_sk').columns.append(dataframe.filter(like='_datetime_added').columns)

    # dropping the columns
    dataframe.drop(columns=columns_to_drop_mr, inplace=True)


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
