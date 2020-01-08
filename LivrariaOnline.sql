create database if not exists livraria;
use livraria;

create table if not exists livro(
idLivro int not null unique auto_increment primary key,
nome varchar(50) not null unique,
descricao text,
total_paginas int,
autor varchar(30) not null unique,
livro_valor int
) engine = innodb;

create table if not exists cliente(
idCliente int not null unique auto_increment primary key,
nome varchar (50),
telefone varchar(12),
itens_de_compra varchar(50),
idLivro int
) engine = innodb;

create table if not exists caixa (
idCaixa int not null auto_increment primary key,
pagamento int,
itens_de_compra int,
idCliente int,
idLivro int
) engine = innodb;

create table if not exists carrinho(
idCarrinho int not null auto_increment primary key,
itens_de_compra int,
idCliente int,
idLivro int
) engine = innodb;

insert into livro values
(default, 'A Sutil Arte de Ligar o Foda-se', 'Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar ...', '224', 'Mark Manson', '26.90'),
(default, 'O Poder do Hábito', 'Durante os últimos dois anos, uma jovem transformou quase todos os aspectos de sua vida. Parou de fumar, correu uma maratona e foi promovida. Em um laboratório ...', '408', 'Charles Duhigg', '36.70'),
(default, 'Sapiens: Uma breve história da humanidade: 1288', '"Um dos maiores fenômenos editoriais dos últimos tempos. O que possibilitou ao Homo sapiens subjugar as demais espécies? O que ...', '592', 'Yuval Noah Harari', '16.10'),
(default, 'O milagre da manhã', 'Conheça o método simples e eficaz que vai proporcionar a vida dos sonhos ― antes das 8 horas da manhã! Hal Elrod ...', '196', 'Hal Elrod', '20.90');

insert into cliente values
(default, 'Joana', '975124536', 'O Poder do Habito', '2'),
(default, 'Marcio', '968409142', 'O milagre da manhã', '4'),
(default, 'Fernanda', '975452136', 'A Sutil Arte de Ligar o Foda-se', '1');

insert into caixa values
(default, '37', '1', '7', '2'),
(default, '21', '1', '8', '5'),
(default, '27', '1', '9', '1');

insert into carrinho values
(default, '1', '7', '2'),
(default, '1', '8', '4'),
(default, '1', '9', '1');


-- Adicionando Foreign Key - Chave Estrangeira
-- Tabela Cliente
alter table cliente
add constraint fk_Cliente_idLivro
foreign key (idLivro)
references livro (idLivro);

-- Tabela Caixa
alter table caixa
add constraint fk_idLivro
foreign key (idLivro)
references livro (idLivro);

alter table caixa
add constraint fk_caixa_idCliente
foreign key (idCliente)
references cliente (idCliente);

-- Tabela do Carrinho de compras
alter table carrinho
add constraint fk_carrinho_idCliente
foreign key (idCliente)
references cliente (idCliente);

alter table carrinho
add constraint fk_carrinho_idLivro
foreign key (idLivro)
references livro (idLivro);
