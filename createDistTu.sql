
ALTER TABLE contractor ADD COLUMN start_ DATE;
ALTER TABLE contractor ADD COLUMN end_ DATE;


CREATE TABLE contracts
(	
        id int unsigned NOT NULL AUTO_INCREMENT,
        contragent int unsigned NOT NULL, 
        name CHAR (200) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
		number CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
        summ  double,
		start_ DATE NOT NULL,
		end_ DATE NOT NULL,
        FOREIGN KEY ixContragent(contragent) REFERENCES contragent (id),
        PRIMARY KEY ixId (id)
)ENGINE = INNODB;

INSERT INTO contracts (contragent, name, number, start_, end_) 
VALUES ((SELECT id from contragent WHERE sureName = 'Носик'), 
"Обслуживание систем ливнеотведения Приморского внутригородского района", 
"2", STR_TO_DATE('01-01-2017','%d-%m-%Y'), STR_TO_DATE('30-12-2017','%d-%m-%Y'));

INSERT INTO contracts (contragent, name, number, start_, end_) 
VALUES ((SELECT id from contragent WHERE sureName = 'Лиш'), 
"Обслуживание систем ливнеотведения Новороссийского района", 
"2", STR_TO_DATE('01-01-2017','%d-%m-%Y'), STR_TO_DATE('30-12-2017','%d-%m-%Y'));

CREATE TABLE applicant
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	name CHAR (200) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	PRIMARY KEY ixId (id)
)ENGINE = INNODB;

CREATE TABLE municipal_structures
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	name CHAR (200) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	PRIMARY KEY ixId (id)
)ENGINE = INNODB;


INSERT INTO municipal_structures (name) 
VALUE ("МКУ \"Управление гидротехнических сооружений и систем ливнеотведения\"");

INSERT INTO municipal_structures (name) 
VALUE ("МБУ \"Безопасный город\"");

CREATE TABLE tasks
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
    name CHAR (200) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	contract int unsigned NOT NULL,
	applicant int unsigned NOT NULL,
	start_ DATE NOT NULL,
	end_ DATE NOT NULL,
	FOREIGN KEY ixContract(contract) REFERENCES service_contracts (id),
	FOREIGN KEY ixApplicant(applicant) REFERENCES municipal_structures (id),
    PRIMARY KEY ixId (id)
)ENGINE = INNODB;

CREATE TABLE service_contracts
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	contract int unsigned NOT NULL, 
	district CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL, 
	FOREIGN KEY ixDistrict(district) REFERENCES district2 (name),
	FOREIGN KEY ixContract(contract) REFERENCES contracts (id),
	PRIMARY KEY ixId (id)
)ENGINE = INNODB;



start_ = STR_TO_DATE('01-01-2017','%d-%m-%Y'), 
end_ = STR_TO_DATE('30-12-2017','%d-%m-%Y') 
WHERE contragent = ;
--создание таблицы районы

CREATE TABLE district 
	(name CHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci,
	PRIMARY KEY (name)
	) ENGINE = INNODB;
	
