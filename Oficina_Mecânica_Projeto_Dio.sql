create database mecânica;
use mecânica;
#drop database mecânica; 


create table clientes(
	IdClientes int primary key auto_increment,
	Nome varchar(45) not null,
    CPF char(11) not null,
    Endereço varchar(50) not null,
    Telefone char(15) not null    
);

desc clientes;
select * from clientes;
select Nome,CPF from clientes;
select Nome,CPF from clientes order by CPF;

alter table clientes add column veículos int; #criação coluna para chave estrangeira 
alter table clientes add foreign key (veículos) references veículo_cliente(IdVeículo_cliente); #criando a chave estrangeira

update clientes set veículos = '6' where IdClientes = '2'; #inserindo os dados das chaves 

#Solicitando os dados da tabela cliente como nome e CPF e juntando com a tabela veíulos para saber a quem corresponde cada veículo.

select clientes.Nome, clientes.CPF, veículo_cliente.modelo_veículo from clientes
	inner join veículo_cliente on veículo_cliente.IdVeículo_Cliente = clientes.veículos;


# Inserindo dados na tabela clientes.

insert into clientes(Nome, CPF, Endereço, Telefone)
	values	('Andréia Batista', 40097866530, 'Rua Estácio, nº200', 1120852060); 
    

#############################################################################################

create table veículo_cliente(
	IdVeículo_Cliente int auto_increment primary key,
    placa_veículo char(10) unique not null, 
    última_revisão date,
    modelo_veículo varchar(45)
);


select * from veículo_cliente;
select modelo_veículo, última_revisão from veículo_cliente;

# Inserindo dados na tabela veículo_cliente.

insert into veículo_cliente(placa_veículo, última_revisão, modelo_veículo)
	values 	('ADP-6545', '2021-08-20', 'Astra Sedã');
    
############################################################################################

create table Setor_Avaliação(
	IdAvaliação int auto_increment primary key,
    Revisão varchar(45),
    Reparo varchar(45)
);    

insert into Setor_Avaliação(Revisão, Reparo)
	values  ('Sim', 'Não'),
			('Sim', 'Sim'),
            ('Não', 'Sim'),
            ('Não', 'Não');
            
update Setor_Avaliação set veículos = '6' where IdClientes = '2'; #inserindo os dados das chaves 


alter table Setor_Avaliação add column veículos_avaliados int; 
alter table Setor_Avaliação add foreign key (veículos_avaliados) references veículo_cliente(IdVeículo_Cliente); 

desc Setor_Avaliação;
select * from Setor_Avaliação;
    
############################################################################################

create table OS_Serviço(
	IdOS_Serviço int auto_increment primary key,
    Serviço_OS enum('Mecânica', 'Elétrica'),
    Valor float not null,
    Valor_Peça float not null,
    Status_OS enum('Processando', 'Aberto', 'Em serviço', 'Negada') default 'Processando'
);

insert into OS_Serviço (Serviço_OS, Valor, Valor_Peça, Status_OS)
	values 	('Mecânica', '150.60', '80.00', 'Aberto'),
			('Elétrica', '550.80', '180.00', 'Em serviço'),
            ('Mecânica', '850.00', '250.00', 'Processando'),
            ('Elétrica', '2500.80', '630.35', 'Negada');

select * from OS_Serviço;

############################################################################################

alter table revisão add column Revisão_Veículo varchar(45);
create table revisão(
	IdRevisão int auto_increment primary key,
    Elétrica varchar(45) not null,
    Mecânica varchar(45) not null
);


insert into revisão(Elétrica, Mecânica)
	values	('Sim', 'Não'),
			('Não', 'Não'),
            ('Não', 'Sim'),
            ('Sim', 'Sim');
            
            
select * from revisão;
update revisão set Revisão_Veículo = '4' where IdRevisão = '4'; #inserindo os dados das chaves 

############################################################################################

create table Mecânicos(
	Id_Mecânicos int auto_increment primary Key,
    Nome varchar(45),
    Registro_empregado int(6) not null unique,
    RG char(9) not null, 
    Endereço varchar(45),
    Especialidade varchar(45)
);

alter table Mecânicos add column veículos_revisados int;
alter table Mecânicos add column OS_revisados int;
alter table Mecânicos add foreign key (OS_revisados) references  OS_Serviço(IdOS_SErviço); 
alter table Mecânicos add foreign key (veículos_revisados) references revisão(IdRevisão); 

insert into Mecânicos(Nome, Registro_empregado, RG, Endereço, Especialidade)
	values  ('Maria Chadid', '106', '301112521', 'Rua Cariri, nº 200', 'Eletricista III');
    
desc Mecânicos;
select * from Mecânicos;
    
  
    
############################################################################################
			
          
