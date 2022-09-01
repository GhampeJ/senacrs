create table prods

(codigo numeric(3) NOT NULL,
nome varchar (50) NOT NULL,
preco numeric (5,2) not null,
tipo char(1) null,
-- [S]uprimento, [C]omponente,[P]eriférico
constraint PK1 primary key (codigo));

insert into prods
values(10,'HD', 200, 'C'),
(11,'Memoria', 250, 'C'),
(12,'Impressora', 680, 'P'),
(13,'Processador', 680, 'C'),
(14,'DVD-RW', 2, 'S'),
(15,'Papel A4', 19, 'S'),
(16,'Scanner', 199, 'P');

select*from prods;
-- exercicio A
select count(nome) as contagen
from prods;

-- exercicio B
select count(distinct tipo)  from prods;

-- exercicio C
select count(tipo) as P from prods where tipo = 'P';

select count(tipo) as C from prods where tipo = 'C';

select count(tipo) as S from prods where tipo = 'S';

-- exercicio D
select avg(preco) as mediatotal from prods;

-- exercicio E e F
select avg(preco) as mediaS from prods where tipo='S';
select avg(preco) as mediaP from prods where tipo='P';
select avg(preco) as mediaC from prods where tipo='C';
