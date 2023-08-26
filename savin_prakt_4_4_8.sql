CREATE DATABASE IF NOT EXISTS salon;
USE salon;
ALTER DATABASE salon CHARACTER SET = utf8;

DROP TABLE IF EXISTS roles;
CREATE TABLE IF NOT EXISTS roles(role TINYINT PRIMARY KEY,
role_descript VARCHAR(20));

DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff(id TINYINT PRIMARY KEY,fio VARCHAR(50),
his_role TINYINT,
foreign key(his_role) references roles(role));

DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients(phone VARCHAR(10) PRIMARY KEY,
fio VARCHAR(50));

DROP TABLE IF EXISTS services;
CREATE TABLE IF NOT EXISTS services(nom_service TINYINT PRIMARY KEY,service VARCHAR(20));

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(nomer INT PRIMARY KEY AUTO_INCREMENT,planned_date DATETIME,
done_date DATETIME,service TINYINT,master TINYINT,sum INT, client VARCHAR(10));

ALTER TABLE orders ADD FOREIGN KEY(service) REFERENCES services(nom_service);
ALTER TABLE orders ADD FOREIGN KEY(client) REFERENCES clients(phone);
ALTER TABLE orders ADD FOREIGN KEY(master) REFERENCES staff(id);

DROP TABLE IF EXISTS opinions;
CREATE TABLE IF NOT EXISTS opinions(phone VARCHAR(10) PRIMARY KEY,opinion TEXT, order_nom INT, esteem TINYINT);
ALTER TABLE opinions ADD FOREIGN KEY(phone) REFERENCES clients(phone);
ALTER TABLE opinions ADD FOREIGN KEY(order_nom) REFERENCES orders(nomer);