--создание таблицы место регистрации
CREATE TABLE stateReg 
	(name CHAR(20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	region CHAR(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	prfx ENUM ('','г.', 'с.','х.','п.','ст.') CHARACTER SET utf8 NOT NULL,
	PRIMARY KEY ixName(name),
	FOREIGN KEY ixRegion(region) REFERENCES region (name)
	) ENGINE = INNODB;
	
--создание таблицы заявителей
CREATE TABLE  person
(	
	sureName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	firstName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	midleName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	stateReg CHAR(20) CHARACTER SET utf8 NOT NULL,
	street CHAR(20) CHARACTER SET utf8 NOT NULL,
	nHouse CHAR(10) CHARACTER SET utf8 NOT NULL,
	nApp CHAR(10) CHARACTER SET utf8 DEFAULT "",
	PRIMARY KEY ixName (sureName),
	FOREIGN KEY ixstate(stateReg) REFERENCES stateReg (name)
	
)ENGINE = INNODB;

CREATE TABLE  person
(	
	sureName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	firstName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	midleName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	street CHAR(20) CHARACTER SET utf8 NOT NULL,
	nHouse CHAR(10) CHARACTER SET utf8 NOT NULL,
	nApp CHAR(10) CHARACTER SET utf8 DEFAULT "",
	PRIMARY KEY ixName (sureName),
	FOREIGN KEY ixstreet(street) REFERENCES street (id)
	
)ENGINE = INNODB;

CREATE TABLE job
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	name CHAR (100) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	rascenka CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	mesure CHAR (10) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	FOREIGN KEY ixMesure(mesure) REFERENCES mesure (name),
	PRIMARY KEY ixId (id)
)ENGINE = INNODB;

CREATE TABLE mesure
(	
	name CHAR (10) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	PRIMARY KEY ixName (name)
)ENGINE = INNODB;

INSERT INTO job (name, rascenka, mesure)
VALUES ('Очистка камер: от мокрого ила и грязи без труб и арматуры', 'ТЕРр66-10-6', '1м3'),
('Погрузочные работы при автомобильных перевозках: мусора строительного с погрузкой экскаваторами ёмкостью ковша до 0,5 м3','ТССЦпг01-01-01-043','1т'),
('Перевозка грузов автомобилями-самосвалами грузоподъёмностью 10т, работающих вне карьера, на расстояние: до 14 км I класс грунтов','ТССЦпг03-21-01-014','1т'),
('Промывка спецмашинами "Скания" и "SISU" канализационных трубопроводов диаметром: 300мм','ТЕРр66-43-2', '100м'),
('Промывка спецмашинами "Скания" и "SISU" канализационных трубопроводов диаметром: 400мм','ТЕРр66-43-3', '100м'),
('Промывка спецмашинами "Скания" и "SISU" канализационных трубопроводов диаметром: 500мм','ТЕРр66-43-4', '100м'),
('Установка металлических решёток приямков','ТЕР08-02-007-03', '1т');

INSERT INTO mesure (name)
VALUES ('1м3'),('1т'),('100м');

CREATE TABLE chiefs 
(	
	sureName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	firstName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	midleName CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	position CHAR(20) CHARACTER SET utf8 NOT NULL,
	PRIMARY KEY ixName (sureName)
)ENGINE = INNODB;

ALTER TABLE job ADD COLUMN rascenka CHAR (20) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL;


CREATE TABLE distPos 
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	name CHAR (50) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL,
	PRIMARY KEY ixId (id)
)ENGINE = INNODB;

ALTER TABLE job MODIFY name CHAR (150) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL;


INSERT INTO distPos (name)
	VALUES ('Администрация Краснодарского края'), ('Администрация муниципального образования город Новороссийск');

	
CREATE TABLE region 
	(name CHAR(30)  CHARACTER SET  utf8 COLLATE  utf8_general_ci NOT NULL,
	PRIMARY KEY (name)
	) ENGINE = INNODB;
	
CREATE TABLE district2 
	(name CHAR(15)  CHARACTER SET  utf8 COLLATE  utf8_general_ci NOT NULL,
	PRIMARY KEY (name)
	) ENGINE = INNODB;	
	
INSERT INTO district2 VALUES('Новороссийский'), ('Южный'),('Центральный'),('Приморский'),('Восточный');
	
ALTER TABLE person ADD numPhone CHAR(10) CHARACTER SET utf8 NOT NULL;

ALTER TABLE person ADD prfxStreet ENUM ('ул.','проезд','пр-т.','пер.') CHARACTER SET utf8;
ALTER TABLE street MODIFY prfxStreet ENUM ('ул.','проезд','пр-т.','пер.') CHARACTER SET utf8 NOT NULL;

ALTER TABLE person MODIFY numPhone CHAR(10) CHARACTER SET utf8 NOT NULL DEFAULT "";
ALTER TABLE person MODIFY street CHAR(30) CHARACTER SET utf8 NOT NULL;
ALTER TABLE tu MODIFY street CHAR(30) CHARACTER SET utf8 NOT NULL;
INSERT INTO region (name) VALUES ("Краснодарский край");	
	
--модификация
ALTER TABLE district MODIFY name NOT NULL;
ALTER TABLE letters MODIFY nDate DATE NOT NULL;
ALTER TABLE tu MODIFY stateReg CHAR(20), FOREIGN KEY ixStateReg (stateReg) REFERENCES stateReg(name);
ALTER TABLE district MODIFY prfx ENUM ('','г.', 'с.','х.','п.','ст.') CHARACTER SET utf8 NOT NULL;

