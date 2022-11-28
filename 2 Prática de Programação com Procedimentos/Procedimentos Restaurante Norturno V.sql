#Banco de Dados do Restaurante Noturno
create database bd_Restaurante_1;
use bd_Restaurante_1;

create table Funcionario (
id_fun int primary key auto_increment,
nome_fun varchar(300) not null,
cpf_fun varchar(100) not null,
rg_fun varchar(100),
data_nasc_fun date,
sexo_fun varchar(100),
telefone_fun varchar (300),
email_fun varchar(300),
funcao_fun varchar(300)
);

create table Entregador_App (
id_app int primary key auto_increment,
nome_app varchar(300) not null,
cpf_app varchar(100) not null,
rg_app varchar (100),
data_nasc_app date,
sexo_app varchar(100),
celular_app varchar(100),
email_app varchar(300),
aplicativo_app varchar(100)
);

create table Mesa (
id_mes int primary key auto_increment,
numero_mes int not null,
capacidade_mes int,
status_mes varchar(100),
cor_mes varchar(100),
nivel_mes varchar(100)
);

create table Fornecedor(
id_for int primary key auto_increment,
razao_social_for varchar(300) not null,
nome_fantasia_for varchar(300),
cnpj_for varchar(100) not null,
endereco_for varchar(300),
celular_for varchar(100),
email_for varchar(300)
);

create table Cliente(
id_cli int primary key auto_increment,
nome_cli varchar(300) not null,
cpf_cli varchar(300) not null,
rg_cli varchar(100),
sexo_cli varchar(100),
data_nascimento_cli date,
celular_cli varchar(100),
endereco_cli varchar(300),
email_cli varchar(300)
);

create table Reserva (
id_res int primary key auto_increment,
data_solicitacao_res date,
horario_solicitacao_res time,
data_reservada_res date not null,
horario_reservado_res time not null,
numero_pessoas_res int not null,
id_cli_fk int not null,
foreign key (id_cli_fk) references Cliente (id_cli),
id_mes_fk int not null,
foreign key (id_mes_fk) references Mesa (id_mes)
);

create table Caixa (
id_cai int primary key auto_increment,
numero_cai int not null,
data_cai time not null,
horario_abertura_cai time,
saldo_inicial_cai float not null,
total_recebimentos_cai float,
total_pagamentos_cai float,
saldo_final_cai float,
horario_fechamento_cai time,
id_fun_fk int not null,
foreign key (id_fun_fk) references Funcionario (id_fun)
);

create table Despesa (
id_des int primary key auto_increment,
descricao_des varchar(300) not null,
data_des date,
hora_des time,
valor_des float not null,
parcelamento_des int not null,
tipo_des varchar(300),
id_for_fk int,
foreign key (id_for_fk) references Fornecedor (id_for)
);

create table Pagamento (
id_pag int primary key auto_increment,
data_pag date,
parcela_pag int not null,
valor_pag float,
forma_pagamento_pag varchar(100),
status_pag varchar(100),
vencimento_pag date not null,
hora_pag time,
id_cai_fk int,
foreign key (id_cai_fk) references Caixa (id_cai),
id_des_fk int not null,
foreign key (id_des_fk) references Despesa (id_des)
);

create table Pedido (
id_ped int primary key auto_increment,
hora_ped time,
data_ped date not null,
prioridade_ped varchar(300),
valor_ped float not null,
status_ped varchar (300) not null,
id_mes_fk int,
foreign key (id_mes_fk) references Mesa (id_mes),
id_fun_fk int,
foreign key (id_fun_fk) references Funcionario (id_fun)
);

create table Venda (
id_ven int primary key auto_increment,
valor_ven float not null,
data_ven date not null,
hora_ven time not null,
parcelamento_ven varchar(300) not null,
id_fun_fk int not null,
foreign key (id_fun_fk) references Funcionario (id_fun),
id_cli_fk int,
foreign key (id_cli_fk) references Cliente (id_cli),
id_ped_fk int,
foreign key (id_ped_fk) references Pedido (id_ped)
);

create table Prato (
id_pra int primary key auto_increment,
nome_pra varchar(100) not null,
foto_pra longblob,
valor_pra float not null,
ingredientes_pra varchar(300),
avaliacao_pra varchar(300),
valor_nutritivo_pra varchar(300),
calorias_pra varchar(300),
estoque_pra float
);

create table Venda_Prato (
id_ven_pra int primary key auto_increment,
quantidade_ven_pra float not null,
valor_ven_pra float not null,
id_ven_fk int not null,
foreign key (id_ven_fk) references Venda (id_ven),
id_pra_fk int not null,
foreign key (id_pra_fk) references Prato (id_pra)
);

create table Produto (
id_pro int primary key auto_increment,
nome_pro varchar(300) not null,
descricao_pro varchar(300),
und_pro varchar (30),
tipo_pro varchar (300),
codigo_barras_pro varchar(300),
estoque_pro int,
valor_pro float not null
);

create table Venda_Produto (
id_ven_pro int primary key auto_increment,
quantidade_ven_pro int not null,
valor_ven_pro float not null,
id_ven_fk int not null,
foreign key (id_ven_fk) references Venda (id_ven),
id_pro_fk int not null,
foreign key (id_pro_fk) references Produto (id_pro)
);

