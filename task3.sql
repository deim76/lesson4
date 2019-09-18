# Создание тестовой DATABASE
CREATE DATABASE test;
USE test;

# Создание Таблицы country_tab
CREATE TABLE country_tab (id INT UNSIGNED NOT NULL AUTO_INCREMENT, code char(3) NOT NULL unique,
  name char(52) NOT NULL unique,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)); 
  
  # INSERT
  INSERT INTO country_tab (name , code) value('China', 'ch');
  INSERT INTO country_tab  value(default, 'kh','Korea', DEFAULT);
  INSERT INTO country_tab SET name='Ispania', code='is';
  INSERT INTO country_tab (name, code) value ('France','fr'),('Italy','it'),('Greek','gr');
  INSERT IGNORE INTO country_tab SET name='Ispania', code='is';
 
# для заполнения используем example base MYSQL world Table country 
# первые 10 строк
INSERT IGNORE INTO  country_tab (code,name) 
	SELECT code,name  from world.country Limit 10; 


#SELECT
SELECT * FROM  country_tab;
SELECT id, CONCAT(name, code) as name_code FROM  country_tab ORDER BY name DESC LIMIT 4;
SELECT * FROM  country_tab ORDER BY name DESC limit 4;
SELECT name , DAY(created_at) FROM country_tab ORDER BY name DESC LIMIT 4;
SELECT distinct DAY(created_at) FROM country_tab ORDER BY name DESC LIMIT 4;
SELECT name FROM country_tab ORDER BY name DESC   LIMIT 4 OFFSET 2;
 
 
  # REPLACE
  # поля name и code установлены unique
 REPLACE INTO country_tab (name , code) value('China', 'ssh');
 REPLACE INTO country_tab  value(default, 'khh','Korea', DEFAULT);
 REPLACE INTO country_tab SET name='Ispaniola', code='is';
 REPLACE INTO country_tab (name, code) value ('Franc','fr'),('Ital','it'),('Greek','gr'); 

  

  # update
 
#UPDATE IGNORE country_tab Set created_at='2019';

UPDATE country_tab SET name = 'Africa' WHERE name = 'Andorra';
UPDATE IGNORE country_tab SET name = 'Andorraaaa' WHERE name = 'Africa';

#DELETE

DELETE FROM country_tab WHERE name = 'Albania';
DELETE FROM country_tab ORDER BY name DESC LIMIT 5 ;


# TRUNCATE
TRUNCATE country_tab;

SELECT * FROM country_tab;  