ALTER TABLE chiefs MODIFY position CHAR(100) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL;
ALTER TABLE letters MODIFY filePlace CHAR(100) CHARACTER SET utf8 COLLATE  utf8_general_ci NOT NULL;

ALTER TABLE letters MODIFY typeLetter ENUM ('обращение','служебная записка', 'инициативное письмо', 'для сводного ответа', 'поручения') CHARACTER SET utf8 NOT NULL;
ALTER TABLE stateReg ADD prfx ENUM ('г.', 'с.','х.','п.','ст.') CHARACTER SET utf8 NOT NULL;
ALTER TABLE stateReg MODIFY prfx ENUM ('г.', 'с.','х.','п.','ст.', 'д.') CHARACTER SET utf8 NOT NULL;
ALTER TABLE chiefs ADD novoross TINYINT DEFAULT 0 NOT NULL;

ALTER TABLE tu DROP COLUMN street;
ALTER TABLE person DROP COLUMN prfxStreet;
ALTER TABLE tu DROP COLUMN stateReg;
ALTER TABLE tu MODIFY street int unsigned NOT NULL;
ALTER TABLE tu ADD COLUMN street int unsigned;
ALTER TABLE tu ADD FOREIGN KEY ixstreet(street) REFERENCES street (id);

ALTER TABLE chiefs MODIFY novoross TINYINT DEFAULT 0;

ALTER TABLE person MODIFY street int unsigned;

ALTER TABLE tu2 ADD stateReg CHAR(20) CHARACTER SET utf8 NOT NULL FOREIGN KEY ixStateReg(stateReg) REFERENCES stateReg (name);

ALTER TABLE person ADD CONSTRAINT fk_street FOREIGN KEY ixstreet(street) REFERENCES street (name);
ALTER TABLE person ADD FOREIGN KEY ixstreet(street) REFERENCES street (name);
ALTER TABLE person ADD FOREIGN KEY ixstreet(street) REFERENCES street (id);
ALTER TABLE tu2 ADD FOREIGN KEY ixStateReg(stateReg) REFERENCES stateReg (name);

ALTER TABLE tu2 ADD FOREIGN KEY ixReg(Reg) REFERENCES district (name);

ALTER TABLE chiefs ADD FOREIGN KEY ixworkDist(workDistrict) REFERENCES distPos (id);


ALTER TABLE person DROP CONSTRAINT FOREIGN KEY ixstreet;
ALTER TABLE tu DROP FOREIGN KEY tu_ibfk_1;

ALTER TABLE person DROP FOREIGN KEY SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'person' AND COLUMN_NAME = 'stateReg';
ALTER TABLE tu DROP FOREIGN KEY SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'tu' AND COLUMN_NAME = 'stateReg';

SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE REFERENCED_TABLE_SCHEMA = 'workspace' AND REFERENCED_TABLE_NAME = 'tu';

ALTER TABLE chiefs MODIFY workDistrict int unsigned NOT NULL;


UPDATE contractor SET
start_ = STR_TO_DATE('01-01-2017','%d,%m,%Y'), 
end_ = STR_TO_DATE('30-12-2017','%d,%m,%Y') 
WHERE contragent = (SELECT id from contragent WHERE sureName = 'Носик');

INSERT INTO 

UPDATE tu2 SET
stateReg = 'Новороссийск' 
WHERE sureName <> 'Гунина';

UPDATE chiefs SET
workDistrict = (SELECT id from distPos WHERE name = 'Администрация муниципального образования город Новороссийск');




UPDATE person SET
prfxStreet = 'ул.' 
WHERE sureName = 'Кушнарёв';


UPDATE tu SET
street = (SELECT id from street where name = 'Изумрудная')
WHERE sureName = 'Гунина';

UPDATE tu SET
street = (SELECT id from street where name = 'Волгоградская')
WHERE sureName = 'Мовчан';

UPDATE tu SET
street = (SELECT id from street where name = 'Мысхакское шоссе')
WHERE sureName = 'Байрамова';

UPDATE tu SET
street = (SELECT id from street where name = 'Ленина')
WHERE sureName = 'Полищук';

UPDATE tu SET
street = (SELECT id from street where name = 'Атлетическая')
WHERE sureName = 'Кравцов';

UPDATE tu SET
street = (SELECT id from street where name = 'Комарова')
WHERE sureName = 'Чуприна';

UPDATE tu SET
street = (SELECT id from street where name = '8-я Гвардейская')
WHERE sureName = 'Гриневич';

