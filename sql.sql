SHOW DATABASES;
CREATE DATABASE employee;
USE employee;
CREATE TABLE details 	(emp_id int PRIMARY KEY AUTO_INCREMENT, 
						Name varchar(15) UNIQUE, 
                        Branch_City varchar (20) DEFAULT 'Pune', 
                        Dept varchar(50) NOT NULL);
DROP TABLE details;
ALTER TABLE details RENAME COLUMN Branch_City TO City;
ALTER TABLE details ADD Year int;
ALTER TABLE details ADD DOB varchar (50);
UPDATE details SET Name = 'kiran' WHERE name = '123';
ALTER TABLE details MODIFY DOB int;
ALTER TABLE details DROP DOB;
INSERT INTO details (Name, Dept, City) VALUE ('Kiran', 'Mechanical', 'PCMC');
INSERT INTO details (Name, Dept) VALUE ('Supriya', 'Civil');
INSERT INTO details VALUE (1, 'Vinod', 'Maha', 'IT');
INSERT INTO details VALUE (5, 'Vino', 'Maha', 'IT');
INSERT INTO details VALUE (6, 'Vind', 'Maha', 'IT');
UPDATE details SET Year = 2020 WHERE Name = 'Supriya';
DELETE FROM details WHERE Emp_id = 6;

SELECT * FROM details ORDER BY Emp_id DESC LIMIT 2;
SELECT Emp_id,Name,Dept,City FROM details;
SELECT * FROM details;

CREATE TABLE money (Id int, FOREIGN KEY (Id) REFERENCES details (emp_id),
					Basic int NOT NULL, 
                    Deductions int DEFAULT 200);
INSERT INTO money VALUE (1, 20000, 50), (2, 22000, 250);
INSERT INTO money (Id, Basic) VALUE (3, 18000), (4, 19000);
INSERT INTO money VALUE (5, 180000, 2600), (6, 25000,250);
TRUNCATE TABLE  money;
DELETE FROM money WHERE id = 6;
SELECT * FROM money;

SELECT * FROM details JOIN money;
SELECT * FROM details JOIN money ON Emp_id = Id;
SELECT Id, Name, Basic, Deductions FROM details JOIN money ON Emp_id = Id ORDER By Id ASC;
SELECT details.Emp_id e_id, Name, Basic, money.Deductions FROM details  JOIN money ON Emp_id = Id ORDER By Id ASC;