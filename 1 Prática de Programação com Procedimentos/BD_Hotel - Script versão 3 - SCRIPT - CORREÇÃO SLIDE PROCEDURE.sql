#Hotel Dorme Bem
create database bd_hotel_3;
use bd_hotel_3;

create table Endereco (
cod_end integer not null primary key auto_increment,
rua_end varchar (300),
numero_end integer,
bairro_end varchar (100),
cidade_end varchar (100),
estado_end varchar (100)
); 

insert into Endereco values (null, 'Av. Brasil', 111, 'Nova Brasília', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Marechal Rondon', 1245, 'Centro', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua Dr. Telma Rios', 1174, 'Colina Park I', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Aracaju', 911, 'BNH', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua 07 de Setembro', 121, 'Dom Bosco', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Rua Mato Grosso', 887, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');
insert into Endereco values (null, 'Av. Jorge Teixeira', 1589, 'Centro', 'Porto Velho', 'Rondônia');
insert into Endereco values (null, 'Av. Paulista', 989, 'Centro', 'São Paulo', 'São Paulo');
insert into Endereco values (null, 'Travessa dos Mineiros', 456, 'Centro', 'Ariquemes', 'Rondônia');
insert into Endereco values (null, 'Av. Monte Castelo', 555, 'Jardim dos Migrantes', 'Ji-Paraná', 'Rondônia');

create table Cliente (
cod_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
sexo_cli varchar (30),
datanasc_cli date,
rendafamiliar_cli double,
telefone_cli varchar (50) not null,
celular_cli varchar (50) not null,
cod_end_fk integer not null,
foreign key (cod_end_fk) references Endereco (cod_end)
);

insert into cliente values (null, 'Nick Fury', 'Casado', '111.111.111-11', '54654 sesdec', 'Masculino', '1987-06-30', 10000.00, '69 84085712', '69 84111111', 3);
insert into cliente values (null, 'Tony Stark', 'Casado', '111.111.111-22', '54654 sesdec', 'Masculino', '1965-1-1', 456454.45, '', '', 8);
insert into cliente values (null, 'Steve Rogers', 'Solteiro', '111.111.111-33', '48877 sesdec', 'Masculino', '1950-05-30', 0.00, '11 454546511', '', 1);
insert into cliente values (null, 'Bruce Banner', 'Casado', '222.222.222-88', '8888888 spp', 'Masculino', '1990-11-12', 900.00, '69 88998899', '69 4444 4444', 4);
insert into cliente values (null, 'Natasha Romanoff', 'Solteira', '554.454.444-99', '99999 sesdec', 'Feminino', '1993-06-21', 3000.00, '69 3421 5511', '69 99111111', 3);
insert into cliente values (null, 'Janet van Dyne', 'Casada', '987.123.654-55', '8889999 sesdec', 'Feminino', '2000-12-12', 5450.00, '69 3421 1122', '69 9999 7788', 10);
insert into cliente values (null, 'Petter Parker', 'Casado', '654.789.123-88', '998877 sesdec', 'Masculino', '1970-01-01', 6845.00, '69 84085712', '69 84111111', 9);
insert into cliente values (null, 'Clint Barton', 'Solteiro', '321.111.222-44', '1234312 sesdec', 'Masculino', '1982-07-30', 4199.00, '69 3421 2211', '69 84118811', 2);
insert into cliente values (null, 'Carol Danvers', 'Solteira', '988.235.654-54', '12345 sesdec', 'Feminino', '1978-11-11', 3250.00, '69 3421 9999', '69 84118811', 5);
insert into cliente values (null, 'Bucky Barnes', 'Solteiro', '123.445.888-99', '999992 sesdec', 'Masculino', '1989-12-30', 9600.00, '69 3421 1123', '69 84118811', 3);

create table Funcionario (
cod_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
sexo_func varchar (30),
datanasc_func date,
salario_func double not null,
telefone_func varchar (50),
celular_func varchar (50) not null,
funcao_func varchar (50) not null,
cod_end_fk integer not null,
foreign key (cod_end_fk) references Endereco (cod_end)
);

