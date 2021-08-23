CREATE TABLE People (
    Id int primary key ,
    Name nvarchar(200) not null,
    Picture image,
	Height decimal(18,2),
	Weight decimal(18,2),
	Gender bit not null,
	Birthdate date not null,R
	Biography nvarchar(max)
);