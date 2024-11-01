Create database Banco_01_11;
USE Banco_01_11;
create table departamento (
id int primary key auto_increment not null,
nome varchar(50),
locali varchar(50),
orcamento decimal (10,2)
);
desc departamento;

insert into departamento (nome, locali, orcamento) 
values ("Freitas","Casa",70000),
("Luciana","Sorocaba",20000),
("Emerson","Sao Paulo",30000),
("Mary ","Bahia",900000),
("Luiz","Santa Catarina",43000),
("Matteo","RN",8700);

SHOW VARIABLES LIKE 'secure_file_priv';


select * from departamento
into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto2.csv'
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

SET SQL_SAFE_UPDATES=0;

delete from departamento; 

load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
into table departamento
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

start transaction;

-- Aumentar o orcamento do departamento do ti em 1000
update departamento set orcamento = orcamento + 1000.0 where nome = 'TI';

-- Aumentar o orcamento do departamento do financiero em 1000
update departamento set orcamento = orcamento + 1000.0 where nome = 'Financeiro';

-- confirmar a tranação
commit;