insert into funcionario values (null, 'Clark Kent', '123.544.311-99', '22222 sesdec', 'Masculino', '1988-10-30', 5000.00, '', '69 84111155', 'Atendente', 2);
insert into funcionario values (null, 'Diana Prince', '565.888.988-88', '64444 sesdec', 'Feminino', '1965-1-20', 45000.00, '', '', 'Atendente', 1);
insert into funcionario values (null, 'Bruce Wayne', '998.999.789-55', '46666 sesdec', 'Masculino', '1990-05-23', 15000.00, '11 454546511', '', 'Gerente', 5);

create table Produto (
cod_prod int primary key not null auto_increment,
descricao_prod varchar (200) not null,
estoque_prod int,
valor_prod float,
dataValidade_prod date
);

insert into produto values (null, 'Agua Mineral Sem Gás 500ml', 50, 3.50, '2020-01-01');
insert into produto values (null, 'Chocolate em Barra 200gr', 30, 4.80, '2018-06-30');
insert into produto values (null, 'Cerveja Skol 350ml', 30, 4.50, '2019-01-01');
insert into produto values (null, 'Vinho Tinto 700ml', 20, 50.50, '2019-01-01');

create table Servico (
cod_serv int not null primary key auto_increment,
descricao_serv varchar(300),
tipo_serv varchar (100),
valor_serv float not null
);

insert into servico values (null, 'Estacionamento', 'Diaria', 20.00);
insert into servico values (null, 'Lavanderia', 'Peça de roupa', 10.00);
insert into servico values (null, 'Transporte de hospede', 'Trecho', 10.00);

create table Quarto (
cod_qua int primary key not null auto_increment,
descricao_qua varchar (200) not null,
numero_qua int not null,
tipo_qua varchar (100) not null,
valor_qua float,
disponibilidade_qua varchar (100)
);

insert into quarto values (null, 'Apartamento Duplo', 100, 'Luxo', 200.00, 'Livre');
insert into quarto values (null, 'Apartamento Duplo', 101, 'Simples', 100.00, 'Livre');
insert into quarto values (null, 'Apartamento Individual', 201, 'Simples', 50.00, 'Ocupado');
insert into quarto values (null, 'Apartamento Tripo', 202, 'Simples', 150.00, 'Ocupado');
insert into quarto values (null, 'Apartamento Duplo', 301, 'Luxo', 200.00, 'Ocupado');
insert into quarto values (null, 'Apartamento Duplo', 302, 'Simples', 100.00, 'Livre');
insert into quarto values (null, 'Apartamento Individual', 401, 'Simples', 50.00, 'Livre');
insert into quarto values (null, 'Apartamento Tripo', 402, 'Simples', 150.00, 'Livre');

create table Produtos_quarto (
cod_pq int primary key not null auto_increment,
quantidade_pq int,
dataRecarga_pq date,
cod_qua_fk int not null,
cod_prod_fk int not null,
foreign key (cod_qua_fk) references quarto (cod_qua),
foreign key (cod_prod_fk) references produto (cod_prod)
);


insert into produtos_quarto values (null, 2, '2017-03-29', 1, 1);
insert into produtos_quarto values (null, 5, '2017-03-29', 1, 2);
insert into produtos_quarto values (null, 2, '2017-03-29', 1, 3);
insert into produtos_quarto values (null, 2, '2017-03-30', 2, 1);
insert into produtos_quarto values (null, 1, '2017-03-30', 2, 3);
insert into produtos_quarto values (null, 5, '2017-03-29', 3, 1);
insert into produtos_quarto values (null, 5, '2017-03-29', 3, 2);
insert into produtos_quarto values (null, 5, '2017-03-29', 4, 2);
insert into produtos_quarto values (null, 5, '2017-03-29', 5, 4);

create table Hospedagem (
cod_hosp int primary key not null auto_increment,
dataCheckin_hosp date,
dataCheckout_hosp date,
valorProdutos_hosp float,
valorQuartos_hosp float,
valorServicos_hosp float,
formaRecebimento_hosp varchar (100),
cod_cli_fk int not null,
cod_func_fk int not null,
foreign key (cod_cli_fk) references Cliente (cod_cli),
foreign key (cod_func_fk) references Funcionario (cod_func)
);

