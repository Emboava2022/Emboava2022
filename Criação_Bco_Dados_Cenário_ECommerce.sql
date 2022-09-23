#Criação de Banco de Dados para o cenário de E-Commerce
create database ecommerce;
use ecommerce;
#drop database ecommerce;

#criar tabela cliente 


create table clientes(

	IdCliente int auto_increment primary key,
    Pnome varchar(10) not null,
    Nome_do_meio char(3),
    Sobrenome varchar(20),
    CPF char(11) not null,
    constraint unique_CPF_cliente unique (CPF),
    Endereço_Completo varchar(45),
    Data_Nascimento date not null
);

select c.Pnome, c.CPF, p.Descrição_Pedido from clientes
	as c inner join pedido as p on pedido.IdPedido = clientes.Pnome;

desc clientes;
select * from clientes;
select * from clientes where Sobrenome = 'Souza' order by Pnome;


alter table clientes auto_increment=1;



desc clientes;

create table pagamento(

	IdCliente int,
    IdPagamento int, 
    Tipo_Pagamento enum('Boleto', 'Cartão', 'Dois cartões'),
    Limite_disponível float,
    primary key(IdCliente, IdPagamento)
);


#criar tabela produto
#tamanho do produto equivale a dimensão dele 
 
 create table produto(
	
	IdProduto int auto_increment primary key,
    Nome_do_Produto varchar(15) not null,
    Classificação_etária bool default false,
    Categoria enum('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos','Móveis') not null,
    Avaliação float default 0,
    Tamanho varchar(10),
    Descrição varchar(45),
    Valor varchar(45) not null
 );
 
 desc produto;
 select * from produto;
 select * from produto where valor between 150.00 and 250.00 order by Descrição;
 select avg(valor) from produto;
 select sum(valor) from produto;
 select count(*) from produto;
 
##################################################################################
#criar tabela ordem

drop table pedido;

create table pedido(
	
	IdPedido int auto_increment primary key,
    IdPedido_Cliente int, #foreign key
    Pedido_Status enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    Descrição_Pedido varchar(255),
    Frete float default 10,
    Pagamento bool default false,
    constraint fk_IdPedido_Cliente foreign key (IdPedido_Cliente) references clientes(IdCliente)	
		on update cascade
);

desc pedido;
select * from pedido;

###################################################################################################

#criar tabela estoque

create table estoque(
	IdEstoque int auto_increment primary key,
    LocalEstoque varchar(255),
    Quantidade int default 0
);

desc estoque;
select * from estoque;
select * from estoque where Quantidade >=3000;


##################################################################################################

#criar tabela fornecedor 

create table fornecedor(
	IdFornecedor int auto_increment primary key,
    Razão_Social varchar(255) not null,
    CNPJ char(15) not null, 
    Contato char(11) not null,
    constraint unique_fornecedor unique (CNPJ)
);

desc fornecedor;
select * from fornecedor;
select * from fornecedor order by Razão_Social; 
select * from fornecedor order by CNPJ;

##########################################################################################

#criar tabela vendedor 

create table vendedor(
	IdVendedor int auto_increment primary key,
    CNPJ char(15),
    CPF char(11),
    Razão_Social varchar(255) not null,
    Localização varchar(255) not null ,
    Nome_Fantasia varchar(255),
    Contato char(11) not null,
    constraint unique_CNPJ_vendedor unique(CNPJ),
    constraint unique_CPF_vendedor unique(CPF)
);

select vendedor.Localização, vendedor.Nome_Fantasia, fornecedor.Razão_Social, fornecedor.CNPJ 
	from vendedor join fornecedor 
    on fornecedor.Idfornecedor = vendedor.Localização;

desc vendedor;
select * from vendedor;
select Razão_social, Localização, Contato from vendedor;
select distinct Localização from vendedor;
select * from vendedor where Localização like 'R%';
alter table vendedor add column Ano int;
select Ano,Localização, count(*) from vendedor 
	where Ano > 2000 group by Ano having Ano > 2000 order by count(*) desc;

###########################################################################################

create table produto_vendedor( #essa tabela herdará valores de id da tabela vendedor e tabela produto

	IdProdVendedor int, 
    IdProduto int,
    Quant_Produto int default 1,
    primary key (IdProdVendedor, IdProduto), #definindo a chave primária composta
    constraint fk_produto_vendedor foreign key (IdProdVendedor) references vendedor(IdVendedor),
    constraint fk_produto_vendedor_produto foreign key (IdProduto) references produto(IdProduto)
);

desc produto_vendedor;
select * from produto_vendedor;
alter table produto_vendedor add column Ano int;
select Ano, Quant_Produto, count(*) from produto_vendedor
	where Ano >= 1998 group by Ano having Ano >= 1998 order by count(*) desc;
    

################################################################################################

create table produto_pedido(
	IdProd_Pedido int,
    IdProd_Produto int,
    Produto_Quant int default 1,
    Status_Produto enum('Disponível', 'Sem Estoque') default 'Disponível',
    constraint fk_produto_pedido foreign key (IdProd_Pedido) references pedido(IdPedido),
    constraint fk_produto_produto foreign key (IdProd_Produto) references produto(IdProduto)
);

select * from produto_pedido;


################################################################################################

create table estoque_local(
	IdEstoque_Produto int,
    IdEstoque_Local int,
    Localização varchar(255),
    primary key (IdEstoque_Produto, IdEstoque_Local),
    constraint fk_prod_pedido foreign key (IdEstoque_Produto) references produto(IdProduto),
    constraint fk_prod_produto foreign key (IdEstoque_Local) references pedido(IdPedido)
);

select * from estoque_local;
select Localização from estoque_local;


###########################################################################################

create table produto_fornecedor(
	IdProd_Forn int,
    IdProd_Prod int,
    Quantidade_Prod int not null,
    constraint fk_prod_fornecedor foreign key (IdProd_Forn) references fornecedor (IdFornecedor),
    constraint fk_forn_produto foreign key (IdProd_Prod) references produto (IdProduto)
);

select * from produto_fornecedor;

################################################################################################

