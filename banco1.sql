-- Criar a base de dados se NÃO existir 'escola'?
create database if not exists escola;

-- Vai usar a base de dados escola?
use escola;

-- Criar a tabela Sala?
create table sala (
id_sala int auto_increment,
capacidade int,
andar int,
primary key (id_sala)
);

-- OU ?
/*
create table sala (
id_sala int auto_increment primary key,
capacidade int,
andar int,
);
*/

-- Criar tabela aluno?
create table aluno (
id int auto_increment,
nome varchar (30),
email varchar(40),
telefone varchar(20),
altura decimal (3,2),
primary key (id)
);

-- OU ?
/*
create table aluno (
id int auto_increment primary key,
capacidade int,
andar int,
);
*/

-- Insira dentro da tabela 'sala' os valores...?
insert into sala values (default, '40', '1');
insert into sala values (default, '35', '2');
insert into sala values (default, '70', '3');

-- Insira dentro da tabela 'aluno' os valores...?
insert into aluno values (default, 'Marcio', 'marcio@xyz.com.br', '12345-1234', '1.70');
insert into aluno values (default, 'Victor', 'victor@xyz.com.br', '12345-1234', '1.80');
insert into aluno values (default, 'Luciana', 'luciana@xyz.com.br', '12345-1234', '1.50');

-- atualizar a tabela aluno no conjunto/coluna telefone onde(id)?
update aluno
set telefone = '34991234567'
where id = 3;

select * from aluno;
