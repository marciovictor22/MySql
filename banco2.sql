create database if not exists empresa;

use empresa;

create table cargo (
Codcargo char(2) not null primary key,
Nomecargo varchar(50),
Valorcargo double null
) Engine = InnoDB;


create table funcionario (
Matricula int not null primary key,
NomeFuncionario varchar(50),
Codcargo char(2),
foreign key (Codcargo)
references cargo(Codcargo)
) Engine = InnoDB;

insert into cargo values
('C1',  'Caixa', '800.00'),
('C2',  'Vendedor', '1200.00'),
('C3',  'Gerente', '2400.00');

insert into funcionario values
(100, 'João', 'C1'),
(110, 'Maria', 'C2'),
(120, 'Carlos', 'C1'),
(130, 'Tadeu', Null);

/* Cross Join
select F.NomeFuncionario, C.NomeCargo
from Cargo as c
cross join funcionario as f;
*/

/* Inner Join
select F.NomeFuncionario, C.NomeCargo
from Cargo as c
inner join funcionario as f
on F.Codcargo = C.Codcargo;
*/

/*Left Outer Join
select F.NomeFuncionario, C.NomeCargo
from funcionario as f
left outer join cargo as c
on C.Codcargo = F.Codcargo;
*/

/*Right Join
select F.NomeFuncionario, C.NomeCargo
From Funcionario as F
Right outer join Cargo as C
ON C.CodCargo = F.CodCargo;
*/

/*Union
select F.NomeFuncionario, C.NomeCargo
from funcionario as f
left outer join cargo as c
on C.Codcargo = F.Codcargo
union
select F.NomeFuncionario, C.NomeCargo
from funcionario as f
right outer join cargo as c
on C.Codcargo = F.Codcargo;
*/

/* Limit - Especifica a quantidade de registros
que serão retornados.
select F.*
from funcionario as f
limit 2;
*/

/* Like – Operador de comparação baseado em
um padrão.
SELECT F.*
FROM FUNCIONARIO AS F
WHERE F.NomeFuncionario LIKE 'J%';

SELECT F.*
FROM FUNCIONARIO AS F
WHERE F.NomeFuncionario LIKE '%A';

SELECT F.*
FROM FUNCIONARIO AS F
WHERE F.NomeFuncionario LIKE '%R%';
*/

/* Count - Retorna a quantidade de registros.
select count(C.Codcargo)
from cargo as c;
*/

/* AVG – Média dos valores de uma coluna do tipo
numérica.
select AVG(C.ValorCargo)
From Cargo as C;
*/

/* Max - Retorna o maior valor de uma coluna.
select MAX(C.ValorCargo)
From Cargo as C;
*/

/* Min – Retorna o menor valor de uma coluna.
select MIN(C.ValorCargo)
From Cargo as C;
*/

/* Sum – Retorna a soma dos valores de uma
coluna. 
select sum(C.ValorCargo)
From Cargo as C;
*/

/* Round – Retorna o valor de uma coluna
arredondado.
select round(avg(C.ValorCargo))
From Cargo as C;

select round(avg(C.ValorCargo),2)
From Cargo as C;
*/

/* Now – Retorna a data atual no MYSQL.
select now()
from cargo as c;
*/

-- Questão D - Faça uma seleção dos funcionário que começam com “J” e que o cargo seja "CAIXA".   
select *
from funcionario as f
inner join cargo as c
on f.codcargo = c.codcargo
where Nomefuncionario like 'J%';

select * from funcionario;


-- Continuação

insert into cargo values
('C4', 'Estoquista', '1200.00'),
('C5', 'Contador', '2000.00');

-- Mostrar os Valores de forma decrescente
select * from cargo
order by valorcargo desc
limit 2;

-- Ordenar o Nome dos Funcionarios da Tabela Funcionarios
select*
from funcionario
order by nomefuncionario;

-- Mostrar todos os Funcionarios que tenha o cargo Caixa
select f.*
from funcionario as f
inner join cargo as p
on f.codcargo = p.codcargo
where f.nomefuncionario like 'j%'
and p.nomecargo = 'caixa';

-- Questão M
SELECT F.*, C.*
FROM funcionario  as F
INNER JOIN cargo as C
ON F.codcargo = C.codcargo
WHERE C.valorcargo < (SELECT AVG(valorcargo) from cargo);
