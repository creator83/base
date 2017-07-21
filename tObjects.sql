CREATE TABLE  objects
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	street int unsigned NOT NULL,
	summ double,
	description CHAR (100) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,	
	importance TINYINT unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY ixId (id),
	FOREIGN KEY ixstreet(street) REFERENCES street (id)	
)ENGINE = INNODB;



ALTER TABLE objects MODIFY  CHAR(100) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL;
ALTER TABLE objects ADD COLUMN description CHAR (100) NOT NULL;
ALTER TABLE objects MODIFY district CHAR (15) NOT NULL;
ALTER TABLE objects ADD FOREIGN KEY ixDistrict(district) REFERENCES district2 (name);


INSERT INTO objects (street, summ, description)
VALUES ((SELECT id FROM street WHERE name = 'Фабричная' AND stateReg = 'Цемдолина'), 1135,'Устройство ливнеотведения по ул. Фабричной (от ул. Заречной до р. Старый Цемес)');

INSERT INTO objects (street, summ, description)
VALUES ((SELECT id FROM street WHERE name = 'Юбилейная' AND stateReg = 'Верхнебаканский'), 689.83,'Устройство ливнеотведения по ул. Юбилейной');

INSERT INTO objects (street, summ, description)
VALUES ((SELECT id FROM street WHERE name = 'Малахитовая' AND stateReg = 'Борисовка'), 390.9 ,'Устройство участка ливнеотведения по ул. Малахитовой');
INSERT INTO objects (street, description)
VALUES ((SELECT id FROM street WHERE name = 'Школьная' AND stateReg = 'Цемдолина'), 'Устройство ливнеотведения по ул. Школьной (от Фабричной до р. Старый Цемес)');

INSERT INTO objects (street, description)
VALUES ((SELECT id FROM street WHERE name = 'Калинина' AND stateReg = 'Натухаевская'), 'Устройство водоперепускной трубы на пересечении ул. Калинина, ул. Лесной, устройство грунтовой СЛО');

INSERT INTO objects (street, description)
VALUES ((SELECT id FROM street WHERE name = 'Соловьиная' AND stateReg = 'Мысхако'), 'Устройство закрытого участка по ул. Соловьиной');



SELECT description, SUM(summ) AS summ
       FROM objects
       GROUP BY description WITH ROLLUP;

SELECT IFNULL (description, 'Итого') AS 'Описание', ROUND (SUM(summ), 3) AS 'Сумма'
       FROM objects
       GROUP BY description WITH ROLLUP ;
	   
SELECT s.stateReg, s.name, o.description, o.summ
	FROM objects o
	INNER JOIN street s ON o.street = s.id AND s.stateReg = 'Раевская';
	
       FROM objects 
       GROUP BY s.stateReg ASC WITH ROLLUP;	
	   
	   
SELECT p.firstName, p.midleName, s.stateReg, s.name, p.nHouse, p.nApp
	FROM person p
	INNER JOIN street s ON p.street = s.id AND p.sureName = 'Балиева';
	
       FROM objects 
       GROUP BY s.stateReg ASC WITH ROLLUP;		   


SELECT objects 
	   
	   
UPDATE objects SET
district = 'Новороссийский';

