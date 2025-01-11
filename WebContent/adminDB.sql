CREATE TABLE Admin(
	userId INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1 , INCREMENT BY 1),
	userName varchar(45) NOT NULL,
	password varchar(45) NOT NULL,
	email varchar(45) NOT NULL,
	phone BIGINT NOT NULL,
	aadharNumber varchar(14) NOT NULL,
	isAdmin BOOLEAN DEFAULT TRUE
);




INSERT INTO Admin(userName,password,email,phone,aadharNumber) values
		('admin','admin','admin@gmail.com',9324588870,'897802583477');
		
		
		
SELECT * FROM Admin;


drop table ADMIN;