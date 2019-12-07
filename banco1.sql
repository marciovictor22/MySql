create database if not exists escola;

use escola;

create table sala (
id_sala int auto_increment,
capacidade int,
andar int,
primary key (id_sala)
);

create table aluno (
id int auto_increment,
nome varchar (30),
email varchar(40),
telefone varchar(20),
altura decimal (3,2),
primary key (id)
);

insert into sala values (default, '40', '1');
insert into sala values (default, '35', '2');
insert into sala values (default, '70', '3');