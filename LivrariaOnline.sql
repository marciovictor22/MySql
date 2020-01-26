create database if not exists livraria;
use livraria;

create table if not exists livro(
idLivro int not null auto_increment primary key,
nome varchar(50) not null unique,
descricao text,
total_paginas int,
autor varchar(30) not null unique,
livro_valor decimal(6,2)
) engine = innodb;

create table if not exists cliente(
idCliente int not null unique auto_increment primary key,
nome varchar (50),
telefone varchar(12),
livro int
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
nome varchar(25)
) engine = innodb;


insert into livro values
( default, 'A Sutil Arte de Ligar o Foda-se', 'Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar ...', '224', 'Mark Manson', '26.90'),
( default, 'O Poder do Hábito', 'Durante os últimos dois anos, uma jovem transformou quase todos ...', '408', 'Charles Duhigg', '36.70'),
( default, 'Sapiens: Uma breve história da humanidade: 1288', '"Um dos maiores fenômenos editoriais dos ...', '592', 'Yuval Noah Harari', '16.10'),
( default, 'O milagre da manhã', 'Conheça o método simples e eficaz que vai proporcionar a vida dos sonhos ― antes das 8 horas da manhã! Hal Elrod ...', '196', 'Hal Elrod', '20.90');

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

-- --------------------  Ligando as Tabelas  --------------------
create table if not exists cliente_livro (
idCliente int,
idLivro int
) engine = innodb;

create table if not exists caixa_cliente_livro (
idcaixa int,
idcliente int,
idlivro int
) engine = innodb;

create table if not exists carrinho_cliente_livro (
idCarrinho int,
idCliente int,
idLivro int
) engine = innodb;

-- Adicionando Foreign Key - Chave Estrangeira
-- cliente_livro
alter table cliente_livro
add constraint `fk_cliente` foreign key (`idCliente`)
references `livraria`.`cliente` (`idCliente`);

alter table cliente_livro
add constraint `fk_cliente_livro` foreign key (`idLivro`)
references `livraria`.`livro` (`idLivro`);

-- caixa_cliente_livro
alter table caixa_cliente_livro
add constraint `fk_caixa` foreign key (`idCaixa`)
references `livraria`.`caixa` (`idCaixa`);

alter table caixa_cliente_livro
add constraint `fk_caixa_cliente` foreign key (`idCliente`)
references `livraria`.`cliente` (`idCliente`);

alter table caixa_cliente_livro
add constraint `fk_caixa_livro` foreign key (`idLivro`)
references `livraria`.`livro` (`idLivro`);

-- carrinho_cliente_caixa
alter table carrinho_cliente_livro
add constraint `fk_carrinho` foreign key (`idCarrinho`)
references `livraria`.`carrinho` (`idCarrinho`);

alter table carrinho_cliente_livro
add constraint `fk_carrinho_cliente` foreign key (`idCliente`)
references `livraria`.`cliente` (`idCliente`);

alter table carrinho_cliente_livro
add constraint `fk_carrinho_livro` foreign key (`idLivro`)
references `livraria`.`livro` (`idLivro`);
