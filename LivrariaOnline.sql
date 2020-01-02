create database if not exists livraria;
use livraria;

create table if not exists livro(
nome varchar(20) not null unique,
descricao text,
total_paginas int,
autor varchar(30) not null unique  primary key,
estoqe int,
quantidade int
);

create table if not exists cliente(
id int not null auto_increment primary key,
nome varchar (30),
email varchar(40),
telefone varchar(12),
compra int
);

create table if not exists caixa (
pagamento decimal(3,2),
itens_venda int
);
