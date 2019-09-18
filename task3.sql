# Создание тестовой DATABASE
create database test;
use test;

# Создание Таблицы country_tab
create table country_tab (id INT UNSIGNED NOT NULL AUTO_INCREMENT, code char(3) NOT NULL unique,
  name char(52) NOT NULL unique,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)); 
  
  # INSERT
  INSERT INTO country_tab (name , code) value('China', 'ch');
  INSERT INTO country_tab  value(default, 'kh','Korea', DEFAULT);
  insert into country_tab SET name='Ispania', code='is';
  insert into country_tab (name, code) value ('France','fr'),('Italy','it'),('Greek','gr');
  insert IGNORE into country_tab SET name='Ispania', code='is';
 
# для заполнения используем example base MYSQL world Table country 
# первые 10 строк
insert IGNORE INTO  country_tab (code,name) 
	select code,name  from world.country Limit 10; 


#SELECT
select * from  country_tab;
select id, CONCAT(name, code) as name_code from  country_tab order by name DESC limit 4;
select * from  country_tab order by name DESC limit 4;
select name , DAY(created_at) from country_tab order by name DESC limit 4;
select distinct DAY(created_at) from country_tab order by name DESC limit 4;
select name from country_tab order by name DESC   limit 4 OFFSET 2;
 
 
  # REPLACE
  # поля name и code установлены unique
 REPLACE INTO country_tab (name , code) value('China', 'ssh');
 REPLACE INTO country_tab  value(default, 'khh','Korea', DEFAULT);
 REPLACE into country_tab SET name='Ispaniola', code='is';
 REPLACE into country_tab (name, code) value ('Franc','fr'),('Ital','it'),('Greek','gr'); 

  

  # update
 
#UPDATE IGNORE country_tab Set created_at='2019';

UPDATE country_tab SET name = 'Africa' WHERE name = 'Andorra';
UPDATE IGNORE country_tab SET name = 'Andorraaaa' WHERE name = 'Africa';

#DELETE

DELETE FROM country_tab WHERE name = 'Albania';
DELETE FROM country_tab ORDER BY name DESC LIMIT 5 ;


# TRUNCATE
TRUNCATE country_tab;

Select * from country_tab;  