create table Prato_Pedido (
id_pra_ped int primary key auto_increment,
quantidade_prat_ped float not null,
valor_pra_ped float not null,
id_pra_fk int not null,
foreign key (id_pra_fk) references Prato (id_pra),
id_ped_fk int not null,
foreign key (id_ped_fk) references Pedido (id_ped)
);

create table Produto_Pedido (
id_pro_ped int primary key auto_increment,
quantidade_pro_ped int not null,
valor_pro_ped float not null,
id_pro_fk int,
foreign key (id_pro_fk) references Produto (id_pro),
id_ped_fk int,
foreign key (id_ped_fk) references Pedido (id_ped)
);

create table Compra (
id_com int primary key auto_increment,
valor_com float,
data_com date,
hora_com time,
parcelamento_comp varchar(300),
descricao_comp varchar(300),
id_for_fk int not null,
foreign key (id_for_fk) references Fornecedor (id_for),
id_fun_fk int not null,
foreign key (id_fun_fk) references Funcionario (id_fun)
);

create table Compra_Produto (
id_com_pro int primary key auto_increment,
quantidade_com_pro int not null,
valor_com_pro float not null,
id_com_fk int not null,
id_pro_fk int not null,
foreign key (id_com_fk) references Compra (id_com), 
foreign key (id_pro_fk) references Produto (id_pro)
);

create table Entrega (
id_ent int primary key auto_increment,
endereco_alternativo_ent varchar(300),
hora_saida_ent time,
hora_chegada_ent time,
data_ent date,
status_ent varchar(100),
veiculo_ent varchar(100),
id_app_fk int,
foreign key (id_app_fk) references Entregador_App (id_app),
id_fun_fk int,
foreign key (id_fun_fk) references Funcionario (id_fun),
id_ven_fk int not null,
foreign key (id_ven_fk) references Venda (id_ven)
);

create table Recebimento (
id_rec int primary key auto_increment,
data_rec date,
parcela_rec int,
valor_rec float,
forma_recebimento_rec varchar(100),
status_rec varchar(100),
vencimento_rec date,
hora_rec time,
valor_parcela_rec float,
id_cai_fk int,
foreign key (id_cai_fk) references Caixa (id_cai),
id_ven_fk int not null,
foreign key (id_ven_fk) references Venda (id_ven)
);

# 1. Crie um procedimento armazenado para inserir um novo registro para cada uma das tabelas do banco de dados. O procedimento deve receber os dados da inserção como parâmetro.
Delimiter $$
create procedure InserirCaixa(numero int, data date, abertura time, saldoInicial float, 
recebimentos float, pagamentos float, saldoFinal float, fechamento time, funcionario int)
begin
	insert into Caixa values(null, numero, data, abertura, saldoInicial, recebimentos, pagamentos, saldoFinal, fechamento, funcionario);
    select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;

Delimiter $$
create procedure InserirCliente(nome varchar(300), cpf varchar(300), rg varchar(100), 
sexo varchar(100), dataNascimento date, celular varchar(100), endereco varchar(300), email varchar(300))
begin
	insert into Cliente values(null, nome, cpf, rg, sexo, dataNascimento, celular, endereco, email);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;

Delimiter $$
create procedure InserirCompra(valor float, data date, hora time, parcelamento varchar(300), descricao varchar(300), fornecedor int, funcionario int)
begin
	insert into Compra values(null, valor, data, hora, parcelamento, descricao, fornecedor, funcionario);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;

Delimiter $$
create procedure InserirCompraProduto(quantidade int, valor float, compra int, produto int)
begin
	insert into compra_produto values(null, quantidade, valor, compra, produto);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;

Delimiter $$
create procedure InserirDespesa(descricao varchar(300), data date, hora time, valor float,
parcelamento int, tipo varchar(300), fornecedor int)
begin
	insert into Despesa values(null, descricao, data, hora, valor, parcelamento, tipo, fornecedor);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;

Delimiter $$
create procedure InserirEntrega(endereco varchar(300), horaSaida time, horaEntrada time, 
data date, status varchar(100), veiculo varchar(100), aplicativo int, funcionario int, venda int)
begin
	insert into Entrega values(null, endereco, horaSaida, horaEntrada, data, status, veiculo, aplicativo, funcionario, venda);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;

Delimiter $$
create procedure InserirEntregadorAPP(nome varchar(300), cpf varchar(100), rg varchar(100), 
dataNascimento date, sexo varchar(100), celular varchar(100), email varchar(300), aplicativo varchar(100))
begin
	insert into Entregador_APP values(null, nome, cpf, rg, dataNascimento, sexo, celular, email, aplicativo);
	select 'Registro inserido com sucesso!';
end;
$$ Dlimiter ;


