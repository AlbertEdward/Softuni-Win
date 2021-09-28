CREATE DATABASE SoftUni

CREATE TABLE Towns(
id int primary key identity,
Name varchar(50)
)

CREATE TABLE Addresses(
id int primary key identity,
AddressText varchar(max),
TownId int
)