UPDATE street SET
prfxStreet = 'пр-т.' 
WHERE name = 'Ленина';

SELECT FROM person WHERE 


INSERT INTO street (name, stateReg)
VALUES ("Зелёная", "Натухаевская");
INSERT INTO street (name, stateReg)
VALUES ("8-я Гвардейская", "Мысхако");
INSERT INTO street (name, stateReg)
VALUES ("Изумрудная", "Мысхако");
INSERT INTO street (name, stateReg)
VALUES ("8-я Щель", "Цемдолина");
INSERT INTO street (name, stateReg)
VALUES ("Атлетическая", "Цемдолина");
INSERT INTO street (name, stateReg)
VALUES ("Комарова", "Крымск");
INSERT INTO street (name, stateReg)
VALUES ("Зелёная", "Мысхако");

INSERT INTO street (name, stateReg)
VALUES ("Ленина", "Новороссийск");
INSERT INTO street (name, stateReg)
VALUES ("Волгоградская", "Новороссийск");

INSERT INTO street (name, stateReg)
VALUES ("Мысхакское шоссе", "Новороссийск");

INSERT INTO person (sureName, firstName, midleName, street, nHouse, numPhone, prfxStreet) 
VALUES ("Кушнарёв", "Роман", "Николаевич",  "Зелёная", "4", "9883674079", "ул.");

INSERT INTO person (sureName, firstName, midleName, street, nHouse, numPhone, prfxStreet) 
VALUES ("Кушнарёв", "Роман", "Николаевич",  (SELECT id as street FROM street WHERE stateReg = 'Натухаевская'), "4", "9883674079", "ул.");

INSERT INTO person (sureName, firstName, midleName, street, nHouse, numPhone, prfxStreet) 
VALUES ("Куш", "Роман", "Николаевич",  "Зелёная", "4", "9883674079", "ул.");


--вставка данных
INSERT INTO district (name, prfx) VALUES ("Натухаевская", "ст.");
INSERT INTO district (name, prfx) VALUES ("Раевская", "ст.");
INSERT INTO district (name, prfx) VALUES ("Убых", "х.");
INSERT INTO district (name, prfx) VALUES ("Цемдолина", "с.");
INSERT INTO district (name, prfx) VALUES ("Гайдук", "с.");
INSERT INTO district (name, prfx) VALUES ("Владимировка", "с.");
INSERT INTO district (name, prfx) VALUES ("Борисовка", "с.");
INSERT INTO district (name, prfx) VALUES ("Васильевка", "с.");
INSERT INTO district (name, prfx) VALUES ("Глебовское", "с.");
INSERT INTO district (name, prfx) VALUES ("Северная Озереевка", "с.");
INSERT INTO district (name, prfx) VALUES ("Южная Озереевка", "с.");
INSERT INTO district (name, prfx) VALUES ("Камчатка", "х.");
INSERT INTO district (name, prfx) VALUES ("Абрау-Дюрсо", "с.");
INSERT INTO district (name, prfx) VALUES ("Большие Хутора", "с.");
INSERT INTO district (name, prfx) VALUES ("Новороссийск", "г.");
INSERT INTO district (name, prfx) VALUES ("Кирилловка", "с.");
INSERT INTO district (name, prfx) VALUES ("Мысхако", "с.");
INSERT INTO district (name, prfx) VALUES ("Южный район", "");
INSERT INTO district (name, prfx) VALUES ("Центральный район", "");
INSERT INTO district (name, prfx) VALUES ("Восточный район", "");
INSERT INTO district (name, prfx) VALUES ("Приморский район", "");

