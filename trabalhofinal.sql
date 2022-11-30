create database trabalho_final_BD;
use trabalho_final_BD;
-- 5 definir um tipo de delete
create table trainer(
         ID_Trainer int not null primary key auto_increment,
         nome varchar(50),
         Badge_amount int not null,
         Pokemon_amount int not null,
         Pokemons_on_Team int not null,
         constraint fk_idpokemon foreign key (ID_pokemon)
         references POKEMON(ID_pokemon)
         on delete cascade
    );
    -- ao deletar um pokemon (table mae) o trainer com o mesmo id sera deletado(tabela filha)
  create table pokeball_BD(
		ID_Pokeball int not null primary key auto_increment,
        quantidade int,
        tipo varchar(50)
    );
  create table  ITENS_BD(
        ID_itens int not null primary key auto_increment,
        quantidade int,
		tipo varchar(50)
    );
    create table HEALING_BD(
		ID_healing int not null primary key auto_increment,
        quantidade int,
		tipo varchar(50)
    );
   create table GYM(
    ID_ginasio int not null primary key auto_increment,
	lider varchar(50),
    insignia varchar(50),
	tipo varchar(50)
    );
    create table POKEMON (
        ID_pokemon int not null primary key auto_increment,
        nome varchar(50),
        geracao int not null,
        tipo varchar(50),
        nivel int not null,
        lendario varchar(50),
         constraint fk_idtrainer foreign key (ID_Trainer)
         references trainer(ID_Trainer)
         on delete cascade
    );
     -- ao deletar um trainer (table mae) o pokemon com o mesmo id sera deletado(tabela filha)
        create table Evo_Stone(
		ID_Evo_Stone int not null primary key auto_increment,
        quantidade int,
		tipo varchar(50)
        );
        
        select*from trainer;
        select*from pokeball_BD;
        select*from ITENS_BD;
        select*from HEALING_BD;
        select*from GYM;
        select*from POKEMON;
        select*from Evo_Stone;
        
        


        
-- 6 trazer cinco consultas com inner
        
select trainer.nome,POKEMON.tipo 
from trainer inner join POKEMON on trainer.ID_Trainer= POKEMON.ID_pokemon
where tipo like '%dragão%';
       
-- mostra todos os treinadores que tem pokemons do tipo dragão
       
select trainer.nome,ITENS_BD.tipo 
from trainer inner join ITENS_BD on trainer.ID_Trainer= ITENS_BD.ID_itens
where tipo like 'ETHER';
       
-- mostra o treinador que tem o item ether
       
select trainer.nome,POKEMON.nivel 
from trainer inner join POKEMON on trainer.ID_Trainer= POKEMON.ID_pokemon
where nivel >=30 ;
       
-- motra os treinadores que tem pokemons com nivel 30 ou +
       
select trainer.nome,EVO_STONE.tipo 
from trainer inner join EVO_STONE on trainer.ID_Trainer= EVO_STONE.ID_Evo_Stone
where tipo like 'fogo' ;
       
-- mostra o treinador que tem um evo stone de fogo
       
select trainer.nome,POKEMON.tipo 
from trainer inner join POKEMON on trainer.ID_Trainer= POKEMON.ID_pokemon
where tipo like '%fogo%';
       
-- mostra os treinadores que tem pokemons que tem tipo fogo
       
-- 7 trazer cinco consultas com order by
      
select*from trainer
order by nome asc;
       
-- mostra o nomes dos treinadores em orfem alfabetica
       
select*from trainer
order by Badge_amount desc;
       
-- mostra quem tem mais pra quem tem menos insignias
       
select*from trainer
order by Pokemon_amount desc;
       
-- mostra em ordem de quem tem mais pokemons
       
select*from trainer
order by Pokemons_on_Team desc;
       
-- mostra quem tem mais pokemons no time
       
select*from POKEMON
order by nome desc;
	   
-- mostra o nome dos pokemons em ordem decrescente
       
-- 8 trazer cinco consultas com group by
       
select nome, pokemons_on_Team 
from  trainer where Badge_amount = 8 group by nome;
		
-- mostra quantos pokemons no time os treinadores com 8 insignias tem

select lider, tipo
from  GYM where insignia like 'insignia do trio%' group by lider;

-- mostra todos os lideres e os tipos do ginasio que da a insignia do trio

select quantidade
from  HEALING_BD where tipo like '%POTION%' group by quantidade;

-- mostra a quantidades de todos os tipos de potions

select nome, tipo
from  POKEMON where lendario= 'true' group by nome;

-- mostra o nome e o tipo dos pokemons lendarios
       
select tipo,quantidade
from  ITENS_BD where tipo like '%ETHER%' group by tipo;      

-- mostra a quantidade de todos os tipos de ether 