Delimiter $$
create procedure InserirFornecedor(razaoSocial varchar(300), nomeFantasia varchar(300), cnpj varchar(100), 
endereco varchar(300), celular varchar(100), email varchar(300))
begin
	insert into Fornecedor values(null, razaoSocial, nomeFantasia, cnpj, endereco, celular, email);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirFuncionario(nome varchar(300), cpf varchar(100), rg varchar(100), dataNascimento date, 
sexo varchar(100), telefone varchar(300), email varchar(300), funcao varchar(300))
begin
	insert into Funcionario values(null, nome, cpf, rg, dataNascimento, sexo, telefone, email, funcao);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirMesa(numero int, capacidade int, status varchar(100), cor varchar(100), nivel varchar(100))
begin
	insert into Mesa values(null, numero, capacidade, status, cor, nivel);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirPagamento(data date, parcela int, valor float, formaPagamento varchar(100), 
status varchar(100), vencimento date, hora time, caixa int, despesa int)
begin
	insert into Pagamento values(null, data, parcela, valor, formaPagamento, status, vencimento, hora, caixa, despesa);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirPedido(hora time, data date, prioridade varchar(300), valor float, 
status varchar(300), mesa int, funcionario int)
begin
	insert into Pedido values(null, hora, data, prioridade, valor, status, mesa, funcionario);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirPrato(nome varchar(100), foto longblob, valor float, ingredientes varchar(300),
avaliacao varchar(300), valorNutritivo varchar(300), calorias varchar(300), estoque float)
begin
	insert into Prato values(null, nome, foto, valor, ingredientes, avaliacao, valorNutritivo, calorias, estoque);
	SELECT 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirPratoPedido(quantidade float, valor float, prato int, pedido int)
begin
	insert into Prato_Pedido values(null, quantidade, valor, prato, pedido);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirProduto(nome varchar(300), descricao varchar(300), und varchar(30), 
tipo varchar(300), codigoBarras varchar(300), estoque int, valor float)
begin
	insert into Produto values(null, nome, descricao, und, tipo, codigoBarras, estoque, valor);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirProdutoPedido(quantidade int, valor float, produto int, pedido int)
begin
	insert into Produto_Pedido values(null, quantidade, valor, produto, pedido);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirRecebimento(data date, parcela int, valor float, formaRecebimento varchar(100), 
status varchar(100), vencimento date, hora time, valorParcela float, caixa int, venda int)
begin
	insert into Recebimento values(null, data, parcela, valor, formaRecebimento, status, vencimento, hora, valorParcela, caixa, venda);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirReserva(dataSolicitacao date, horarioSolicitacao time, dataReservada date, horarioReservado time, 
numPessoas int, cliente int, mesa int)
begin
	insert into Reserva values(null, dataSolicitacao, horarioSolicitacao, dataReservada, horarioReservado, numPessoas, cliente, mesa);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirVenda(valor float, data date, hora time, parcelamento varchar(300), funcionario int,
cliente int, pedido int)
begin
	insert into Venda values(null, valor, data, hora, parcelamento, funcionario, cliente, pedido);
	SELECT 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirVendaPrato(quantidade float, valor float, venda int, prato int)
begin
	insert into Venda_Prato values(null, quantidade, valor, venda, prato);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;


Delimiter $$
create procedure InserirVendaProduto(quantidade int, valor float, venda int, produto int)
begin
	insert into Venda_Produto values(null, quantidade, valor, venda, produto);
	select 'Registro inserido com sucesso!';
end;
$$ Delimiter ;



# 2. Chame cada procedimento de inserção e insira 03 (três) registros em cada tabela.

select * from funcionario;
call InserirFuncionario('Jason Marcos', '445.698.565-58', '2556956', '1998-12-05', 'masculino', '(69) 99848-5621', 'jasonmarc@gmail.com', 'vendedor');
call InserirFuncionario('Marcos José', '448.698.456-45', '7896456', '1999-10-15', 'masculino', '(69) 99589-8712', 'marcosjose@gmail.com', 'atendente');
call InserirFuncionario('Cecilia Motta', '778.632.549-54', '7898621', '1996-08-04', 'feminino', '(69) 95896-7896', 'ceciliamotta@gmail.com', 'atendente');

select * from caixa;
call inserirCaixa(1, '2022-05-12', '11:00', 0, 350, 150, 200, '15:00', 1);
call inserirCaixa(1, '2022-05-13', '11:00', 0, 500, 200, 300, '15:00', 2);
call inserirCaixa(1, '2022-05-14', '11:00', 0, 1600, 100, 1500, '15:00', 3);

select * from cliente;
call InserirCliente('Rafael Nunes', '778.698.459-87', '7858945', 'feminino', '2000-05-09', '(69) 99878-4586', 'Rua 04','rafaelnunes@gmail.com');
call InserirCliente('José Henrique', '326.596.155-78', '4587612', 'masculino', '2001-06-10', '(69) 99754-1532', 'Rua das Flores','josehenrique@gmail.com');
call InserirCliente('Rodriges Costa', '458.236.125-45', '1298765', 'feminino', '1999-04-15', '(69) 94598-4598', 'Rua Maneira','rodrigescosta@gmail.com');