INSERT INTO stateReg (name, region, prfx) VALUES ("Натухаевская", "Краснодарский край","ст.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Раевская", "Краснодарский край","ст.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Убых", "Краснодарский край","х.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Семигорский", "Краснодарский край","х.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Камчатка", "Краснодарский край","х.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Цемдолина", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Гайдук", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Владимировка", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Борисовка", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Васильевка", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Глебовское", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Северная Озереевка", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Южная Озереевка", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Мысхако", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Абрау-Дюрсо", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Большие Хутора", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Кирилловка", "Краснодарский край","с.");
INSERT INTO stateReg (name, region, prfx) VALUES ("Новороссийск", "Краснодарский край","г.");

DROP from tu Where sureName = ''
ALTER TABLE district ADD prfx ENUM ('','г.', 'с.','х.','п.','ст.') CHARACTER SET utf8 NOT NULL;

ALTER TABLE tu DROP COLUMN prfxStreet;


--создание таблицы Технические условия

CREATE TABLE tu 
(
	nDate DATE,
	firstName CHAR(20) CHARACTER SET utf8 NOT NULL,
	midleName CHAR(20) CHARACTER SET utf8 NOT NULL,
	sureName CHAR(20) CHARACTER SET utf8 NOT NULL,
	stateReg CHAR(20),
	prfxStreet ENUM ('ул.','проезд','пр-т.','пер.') CHARACTER SET utf8 NOT NULL,
	street CHAR(20) CHARACTER SET utf8 NOT NULL,
	numHouse CHAR(10) CHARACTER SET utf8 NOT NULL,
	numAp CHAR(5) CHARACTER SET utf8 NOT NULL,
	numPhone CHAR(10) CHARACTER SET utf8 NOT NULL,
	reg CHAR(20),
	address CHAR(50) CHARACTER SET utf8 NOT NULL DEFAULT "",
	numKadastr CHAR(11) CHARACTER SET utf8 NOT NULL,
	filePlace CHAR(50) CHARACTER SET utf8 NOT NULL,
	typeTu ENUM ('с проектом','без проекта') CHARACTER SET utf8 NOT NULL,
	INDEX ixStateReg (stateReg),
	FOREIGN KEY (stateReg) REFERENCES district (name),
	INDEX ixreg (reg),
	FOREIGN KEY (reg) REFERENCES district (name),
	PRIMARY KEY (numKadastr),
	INDEX ixdate (nDate)
	
) ENGINE = INNODB;

CREATE TABLE letters
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	nDate DATE,
	typeLetter ENUM ('обращение','служебная записка', 'инициативное письмо', 'для сводного ответа', 'поручения') CHARACTER SET utf8 NOT NULL,
	sureNameP CHAR(20) CHARACTER SET utf8 NOT NULL,
	toChiefs CHAR(20) CHARACTER SET utf8 NOT NULL ,
	executor CHAR(20) CHARACTER SET utf8 NOT NULL,
	subexecutor CHAR(20) CHARACTER SET utf8 NOT NULL,
	description CHAR(100) CHARACTER SET utf8 NOT NULL DEFAULT "",
	filePlace CHAR(50) CHARACTER SET utf8 NOT NULL,
	toStrategy TINYINT UNSIGNED NOT NULL DEFAULT 0,
	FOREIGN KEY ixPerson(sureNameP) REFERENCES person (sureName),
	FOREIGN KEY ixChiefs(toChiefs) REFERENCES chiefs (sureName),
	FOREIGN KEY ixExecutor(executor) REFERENCES chiefs (sureName),
	FOREIGN KEY ixSubExecutor(subexecutor) REFERENCES chiefs (sureName),
	PRIMARY KEY ixId(id),
	INDEX ixdate (nDate)
	
) ENGINE = INNODB;

CREATE TABLE answers
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	nDate DATE,
	sureName CHAR(20) CHARACTER SET utf8 NOT NULL,
	executor CHAR(20) CHARACTER SET utf8 NOT NULL,
	subexecutor CHAR(20) CHARACTER SET utf8 NOT NULL,
	description CHAR(100) CHARACTER SET utf8 NOT NULL DEFAULT "",
	filePlace CHAR(50) CHARACTER SET utf8 NOT NULL,
	FOREIGN KEY ixPerson(sureName) REFERENCES person (sureName),
	FOREIGN KEY ixExecutor(executor) REFERENCES chiefs (sureName),
	FOREIGN KEY ixSubExecutor(subexecutor) REFERENCES chiefs (sureName),
	PRIMARY KEY ixId(id),
	INDEX ixdate (nDate)
)ENGINE = INNODB;