insert into Hospedagem values (null, '2021-05-29', '2021-05-31', 20.50, 150.00, 90.00, 'prazo - 2 vezes', 4, 1);
insert into Hospedagem values (null, '2021-05-29', '2021-05-30', 134.50, 300.00, 110.00, 'a vista', 8, 2);

create table produtos_hospedagem (
cod_ph int primary key not null auto_increment,
cod_hosp_fk int not null,
cod_prod_fk int not null,
quant_ph int,
foreign key (cod_hosp_fk) references Hospedagem (cod_hosp),
foreign key (Cod_prod_fk) references Produto (cod_prod)
);

insert into produtos_hospedagem values (null, 1, 1, 2);
insert into produtos_hospedagem values (null, 1, 3, 3);
insert into produtos_hospedagem values (null, 2, 1, 3);
insert into produtos_hospedagem values (null, 2, 3, 5);
insert into produtos_hospedagem values (null, 2, 4, 2);

create table quartos_hospedagem (
cod_qh int primary key not null auto_increment,
cod_hosp_fk int not null,
cod_qua_fk int not null,
quantDiarias_qh int,
foreign key (cod_hosp_fk) references Hospedagem (cod_hosp),
foreign key (Cod_qua_fk) references Quarto (cod_qua)
);

insert into quartos_hospedagem values (null, 1, 3, 3);
insert into quartos_hospedagem values (null, 2, 4, 2);

create table servicos_hospedagem (
cod_sh int primary key not null auto_increment,
cod_hosp_fk int not null,
cod_serv_fk int not null,
quant_sh int,
foreign key (cod_hosp_fk) references Hospedagem (cod_hosp),
foreign key (cod_serv_fk) references Servico (cod_serv)
);

insert into servicos_hospedagem values (null, 1, 1, 1);
insert into servicos_hospedagem values (null, 1, 2, 5);
insert into servicos_hospedagem values (null, 1, 3, 2);
insert into servicos_hospedagem values (null, 2, 1, 1);
insert into servicos_hospedagem values (null, 2, 2, 9);

create table Caixa (
cod_cai integer not null primary key auto_increment,
dataabertura_cai date not null,
datafechamento_cai date,
saldoinicial_cai double not null,
valorcreditos_cai double,
valordebitos_cai double,
saldofinal_cai double,
status_cai varchar (100) not null
);

insert into Caixa values (null, '2021-05-31', '2021-05-31', 50.00, 0.00, 0.00, 0.00, 'Fechado');


create table Recebimento (
cod_rec integer not null primary key auto_increment,
dataVencimento_rec date,
valor_rec double,
parcela_rec varchar (100),
formaRecebimento_rec varchar (100),
dataRecebimento_rec date,
status_rec varchar (100),
cod_func_fk integer,
cod_hosp_fk integer not null,
cod_cai_fk integer,
foreign key (cod_cai_fk) references Caixa (cod_cai),
foreign key (cod_hosp_fk) references Hospedagem (cod_hosp),
foreign key (cod_func_fk) references Funcionario (cod_func)
);

insert into Recebimento values (null, '2021-06-29', 130.25, '1/2', null, null, 'Aberto', null, 1, null);
insert into Recebimento values (null, '2021-07-29', 130.25, '2/2', null, null, 'Aberto', null, 1, null);
insert into Recebimento values (null, '2021-05-29', 544.50, '1/1', 'Cartão Crédito', '2021-05-29', 'Pago', 1, 2, 1);

create table Fornecedor (
cod_forn integer not null primary key auto_increment,
razaosocial_forn varchar (200),
nomefantasial_forn varchar (100),
representante_forn varchar (100),
telefone_forn varchar (100),
cod_end_fk integer not null,
foreign key (cod_end_fk) references Endereco (cod_end)
);