select * from fornecedor;
call InserirFornecedor('Alimentos LTDA', 'Alimentos da Bahia', '58.101.656/0001-80', 'Rua Milagrosa', '(69) 99875-4582', 'alimentos@alimentacao.com');
call InserirFornecedor('Limpeza LTDA', 'LimpezaTodoDia', '97.458.833/0001-32', 'Rua dos Anjos', '(69) 92589-1256', 'limpeza@alimentacao.com');
call InserirFornecedor('Produtos LTDA', 'Produtos Essenciais', '97.300.376/0001-53', 'Rua 08', '(69) 99975-4521', 'produtos@alimentacao.com');

select * from compra;
call InserirCompra(2455, '2022-06-09', '12:00', '12', 'compra de produtos de limpeza', 1, 1);
call InserirCompra(1500, '2022-07-19', '15:00', '9', 'compra de alimentos', 1, 2);
call InserirCompra(1450, '2022-10-21', '17:30', '2', 'compra de alimentos', 1, 3);

select * from produto;
call InserirProduto('Guaraná', 'refrigerante', '3', 'bebida', '5646354635456456', 4, 4.52);
call InserirProduto('Arroz', 'massa', '12', 'comida', '56416747898445', 14, 10.54);
call InserirProduto('Pepio', 'salada', '5', 'comida', '564489894894854', 8, 5.50);

call InserirCompraProduto(12, 34, 1, 2);
call InserirCompraProduto(21, 15, 3, 1);
call InserirCompraProduto(2, 51, 2, 3);

select * from despesa;
call InserirDespesa('pagamento da conta de luz', '2022-09-12', '13:50', 452, 5, 'conta', 2);
call InserirDespesa('compra de comida', '2022-08-14', '15:30', 456, 3, 'compra', 1);
call InserirDespesa('compra de produtos', '2022-07-10', '16:10', 321, 14, 'compra', 3);

select * from mesa;
call InserirMesa(2, 4, 'livre', 'branca', null);
call InserirMesa(3, 3, 'livre', 'vermelha', null);
call InserirMesa(1, 5, 'ocupada', 'azul', null);

select * from entregador_app;
call InserirEntregadorAPP('Joana Machado', '445.698.256-56', '4154784', '1999-05-08', 'masculino', '(69) 99878-4595', 'joana@hotmail.com', 'IFood');
call InserirEntregadorAPP('Thiago Lopes', '457.598.241-78', '4587672', '1997-08-08', 'masculino', '(69) 97845-4865', 'thiago@hotmail.com', 'IFood');
call InserirEntregadorAPP('Joaquim Fenix', '458.453.874-84', '2658644', '2001-09-12', 'feminino', '(69) 97845-5689', 'Joaquim@gmail.com', 'UberEats');

select * from pagamento;
call InserirPagamento('2022-12-05', 2, 123.50, 'cash', 'fechado', '2022-12-05', '15:00', 1, 3);
call InserirPagamento('2022-11-04', 4, 541.50, 'cartão de credito', 'aberto', '2022-11-15', '13:30', 2, 3);
call InserirPagamento('2022-12-05', 1, 50.45, 'cheque', 'fechado', '2022-12-05', '21:00', 1, 2);

select * from Pedido;
call InserirPedido('15:25', '2022-10-06', 'máxima', 124.99, 'fechado', 1, 2);
call InserirPedido('08:20', '2022-12-05', 'máxima', 60.52, 'aberto', 2, 1);
call InserirPedido('18:08', '2022-05-08', 'minima', 121, 'fechado', 3, 1);

select * from Venda;
call InserirVenda(451, '2022-05-17', '15:12', '1', 1, 2, 1);
call InserirVenda(126, '2022-12-08', '18:22', '1', 2, 3, 2);
call InserirVenda(52, '2022-11-09', '10:08', '1', 3, 3, 1);

select * from entrega;
call InserirEntrega('Rua Alameda', '12:23', '13:00', '2022-05-12', 'fechado', 'moto', 1, 3, 1);
call InserirEntrega('Rua das Flores', '15:15', '16:00', '2022-06-22', 'aberto', 'moto', 2, 1, 2);
call InserirEntrega('Rua 08', '10:21', '11:02', '2022-12-04', 'fechado', 'carro', 3, 1, 2);

select * from Prato;
call InserirPrato('Arroz temperado', null, 45, null, '10', '12mg vitamina b12', '451kcal', 4); 
call InserirPrato('pão com queijo', null, 13, 'pão e queijo', '9', '56mg sodio', '123kcal', 3); 
call InserirPrato('Salada', null, 21, 'tomate, pepino', '6', '123mg ferro', '50kcal', 1); 

select * from prato_pedido;
call InserirPratoPedido(2, 21, 1, 2);
call InserirPratoPedido(2, 53, 2, 3);
call InserirPratoPedido(2, 14, 3, 1);

select * from produto_pedido;
call InserirProdutoPedido(12, 45, 1, 3);
call InserirProdutoPedido(17, 18, 3, 2);
call InserirProdutoPedido(21, 4, 2, 1);