CREATE TABLE groupAnswers
(	
	id int unsigned NOT NULL AUTO_INCREMENT,
	nDate DATE,
	sureName CHAR(20) CHARACTER SET utf8 NOT NULL,
	fromChief CHAR(20) CHARACTER SET utf8 NOT NULL,
	toChief CHAR(20) CHARACTER SET utf8 NOT NULL,
	description CHAR(100) CHARACTER SET utf8 NOT NULL DEFAULT "",
	filePlace CHAR(50) CHARACTER SET utf8 NOT NULL,
	FOREIGN KEY ixPerson(sureName) REFERENCES person (sureName),
	FOREIGN KEY ixFromChief(fromChief) REFERENCES chiefs (sureName),
	FOREIGN KEY ixToChief(toChief) REFERENCES chiefs (sureName),
	PRIMARY KEY ixId(id),
	INDEX ixdate (nDate)
)ENGINE = INNODB;


CREATE TABLE letters2
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	nDate DATE,
	typeLetter ENUM ('служебная записка', 'инициативное письмо', 'для сводного ответа', 'поручения') CHARACTER SET utf8 NOT NULL,
	toChiefs CHAR(20) CHARACTER SET utf8 NOT NULL ,
	executor CHAR(20) CHARACTER SET utf8 NOT NULL,
	subexecutor CHAR(20) CHARACTER SET utf8 NOT NULL,
	description CHAR(100) CHARACTER SET utf8 NOT NULL DEFAULT "",
	filePlace CHAR(50) CHARACTER SET utf8 NOT NULL,
	FOREIGN KEY ixChiefs(toChiefs) REFERENCES chiefs (sureName),
	FOREIGN KEY ixExecutor(executor) REFERENCES chiefs (sureName),
	FOREIGN KEY ixSubExecutor(subexecutor) REFERENCES chiefs (sureName),
	PRIMARY KEY ixId(id),
	INDEX ixdate (nDate)
	
) ENGINE = INNODB;


CREATE TABLE street
(
	id int unsigned NOT NULL AUTO_INCREMENT,
	name CHAR(30) CHARACTER SET utf8 NOT NULL,
	stateReg CHAR(50) CHARACTER SET utf8 NOT NULL,
	FOREIGN KEY ixState(stateReg) REFERENCES stateReg (name),
	PRIMARY KEY ixId(id),
	INDEX ixName (name)
	
) ENGINE = INNODB;
ALTER TABLE tu DROP FOREIGN KEY stateReg;

--
DATE_FORMAT (nDate, String);

INSERT INTO chiefs (sureName, firstName, midleName, position)
VALUES ("Дяченко","Игорь","Алексеевич","Глава муниципального образования город Новороссийск");

INSERT INTO chiefs (sureName, firstName, midleName, position)
VALUES ("Служалый","Александр","Владимирович","Заместитель главы муниципального образования город Новороссийск");

--вставка значения технических условий
INSERT INTO tu (nDate, firstName, midleName, sureName, stateReg, prfxStreet, 
street, numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu)
VALUES(CURDATE(),Кристина,Юрьевна,Мовчан,Новороссийск,ул.,Волгоградская,
18,45,9384834754,Кирилловка,район ул. Красная,0107010709,d:''Технические условия''base''Мовчан_23_6_2017,без проекта);
INSERT INTO tu (nDate, firstName, midleName, sureName, stateReg, prfxStreet, street, 
numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu) 
VALUES (CURDATE(), "Елизавета", "Валерьевна", "Полищук", 
					"Новороссийск", "пр-т.", "Ленина",
					"31", "79", "9189195405", "Мысхако",
					"ул. Понтийская", "01180552525", 'd:\\Технические условия\\base\\Полищук_23_6_2017', 'без проекта');
INSERT INTO tu (nDate, firstName, midleName, sureName, stateReg, prfxStreet, street, 
numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu) 
VALUES (CURDATE(), "Кристина", "Юрьевна", "Мовчан", 
					"Новороссийск", "ул.", "Волгоградская",
					"18", "45", "9384834754", "Кирилловка",
					"район ул. Красная", "0107010709", 
					'd:\\Технические условия\\Кирилловка\\Мовчан_26_6_2017.docx', 'с проектом');
INSERT INTO tu (nDate, firstName, midleName, sureName, stateReg, prfxStreet, street, 
numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu)
VALUES(CURDATE(),'Кристина','Юрьевна','Мовчан',
					'Новороссийск','ул.','Волгоградская',
					'18','45','9384834754','Кирилловка',
					'район ул. Красная','0107010709',
					'd:\\Технические условия\\Кирилловка\\Мовчан_26_6_2017.docx','c проектом');