insert into Fornecedor values (null, 'Irmãos Gonçalves LTDA', 'Supermercado Irmãos Gonçalves', 'João Gonçavels', '69 3421 1111', 5);
insert into Fornecedor values (null, 'Acatacão LTDA', 'Supermercado Atacadão', 'Ana Maria', '69 3422 2222', 4);


create table Compra (
cod_comp integer not null primary key auto_increment,
data_comp date,
valortotal_comp double,
formaPagamento_comp varchar (100),
cod_func_fk integer not null,
cod_forn_fk integer not null,
foreign key (cod_func_fk) references Funcionario (cod_func),
foreign key (cod_forn_fk) references Fornecedor (cod_forn)
);

insert into Compra values (null, '2021-04-30', 191.19, 'a vista', 1, 1);
insert into Compra values (null, '2021-05-01', 410.99, 'prazo - 2 vezes', 1, 2);


create table Produtos_Compra (
cod_proc integer not null primary key auto_increment,
quant_proc integer not null,
valor_proc float not null,
cod_prod_fk integer not null,
cod_comp_fk integer not null,
foreign key (cod_prod_fk) references Produto (cod_prod),
foreign key (cod_comp_fk) references Compra (cod_comp)
);

insert into Produtos_Compra values (null, 50, 1.55, 1, 1);
insert into Produtos_Compra values (null, 30, 1.80, 2, 1);
insert into Produtos_Compra values (null, 30, 1.99, 3, 1);
insert into Produtos_Compra values (null, 20, 20.55, 4, 2);

create table Pagamentos (
cod_pag integer not null primary key auto_increment,
dataVencimento_pag date,
valor_pag float,
parcela_pag varchar (100),
formaPagamento_pag varchar (100),
dataPagamento_pag date,
status_pag varchar (100),
cod_cai_fk integer,
cod_comp_fk integer,
cod_func_fk integer,
foreign key (cod_cai_fk) references Caixa (cod_cai),
foreign key (cod_comp_fk) references Compra (cod_comp),
foreign key (cod_func_fk) references Funcionario (cod_func)
);

insert into Pagamentos values (null, '2021-04-30', 191.19, '1/1', 'Dinheiro', '2021-04-30', 'Pago', 1, 1, 1);
insert into Pagamentos values (null, '2021-06-01', 205.49, '1/2', 'Transferencia bancária', '2021-06-01', 'Pago', 1, 2, 1);
insert into Pagamentos values (null, '2021-07-01', 205.49, '2/2', null, null, 'Aberta', null, 2, null);

#FAÇA AQUI OS CODIGOS SQL
#1. Crie um procedimento para obter a lista de produtos disponíveis no hotel com o estoque maior do que um 
#número recebido no parâmetro de entrada;
delimiter $$
create procedure listar_produtos (numero float)
begin
	select * from produto where (estoque_prod > numero);    
end;
$$ delimiter ;

call listar_produtos (30);

#2. Crie um procedimento com passagem de parâmetros de entrada para cadastrar um novo Produto;
delimiter $$
create procedure inserir_produto (descricao varchar (300), estoque float, valor float, validade date) 
begin
	insert into produto values (null, descricao, estoque, valor, validade);
	select 'Produto inserido com sucesso!' as Confirmacao;
end;
$$ delimiter ;

call inserir_produto ('Guarana Antartica 2LT', 100, 8.00, '2025-09-25');

#3. Crie um procedimento com passagem de parâmetros de entrada para atualizar um Produto existente;
delimiter $$
create procedure atualizar_produto (codigo int, descricao varchar (300), estoque float, valor float, validade date) 
begin
	update produto set 
    descricao_prod = descricao,
    estoque_prod = estoque,
    valor_prod = valor,
    dataValidade_prod = validade
    where
    (cod_prod = codigo);
    
	select 'Produto atualizado com sucesso!' as Confirmacao;
end;
$$ delimiter ;

call atualizar_produto (5, 'Guarana Antartica 2LT', 100, 10.00, '2025-09-25');

#4. Crie um procedimento com passagem de parâmetros de entrada para excluir um Produto existente.
delimiter $$
create procedure deletar_produto (codigo int) 
begin
	delete from produto where (cod_prod = codigo);
    
	select 'Produto excluido com sucesso!' as Confirmacao;
