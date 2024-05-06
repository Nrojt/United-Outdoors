IF NOT EXISTS (
    SELECT name
    FROM master.dbo.sysdatabases
    WHERE name = N'UnitedOutdoors'
)
CREATE DATABASE UnitedOutdoors
GO

-- TODO: change everything below to the actual combined tables we'll be using