INSERT INTO tu (nDate, firstName, midleName, sureName, prfxStreet, street, 
numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu, stateReg)
VALUES(CURDATE(),'Кристина','Юрьевна','Мовчан','ул.','Волгоградская',
					'18','45','9384834754','Кирилловка',
					'район ул. Красная','0107010709',
					'd:\\Технические условия\\Кирилловка\\Мовчан_26_6_2017.docx', typeTu+0, 'Новороссийск');
					
INSERT INTO tu (nDate, firstName, midleName, sureName, prfxStreet, street, 
numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu, stateReg)
VALUES(CURDATE(), 'Владимир', 'Алексеевич', 'Кравцов', 'ул.', 'Атлетическая', 
					'13', '', '9181157944', 'Цемдолина', 
					'ул. Атлетическая, 10', '0118056102', 
					'd:\\Технические условия\\Цемдолина\\Кравцов_28_6_2017.docx', typeTu+1, 'Цемдолина');
		

INSERT INTO tu (nDate, firstName, midleName, sureName, numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu, street)
VALUES(CURDATE(), 'иВАНОВ', 'Алексеевич', 'Кравцов', '13', '', '9181157944', 'Цемдолина', 
					'ул. Атлетическая, 10', '01180561', 
					'd:\\Технические условия\\Цемдолина\\Кравцов_28_6_2017.docx', typeTu+1, 2);
					
INSERT INTO chiefs (sureName, firstName, midleName, position, novoross) 
VALUES ('Дяченко', 'Игорь', 'Алексеевич', 'Глава администрации муниципального образования город Новороссийск', novoross+1);


INSERT INTO person (sureName, firstName, midleName, stateReg, street, nHouse, nApp, numPhone, prfxStreet) 
VALUES ('Гриневич', 'Константин', 'Викторович', 'Мысхако',  '8-я Гвардейская', '40а',', '',', '9282824992', 'ул.');

INSERT INTO person (sureName, firstName, midleName, street, nHouse, numPhone) 
VALUES ('Балиева', 'Лариса', 'Владимировна', (SELECT name FROM street WHERE stateReg='Натухаевская'), '25', '9385052589', '')

INSERT INTO person (sureName, firstName, midleName, street, nHouse, numPhone) VALUES ('Балиева', 'Лариса', 'Владимировна', (SELECT id FROM street WHERE name = 'Шоссейная' AND stateReg='Натухаевская'), '25', '9385052589');




INSERT INTO letters (nDate, typeLetter, sureNameP, toChiefs, executor, subexecutor, description, filePlace, toStrategy) 
VALUES(CURDATE(), typeLetter+3, 'Балиева', 'Чумак', 'Оганесян', 'Кошелев', 'подтопление дворовой территории', 
'd:\\Обращения, поручения\\Натухаевская\\Балиева_13_7_2017.docx', 0);


SELECT id from street where stateReg = 'Мысхако' AND name='Адмирала Угрюмова';

INSERT INTO tu (nDate, firstName, midleName, sureName, numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, 
typeTu, street)
VALUES(CURDATE(), 'Татьяна', 'Владимировна', 'Косенко', '19', '', '9887628488', 'Цемдолина', '', '01170160024', 
'd:\\\\Технические условия\\\\Цемдолина\\\\Косенко_17_7_2017.docx', typeTu+0, 13);

SELECT prfxStreet FROM street WHERE name = 'Мысхако';

INSERT INTO person (sureName, firstName, midleName, street, nHouse, numPhone) 
VALUES ('Пупкин', 'Ива', 'Ива', (SELECT id FROM street WHERE stateReg='Натухаевская' AND name = 'Зелёная'), '12', '123444444');


INSERT INTO tu (nDate, firstName, midleName, sureName, numHouse, numAp, numPhone, reg, address, numKadastr, filePlace, typeTu, street) 
VALUES
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183307', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183312', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183311', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183315', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183316', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183318', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183306', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183320', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183317', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183314', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183310', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183309', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183322', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170182664', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183280', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183283', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183282', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183284', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183286', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183287', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183289', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183290', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183292', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183293', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183295', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183297', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183278', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183296', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183294', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183291', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183288', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183285', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183281', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59),
(CURDATE(), 'Александр', 'Юрьевич', 'Шуст', '24а', '', '9282600203', 'Борисовка', '', '01170183298', 'd:\\Технические условия\\Борисовка\\Шуст_24_8_2017.docx', typeTu+0, 59);