select * from Recebimento; 
call InserirRecebimento('2022-05-09', 1, 12, 'cartão', 'aberto', '2022-08-09', '15:56', 56, 1, 2); 
call InserirRecebimento('2022-12-08', 2, 48, 'cash', 'fechado', '2022-12-20', '10:50', 123, 2, 3); 
call InserirRecebimento('2022-04-05', 7, 34, 'cash', 'aberto', '2022-04-09', '18:46', 15, 2, 1); 

select * from Reserva;
call InserirReserva('2022-12-21', '15:00', '2022-12-30', '18:30', 6, 1, 2);
call InserirReserva('2022-10-28', '15:00', '2022-11-03', '10:40', 4, 2, 3);
call InserirReserva('2022-09-01', '15:00', '2022-09-07', '15:30', 3, 3, 1);

select * from venda_prato;
call InserirVendaPrato(1, 23, 1, 3);
call InserirVendaPrato(2, 14, 3, 2);
call InserirVendaPrato(1, 85, 2, 1);

select * from venda_produto;
call InserirVendaProduto(1, 23, 1, 1);
call InserirVendaProduto(2, 45, 2, 2);
call InserirVendaProduto(11, 74, 3, 3);

# 3. Crie um procedimento armazenado para atualizar um registro existente para cada uma das tabelas do banco de dados. O procedimento deve receber o codigo do registro a ser atualizado como parâmetro, além dos dados da atualização.

Delimiter $$
create procedure atualizarCliente(codigo int, nome varchar(300), cpf varchar(300), rg varchar(100), sexo varchar(100), dataNascimento date, celular varchar(100), endereco varchar(300), email varchar(300))
begin
update cliente set 
nome_cli = nome,
rg_cli = rg,
cpf_cli = cpf,
sexo_cli = sexo, 
data_nascimento_cli = dataNascimento,
celular_cli = celular,
endereco_cli = endereco,
email_cli = email
where (id_cli = codigo);
select "Cliente atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarCaixa(codigo int, numero int, data date, horarioAbertura time, saldoInicial float, totalReceb float, totalPag float, saldoFinal float, horarioFechamento time, fkFunc int)
begin
update caixa set 
numero_cai = numero,
data_cai = data,
horario_abertura_cai = horarioAbertura,
saldo_inicial_cai = saldoInicial,
total_recebimentos_cai = totalReceb,
total_pagamentos_cai = totalPag,
saldo_final_cai = saldoFinal,
horario_fechamento_cai = horarioFechamento,
id_fun_fk = fkFunc
where (id_cai = codigo);

select "Caixa atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarCompra(codigo int, valor float, data date, hora time, parcelamento varchar(300), descricao varchar(300), fkFor int, fkFun int)
begin
update compra set 
valor_com = valor,
data_com = data,
hora_com = hora,
parcelamento_comp = parcelamento,
descricao_comp = descricao, 
id_for_fk = fkFor,
id_fun_fk = fkFun
where (id_com = codigo);

select "Compra atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarCompraProduto(codigo int, quantidade int, valor float, fkCom int, fkPro int)
begin
update compra_produto set 
quantidade_com_pro = quantidade,
valor_com_pro = valor,
id_com_fk = fkCom,
id_pro_fk = fkPro
where (id_com_pro = codigo);

select "Compra Produto atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarDespesa(codigo int, descricao varchar(300), data date, hora time, valor float, parcelamento int, tipo varchar(300), fkFor int)
begin
update despesa set 
descricao_des = descricao,
data_des = data,
hora_des =  hora,
valor_des = valor,
parcelamento_des = parcelamento,
tipo_des = tipo,
id_for_fk = fkFor
where (id_des= codigo);

select "Compra Produto atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarEntrega(codigo int, enderecoAlt varchar(300), horaSaida  time, horaChegada time, data date, status varchar(100), veliculo varchar(100), fkApp int, fkFun int, fkVen int)
begin
update entrega set 
endereco_alternativo_ent = enderecoAlt,
hora_saida_ent = horaSaida, 
hora_chegada_ent = horaChegada,
data_ent = data,
status_ent = status,
veiculo_ent = veliculo,
id_app_fk = fkApp, 
id_fun_fk = fkFun,
id_ven_fk = fkVen

where (id_ent= codigo);

select "Entrega atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarEntregador_app(codigo int, nome varchar(300), cpf varchar(300), rg varchar(300), data_nasc date, sexo varchar(300), celular varchar(300), email varchar(300), aplicativo varchar(300))
begin
update Entregador_app set 
nome_app = nome,
cpf_app = cpf,
rg_app = rg,
data_nasc_app = data_nasc,
sexo_app = sexo,
celular_app = celular,
email_app = email,
aplicativo_app = aplicativo


where (id_app= codigo);

select "Entregador atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarFornecedor(codigo int, razao_social varchar(300), nome_fantasia varchar(300), cnpj varchar(300), endereco varchar(300), celular varchar(300), email varchar(300))
begin

update Fornecedor set 

razao_social_for = razao_social,
nome_fantasia_for = nome_fantasia,
cnpj_for = cnpj_for, 
endereco_for = endereco,
celular_for = celular,
email_for = email
where (id_for= codigo);

select "Fornecedor atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarFuncionario(codigo int, nome varchar(300), cpf varchar(300), rg varchar(300), data_nasc date, sexo varchar(300), telefone varchar(300), email varchar(300), funcao varchar(300))
begin

