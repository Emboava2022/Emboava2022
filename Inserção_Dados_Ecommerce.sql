use ecommerce;

insert into clientes (Pnome, Nome_do_meio, Sobrenome, CPF, Endereço_Completo, Data_Nascimento) 
	values	('Maria', 'L', 'Souza', 30090015025, 'Rua Tagipuru, nº50', '1985-06-25'),
			('Solange', 'M', 'Frota', 15015033385, 'Rua Canadá, nº120', '1975-05-04'),
            ('Margareth', 'S','Diniz', 35099815020, 'Rua Curitina, nº150', '1965-04-01'),
            ('Diego', 'H', 'Andrade', 34555569811, 'Rua Bela Cintra, nº200', '1995-06-25'),
            ('Bernardo', 'B', 'Siqueira', 33969854520, 'Rua Andradina, nº250', '2000-05-20'),
			('João', 'S', 'Lima', 40015033185, 'Rua Bresses, nº100', '1988-07-20');
            
select * from clientes;

############################################################################################

insert into produto(Nome_do_Produto,Classificação_etária,Categoria,Avaliação,Tamanho, Descrição,Valor)
	values 	('Fone de ouvido', false,'Eletrônico', '5', null, 'Fone de ouvido sem fio', 150.00),
			('Barbie', true, 'Brinquedos', '5', null, 'Boneca Barbie', 250.00),
            ('Body', true, 'Vestuário', '4', 5,'Body Feminino', 100.00),
            ('Cesta Básica', false, 'Alimentos', '5', null, 'Cesta de alimentos', 75.00),
            ('Sofá 2 lugares', false, 'Móveis', '5', '220X130', 'Sofá de linho', 1250.00);
            
select * from produto;

############################################################################################

insert into pedido(IdPedido_Cliente, Pedido_Status, Descrição_Pedido, Frete, Pagamento)
	values 	(1,default, 'Compra via aplicativo', 12.5, 0),
			(2,default, 'Compra via website', 12.5,1),
            (3, 'Confirmado',null, null,1),
            (4,default,'Compra via website',12.5,0);
            
select * from pedido;

############################################################################################

insert into estoque(LocalEstoque, Quantidade) values
	('São Paulo', 1000),
    ('Rio de Janeiro', 2000),
    ('Paraná', 3000),
    ('Bahia', 5000);
    
select * from estoque;

###########################################################################################

insert into fornecedor(Razão_Social, CNPJ, Contato) values
	('Armarinhos Fernando', 25195188145855, 1125535566),
    ('Briquedos Suarez', 33195444585558, 1155667788),
    ('Mobilia Legal', 99157455452285, 1130556999),
    ('Alegretti Roupas', 30158444585774, 4130356969);
    
select * from fornecedor;

###########################################################################################

insert into vendedor(CNPJ, CPF, Razão_Social, Localização, Nome_Fantasia, Contato) values
	(30355566699901, null, 'Aliança Brinquedos SA', 'Ribeirão Preto','João SA', 1130302001),
    (30355566699902, null, 'Contes Móveis SA', 'Andradina', 'João Contes SA', 3130302002),
    (null, 30090030001, 'Carla Silva', 'São Paulo', null, 1130302003),
    (null, 30090030002, 'Daniel Silva', 'Rio de Janeiro', null, 2130302004),
    (30355566699903, null, 'Alves Roupas SA', 'Bahia', 'Carlos Alves Vestuário SA', 7130302005);
    
select * from vendedor;

############################################################################################


    

