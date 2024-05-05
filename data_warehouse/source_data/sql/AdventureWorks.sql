RESTORE DATABASE AdventureWorks2019
FROM DISK = N'AdventureWorks.bak'
WITH REPLACE,
    STATS = 10,
MOVE 'AdventureWorks2017' TO N'AdventureWorks2019.mdf',
MOVE 'AdventureWorks2017_log' TO N'AdventureWorks2019_log.ldf';