update Funcionario set 
nome_fun = nome,
cpf_fun = cpf,
rg_fun = rg,
data_nasc_fun = data_nasc,
sexo_fun =sexo,
telefone_fun = telefone,
email_fun = email, 
funcao_fun = funcao
where (id_fun= codigo);

select "Funcionario atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

select * from funcionario;

######################

Delimiter $$
create procedure atualizarMesa(codigo int, numero int,  capacidade int, status varchar(100), cor varchar(100), nivel varchar(100))
begin

update Mesa set 
numero_mes = numero, 
capacidade_mes = capacidade,
status_mes = status,
cor_mes = cor,
nivel_mes = nivel
where (id_mes = codigo);

select "Mesa atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarPagamento(codigo int, data date, parcela int, valor float, forma_pagamento varchar(100), status varchar(100), vencimento date,  hora time, cai_fk int, des_fk int)
begin

update pagamento set 
data_pag = data,
parcela_pag = parcela_pag,
valor_pag = valor,
forma_pagamento_pag = forma_pagamento,
status_pag = status_pag,
vencimento_pag = vencimento, 
hora_pag = hora,
id_cai_fk = cai_fk,
id_des_fk = des_fk
where (id_pag = codigo);

select "Pagamento atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarPedido(codigo int, hora time, data date, prioridade varchar(300), valor float, status varchar(300), mes_fk int, fun_fk int )
begin

update pedido set 
hora_ped = hora,
data_ped = data,
prioridade_ped = prioridade, 
valor_ped = valor,
status_ped = status,
id_mes_fk = mes_fk,
id_fun_fk = fun_fk
where (id_ped = codigo);

select "Pedido atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarPrato(codigo int, nome varchar(100), foto longblob, valor float, ingredientes varchar(100), avaliacao varchar(100), valor_nutritivo varchar(100), calorias varchar(100), estoque float)
begin

update prato set 

nome_pra = nome_pra,
foto_pra = foto_pra,
valor_pra = valor_pra,
ingredientes_pra = ingredientes_pra,
avaliacao_pra = avaliacao_pra,
valor_nutritivo_pra = valor_nutritivo_pra, 
calorias_pra = calorias_pra,
estoque_pra = estoque_pra
where (id_pra = codigo);

select "Prato atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarPrato_Pedido(codigo int, quantidade float, valor float, pra_fk int, ped_fk int)
begin

update Prato_Pedido set 

quantidade_prat_ped = quantidade,
valor_pra_ped = valor,
id_pra_fk = pra_fk,
id_ped_fk = ped_fk

where (id_pra_ped = codigo);

select "Prato Pedido atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarProduto(codigo int, nome varchar(300), descricao varchar(300), und varchar(300), tipo varchar(300), codigo_barras varchar(300), estoque int, valor float)
begin

update produto set 
nome_pro = nome,
descricao_pro = descricao,
und_pro = und_pro,
tipo_pro = tipo_pro,
codigo_barras_pro = codigo_barras,
estoque_pro = estoque,
valor_pro = valor
where (id_pro = codigo);

select "Produto atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarProduto_Pedido(codigo int, quantidade int, valor float, pro_fk int, ped_fk int)
begin
update produto_pedido set 

quantidade_pro_ped = quantidade,
valor_pro_ped = valor,
id_pro_fk = pro_fk,
id_ped_fk = ped_fk

where (id_pro_ped = codigo);

select "Produto Pedido atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarRecebimento(codigo int, data date, parcela int, valor float, forma_recebimento varchar(100), status varchar(100), vencimento date, hora time, cai_fk int, ven_fk int)
begin
update recebimento set 
data_rec = data,
parcela_rec = parcela,
valor_rec = valor,
forma_recebimento_rec = forma_recebimento,
status_rec = status,
vencimento_rec = vencimento,
hora_rec = hora, 
valor_parcela_rec = valor, 
id_cai_fk = cai_fk,
id_ven_fk = ven_fk


where (id_rec = codigo);

select "Recebimento atualizado com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarReserva(codigo int, data_solicitacao date, horario_solicitacao time, data_reservada date, horario_reservado time, numero_pessoas int, cli_fk int, mes_fk int)
begin
update reserva set 
data_solicitacao_res = data_solicitacao,
horario_solicitacao_res = horario_solicitacao,
data_reservada_res = data_reservada,
horario_reservado_res = horario_reservado,
numero_pessoas_res = numero_pessoas,
id_cli_fk = cli_fk,
id_mes_fk = mes_fk

where (id_res = codigo);

select "Reserva atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarVenda(codigo int, valor float, data date, hora time, parcelamento varchar(300), fun_fk int, cli_fk int, ped_fk int)
begin

update venda set 

valor_ven = valor,
data_ven = data, 
hora_ven = hora,
parcelamento_ven = parcelamento,
id_fun_fk = fun_fk,
id_cli_fk = cli_fk,
id_ped_fk = ped_fk


where (id_ven = codigo);

select "Venda atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarVenda_Produto(codigo int, quantidade float, valor float, ven_fk int, pro_fk int)
begin