end;
$$ delimiter ;

call deletar_produto (5);

#5. Crie um procedimento que retorne por uma variável de saída o número total de clientes cadastrados no 
#sistema do hotel;
delimiter $$
create procedure retornar_numero_clientes (out total int)
begin
	select count(cod_cli) INTO total from cliente;
    select 'Contagem feita com sucesso!' as Confirmacao;
end;
$$ delimiter ;

call retornar_numero_clientes (@resultado);
select @resultado;

#6. Crie um procedimento que atualize para mais o valor dos produtos no estoque em X% (X é o parâmetro de entrada);
delimiter $$
create procedure atualizar_valor_produtos (porcentagem float)
begin
	update produto set valor_prod = valor_prod + ((porcentagem / 100) * valor_prod);
	select CONCAT('Produtos atualizados em ' , porcentagem , ' porcentos!') as Confirmacao;
end;
$$ delimiter ;

call atualizar_valor_produtos (50);

/* CANCELADO
#7. Crie um procedimento para somar os valores de produtos, 
#quartos e serviços e atribuir ao atributo valor_total criado dentro do procedimento, 
#receba o nome do atributo a ser criado e o código da hospedagem a ser atualizada como parâmetro de entrada;
delimiter $$
create procedure ajustar_total_hospedagem (codigo int)
begin
	alter table hospedagem add valor_total_hosp float;
    select 'Atributo criado com sucesso!' as Sucesso;
    
    update hospedagem set valor_total_hosp = valorprodutos_hosp + valorquartos_hosp + valorservicos_hosp
    where (cod_hosp = codigo);
    select 'Atualizado do valor total feita com sucesso!' as Confirmacao;

end;
$$ delimiter ;

call ajustar_total_hospedagem (1);
*/

#8. Crie ou atualize a tabela Serviço de acordo com o RF Cadastrar Serviço (Tela em anexo)
delimiter $$
create procedure atualizar_tabela_servico ()
begin
	alter table servico add nome_serv varchar (300) after cod_serv;
    select 'Atualizado com sucesso!' as Confirmacao;    
end;
$$ delimiter ;

call atualizar_tabela_servico();

select * from servico;

#9. Crie um procedimento para o botão Salvar do RF Cadastrar Serviço.
delimiter $$
create procedure salvar_servico (nome varchar (300), descricao varchar (300), tipo varchar (300), valor float)
begin
	insert into servico values (null, nome, descricao, tipo, valor);
    select 'Servico inserido com sucesso' as Confirmacao;
end;
$$ delimiter ;

call salvar_servico ('Buffet por 1kg', 'Servico de alimentacao', 'Buffet', 50.00);

#10. Crie um procedimento para o botão Editar do RF Consultar Serviço (atualização direta do registro informado).
delimiter $$
create procedure editar_servico (codigo int, nome varchar (300), descricao varchar (300), tipo varchar (300), valor float)
begin
	update servico set 
    nome_serv = nome,
    descricao_serv = descricao,
    tipo_serv = tipo,
    valor_serv = valor
    where
    (cod_serv = codigo);
    select 'Servico atualizado com sucesso' as Confirmacao;
end;
$$ delimiter ;

call editar_servico (4, 'Buffet por 1kg', 'Servico de alimentacao', 'Buffet', 60.00);


#11. Crie um procedimento para o botão Excluir do RF Consultar Serviço (exclusão direta do registro informado).
delimiter $$
create procedure deletar_servico (codigo int)
begin
	delete from servico where (cod_serv = codigo);    
    select 'Servico deletado com sucesso' as Confirmacao;
end;
$$ delimiter ;

call deletar_servico (4);

#12. Crie um procedimento para o botão Buscar do RF Consutlar Serviço 
#(use a função CONCAT('texto','texto') para concatenar o texto no LIKE)
delimiter $$
create procedure selecionar_servico (texto varchar (300))
begin
	select * from servico where (descricao_serv like concat('%', texto, '%'));
    
end;
$$ delimiter ;

call selecionar_servico ('est');
