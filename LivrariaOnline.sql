create database if not exists livraria;
use livraria;

create table if not exists livraria(
idLivraria int not null auto_increment primary key,
nome varchar(30),
email varchar(50),
cnpj varchar(18)
idFuncionario int,
) engine = innodb;

create table if not exists livro(
idLivro int not null auto_increment primary key,
idLivraria int,
idEditora int,
idGenero int,
idAutor int,
nome varchar(50) not null unique,
descricao text,
total_paginas int,
livro_valor decimal(6,2),
ano_de_publicacao varchar(4),
edicao varchar(3)
) engine = innodb;

create table if not exists cliente(
idCliente int not null unique auto_increment primary key,
nome varchar (50),
telefone varchar(12),
idLivro int
) engine = innodb;

create table if not exists caixa (
idCaixa int not null auto_increment primary key,
pagamento decimal(6,2),
cliente int,
livro int
) engine = innodb;


create table if not exists carrinho(
idCarrinho int not null auto_increment primary key,
cliente varchar(20),
livro int
) engine = innodb;

create table if not exists genero (
idGenero int auto_increment not null primary key,
idLivro int,
nome varchar(25)
) engine = innodb;

create table if not exists funcionario (
idFuncionario int not null auto_increment primary key,
idLivraria int,
nome varchar(25),
email varchar(50),
matricula varchar(7),
cargo varchar(25)
) engine = innodb;

create table if not exists editora (
idEditora int not null auto_increment primary key,
nome varchar(25),
cnpj varchar(18)
idLivro int,
) engine = innodb;

insert into livraria values
(default, 'PUD - Livraria Online', 'pudlivrariaonline@gmail.com', '00.111.000/0001-01');

insert into livro values
( default, 'A Sutil Arte de Ligar o Foda-se', 'Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar ...', '224', 'Mark Manson', '26.90', 'Intrínseca', '2017', '1ª'),
( default, 'O Poder do Hábito', 'Durante os últimos dois anos, uma jovem transformou quase todos ...', '408', 'Charles Duhigg', '36.70', 'Objetiva', '2012', '1ª'),
( default, 'Sapiens: Uma breve história da humanidade: 1288', '"Um dos maiores fenômenos editoriais dos ...', '592', 'Yuval Noah Harari', '16.10', 'L&PM', '2015', '1ª'),
( default, 'O milagre da manhã', 'Conheça o método simples e eficaz que vai proporcionar a vida dos sonhos ― antes das 8 horas da manhã! Hal Elrod ...', '196', 'Hal Elrod', '20.90', 'BestSeller', '2016', '56ª');

insert into cliente values
(default, 'Joana', '975124536', '2'),
(default, 'Marcio', '968409142', '4'),
(default, 'Fernanda', '975452136', '1');

insert into caixa values
(default, '36.90', '1', '2'),
(default, '20.90', '2', '4'),
(default, '36.90', '3', '1');

insert into carrinho values
(default, '1', '2'),
(default, '2', '4'),
(default, '3', '1');

insert into genero values
(default, 'Autobiografia'),
(default, 'Biografia'),
(default, 'Fantasia'),
(default, 'Fantasia Científica'),
(default, 'Horror'),
(default, 'Paródia'),  
(default, 'Suspense'),
(default, 'Drama'),
(default, 'Mistério'),
(default, 'Romance'),
(default, 'Aventura'),
(default, 'Luta'),
(default, 'Terror'),
(default, 'Ação');

insert into funcionario values
(default, 'Luis Carlos', 'luiscarlos@gmail.com', '1234567', 'Balconista'),
(default, 'Alessandra Rocha', 'alessadrarocha@gmail.com', '2345678', 'Gerente'),
(default, 'Felipe Ferreira', 'felipeferreira@gmail.com', '3456789', 'Segurança'),
(default, 'Layla Santos', 'laylasantos@gmail.com', '4567891', 'Estágiaria');

insert into editora values
(default, 'Intrínseca', '06.985.027/0001-67'),
(default, 'Objetiva', '10.261.558/0001-84'),
(default, 'L&PM', '87.932.463/0001-70'),
(default, 'BestSeller', '04.839.149/0001-10');