update venda_produto set 

quantidade_ven_pro = quantidade,
valor_ven_pro = valor,
id_ven_fk = ven_fk,
id_pro_fk = pro_fk


where (id_ven_pro = codigo);

select "Venda Prato atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;

######################

Delimiter $$
create procedure atualizarVenda_Prato(codigo int, quantidade float, valor float, ven_fk int, pra_fk int)
begin

update venda_prato set 

quantidade_ven_pra = quantidade,
valor_ven_pra = valor,
id_ven_fk = ven_fk,
id_pra_fk = pra_fk


where (id_ven_pra = codigo);

select "Venda Produto atualizada com sucesso" as Confirmação;
end
$$ Delimiter ;



# 4. Chame cada procedimento de atualização e atualize 01 (um) registro em cada tabela.

call atualizarCliente(1, 'Jamilton', '11112312', '12312', 'masculino', '1990-01-02', '1231231', 'Rua das Capibaras - 123', 'jamilton@gmail.com');
call atualizarCaixa(2, 23, '2022-10-21', null, 0, 12, 23, 129.3, null, 1);
call atualizarCompra(2, 123, '2022-03-23', '10:09', '3 parcelas', 'Compra de produtos', 1, 1);
call atualizarCompraProduto(3, 21, 123, 1, 3);
call atualizarDespesa(1, 'gás de cozinha', '2022-09-10','10:21' ,104, 1, 'Suprimentos', 1);
call atualizarEntrega(2, 'Rua do Palmeiras - 1122', '22:00', '22:30', '2022-09-28', 'Em preparo', 'tita 150',2, 1, 2);
call atualizarEntregador_app(2, 'Genisvaldo Silva', '123214', '12412', '1990-10-30', 'Masculino', '121412541', 'Genisvaldo@gmail.com', 'Ifood');
call atualizarFornecedor(2, 'Top Beer Ltda', 'Top Beer', '214141242141241', 'Rua Rio Amazonas - 123', '123124214', 'topbeer@gmail.com');
call atualizarFuncionario(2, 'Galvão Bueno', '12421412', '12124214', '1970-10-01', 'Masculino', '124121235', 'galvao@gmail.com', 'atendedor');
call atualizarMesa(1, 32, 6, 'livre', 'branca', 'vip');
call atualizarPagamento(2, '2022-10-20', 3, 123, 'cartao', 'em aberto', '2022-11-20', '10:20', 2, 1);
call  atualizarPedido(3, '10:20', '2022-10-20', 'baixa', 312, 'entregue', 3, 2);
call atualizarPrato(2, 'Salmão', null, 38.20, 'Salmão, salada', '5 estrelas', null, '150', 20);
call atualizarPrato_Pedido(2, 3, 90, 2, 1);
call atualizarProduto(3, 'Guaraná', 'Bebida gaseificada 300ml', 3, 'bebida', null, 3, 2.5);
call atualizarProduto_Pedido(2, 12, 5, 2, 1);
call atualizarRecebimento(1, '2022-10-20', 1, 23, 'pix', 'pago', '2022-10-20', '10:30', 3, 1);
call atualizarReserva(2, '2020-10-02', '20:01', '2020-10-02', '22:10',4, 3, 2);
call atualizarVenda(3, 123, '2020-10-02', '20:30', '3 parcelas', 2, 1, 3);
call atualizarVenda_Produto(2, 3, 123, 2, 1);
call atualizarVenda_Prato(2, 2, 40.50, 1, 2);

# 5. Crie um procedimento armazenado para excluir um registro existente para cada uma das tabelas do banco de dados. O procedimento deve receber o codigo do registro a ser excluído como parâmetro.

Delimiter $$
create procedure DeleteCaixa(codigo int)
begin
	delete from Caixa where (id_cai = codigo);
    select "Registro de caixa Deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteCliente(codigo int)
begin
	delete from cliente where (id_cli = codigo);
    select "Registro de cliente deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteCompra(codigo int)
begin
	delete from compra where (id_com = codigo);
    select "Registro de compra deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteCompraProduto(codigo int)
begin
	delete from compra_produto where (id_com_pro = codigo);
    select "Registro de compra produto deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteDespesa(codigo int)
begin
	delete from despesa where (id_des = codigo);
    select "Registro de despesa deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteEntrega(codigo int)
begin
	delete from entrega where (id_ent = codigo);
    select "Registro de entrega deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteEntregadorApp(codigo int)
begin
	delete from entregador_app where (id_app = codigo);
    select "Registro de entregador do app deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteFornecedor(codigo int)
begin
	delete from fornecedor where (id_for = codigo);
    select "Registro de forncedor deletado com sucesso" as Confirmação;
end;

Delimiter $$
create procedure DeleteFuncionario(codigo int)
begin
	delete from funcionario where (id_fun = codigo);
    select "Registro de funcionario deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteMesa(codigo int)
begin
	delete from mesa where (id_mes = codigo);
    select "Registro de mesa deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeletePagamento(codigo int)
begin
	delete from pagamento where (id_pag = codigo);
    select "Registro de Pagamento deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeletePedido(codigo int)