-- 9 trazer tres consultas que combinem order by e join
select trainer.nome, trainer.Pokemons_on_Team,POKEMON.nome from trainer
inner join POKEMON ON trainer.ID_Trainer = POKEMON.ID_pokemon
order by trainer.nome desc, pokemon.nome;

-- essa consulta junta os trainers e seus pokemons respectivos

select trainer.nome,pokeball_BD.quantidade,pokeball_BD.tipo from trainer
inner join pokeball_BD ON trainer.ID_Trainer = pokeball_BD.ID_pokeball
order by trainer.nome asc, pokeball_BD.tipo;

-- mostra a quantidade de item e o tipo que cada um treinador tem

select trainer.nome, GYM.lider from trainer
inner join GYM ON trainer.ID_Trainer = GYM.ID_ginasio
order by trainer.nome asc, GYM.lider;

-- a consulta traz o ultimo lider que cada um treinador enfrentou  

-- 10 trazer sete consultas com funções matematica (avg,e.g,sum)

select round(AVG(badge_amount)) from trainer;

-- media de insinias

select round(AVG(Pokemon_amount)) from trainer;

-- media de pokemons capturados

select round(AVG(Pokemons_on_Team)) from trainer;

-- a media de pokemons nos times

select min(badge_amount),max(badge_amount) from trainer;

-- mostra o numero minimo e maximo de insignias

select sum(quantidade) from HEALING_BD;

-- soma todos os itens de healing

select round(AVG(nivel)) from POKEMON;

-- mostra a media de nivel dos pokemons

select max(nivel) from POKEMON;

-- mostra o maior level

-- 11 criar cinco visoes

create view lendario
as select nome, tipo
from POKEMON
where lendario like 'true'; 

select*from lendario;    

-- cria uma visão que mostra apenas pokemons lendarios e seus tipos 

create view pokemons_level_um
as select nome
from POKEMON
where nivel= 1;

select*from pokemons_level_um;

-- mostra o nome de todos os pokemons level um

create view liders_do_tipo_dragao
as select lider
from GYM
where tipo like '%dragao%';

select*from liders_do_tipo_dragao;

-- mostra os lideres que treinam tpos dragoes

create view treinadores_times
as select nome, Pokemons_on_Team
from trainer
where Pokemon_amount >= 156;

select*from treinadores_times;
 
-- mostra a quantidade de pokemons nos times de quem tem mais de 156

create view tipos_de_pokebolas_com_mais_de_vinte
as select tipo
from pokeball_BD
where quantidade >= 20;

select*from tipos_de_pokebolas_com_mais_de_vinte;

-- mostra os tipos de pokebolas que tem 20 ou mais

 -- 12 criar cinco savepoints 
 
 start transaction;
 
 savepoint savepoint1;
 insert into ITENS_BD values(16,666,'pokeball');
 
 savepoint savepoint2;
 insert into ITENS_BD values(17,22,'masterball');
 
 savepoint savepoint3;
 insert into ITENS_BD values(18,100,'potion');
 
 savepoint savepoint4;
 insert into ITENS_BD values(19,30,'stone');
 
 savepoint savepoint5;
 insert into ITENS_BD values(20,10,'ultraball');
 -- 13 criar tres usuarios distintos      
 
 create user 'so pode ver'@'localhost';
 
 grant all on lendario.* to 'so pode ver'@'localhost';
 grant all on pokemons_level_um.* to 'so pode ver'@'localhost';
 grant all on liders_do_tipo_dragao.* to 'so pode ver'@'localhost';
 grant all on treinadores_times.* to 'so pode ver'@'localhost';
 grant all on tipos_de_pokebolas_com_mais_de_vinte.* to 'so pode ver'@'localhost';
 
 -- usuario so pode ver as views
 
 create user 'pode so inserir'@'localhost';
 
 grant insert on lendario.* to 'pode so inserir'@'localhost';
 grant insert on pokemons_level_um.* to 'pode so inserir'@'localhost';
 grant insert on liders_do_tipo_dragao.* to 'pode so inserir'@'localhost';
 grant insert on treinadores_times.* to 'pode so inserir'@'localhost';
 grant insert on tipos_de_pokebolas_com_mais_de_vinte.* to 'pode so inserir'@'localhost';
 
 -- usuario so pode inserir
 
 create user 'so pode ver'@'local host';
 
grant select on lendario.* to 'so pode ver'@'localhost';
grant select on pokemons_level_um.* to 'so pode ver'@'localhost';
grant select on liders_do_tipo_dragao.* to 'so pode ver'@'localhost';
grant select on treinadores_times.* to 'so pode ver'@'localhost';
grant select on tipos_de_pokebolas_com_mais_de_vinte.* to 'so pode ver'@'localhost';
 
 -- usuario so pode ver