begin
	delete from pedido where (id_ped = codigo);
    select "Registro de pedido deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeletePrato(codigo int)
begin
	delete from prato where (id_pra = codigo);
    select "Registro de prato deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeletePratoPedido(codigo int)
begin
	delete from prato_pedido where (id_pra_ped = codigo);
    select "Registro de prato pedido deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteProduto(codigo int)
begin
	delete from produto where (id_pro = codigo);
    select "Registro de prdouto deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteProdutoPedido(codigo int)
begin
	delete from produto_pedido where (id_pro_ped = codigo);
    select "Registro de prdouto pedido deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteRecebimento(codigo int)
begin
	delete from recebimento where (id_rec = codigo);
    select "Registro de recebimento deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteReserva(codigo int)
begin
	delete from reserva where (id_res = codigo);
    select "Registro de reserva deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteVenda(codigo int)
begin
	delete from venda where (id_ven = codigo);
    select "Registro de venda deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteVendaPrato(codigo int)
begin
	delete from venda_prato where (id_ven_pra = codigo);
    select "Registro de venda prato deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

Delimiter $$
create procedure DeleteVendaProduto(codigo int)
begin
	delete from venda_produto where (id_ven_pro = codigo);
    select "Registro de venda produto deletado com sucesso" as Confirmação;
end;
$$ Delimiter ;

# 6. Chame cada procedimento de exclusão e delete 01 (um) registro em cada tabela.

call DeleteCaixa(1);
call DeleteCliente(2);
call DeleteCompra(1);
call DeleteCompraProduto(1);
call DeleteDespesa(3);
call DeleteEntrega(2);
call DeleteEntregadorApp(1);
call DeleteFuncionario(1);
call DeleteMesa(1);
call DeletePagamento(3);
call DeletePedido(3);
call DeletePrato(1);
call DeletePratoPedido(2);
call DeleteProduto(1);
call DeleteProdutoPedido(1);
call DeleteRecebimento(1);
call DeleteReserva(1);
call DeleteVenda(1);
call DeleteVendaPrato(1);
call DeleteVendaProduto(1);

# 7. Crie um procedimento armazenado para selecionar os registros existentes para cada uma das tabelas do banco de dados. O procedimento deve receber o codigo do registro a ser selecionado como parâmetro.

Delimiter $$
create procedure SelecionarCaixa(codigo int)
begin
	select*from caixa where (id_cai = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarCliente(codigo int)
begin
	select*from cliente where (id_cli = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarCompra(codigo int)
begin
	select*from compra where (id_com = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarCompraProduto(codigo int)
begin
	select*from compra_produto where (id_com_pro = codigo);
end;
$$ Delimiter ;

select * from compra_produto;

Delimiter $$
create procedure SelecionarDespesa(codigo int)
begin
	select*from despesa where (id_des = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarEntrega(codigo int)
begin
	select*from entrega where (id_ent = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarEntregadorApp(codigo int)
begin
	select*from entregador_app where (id_app = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarFornecedor(codigo int)
begin
	select*from fornecedor where (id_for = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarFuncionario(codigo int)
begin
	select*from funcionario where (id_fun = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarMesa(codigo int)
begin
	select*from mesa where (id_mes = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarPagamento(codigo int)
begin
	select*from pagamento where (id_pag = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarPedido(codigo int)
begin
	select*from pedido where (id_ped = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarPrato(codigo int)
begin
	select*from prato where (id_pra = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarPratoPedido(codigo int)
begin
	select*from prato_pedido where (id_pra_ped = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarProduto(codigo int)
begin
	select*from produto where (id_pro = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarProdutoPedido(codigo int)
begin
	select*from produto_pedido where (id_pro_ped = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarRecebimento(codigo int)
begin
	select*from recebimento where (id_rec = codigo);
end;

$$ Delimiter ;
Delimiter $$
create procedure SelecionarReserva(codigo int)
begin
	select*from reserva where (id_res = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarVenda(codigo int)
begin
	select*from venda where (id_ven = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarVendaPrato(codigo int)
begin
	select*from venda_prato where (id_ven_pra = codigo);
end;
$$ Delimiter ;

Delimiter $$
create procedure SelecionarVendaProduto(codigo int)
begin
	select*from venda_produto where (id_ven_pro = codigo);
end;
$$ Delimiter ;

# 8. Chame cada procedimento de seleção e selecione 01 (um) registro em cada tabela.
call SelecionarCaixa(1);
call SelecionarCliente(2);
call SelecionarCompra(1);
call SelecionarCompraProduto(2);
call SelecionarDespesa(3);
call SelecionarEntrega(1);
call SelecionarEntregadorApp(1);
call SelecionarFuncionario(1);
call SelecionarMesa(1);
call SelecionarPagamento(1);
call SelecionarPedido(3);
call SelecionarPrato(1);
call SelecionarPratoPedido(3);
call SelecionarProduto(1);
call SelecionarProdutoPedido(2);
call SelecionarRecebimento(3);
call SelecionarReserva(2);
call SelecionarVenda(1);
call SelecionarVendaPrato(3);
call SelecionarVendaProduto(2);