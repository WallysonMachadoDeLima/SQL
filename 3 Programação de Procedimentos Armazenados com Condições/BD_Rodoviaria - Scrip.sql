#NOME COMPLETO: Wallyso Machado de Lima

create database bd_Imperio_Professor;
use bd_Imperio_Professor;

create table Estado (
cod_est int not null primary key auto_increment,
nome_est varchar (200) not null,
sigla_est varchar (2)
);

create table Cidade (
cod_cid int not null primary key auto_increment,
nome_cid varchar (200) not null,
cod_est int,
foreign key (cod_est) references Estado (cod_est)
);

create table Endereço (
cod_end integer not null primary key auto_increment,
rua_end varchar (300) not null,
numero_end integer,
bairro_end varchar (100),
cep_end varchar (100),
cod_cid int not null,
foreign key (cod_cid) references Cidade (cod_cid)
); 

create table Sexo (
cod_sex int not null primary key auto_increment,
nome_sex varchar (100) not null
);

create table Telefone (
cod_tel int not null primary key auto_increment,
celular_tel varchar (100),
casa_tel varchar (100),
trabalho_tel varchar (100)
);

create table Cliente (
cod_cli integer not null primary key auto_increment,
nome_cli varchar (200) not null,
estadocivil_cli varchar (50),
cpf_cli varchar (20) not null,
rg_cli varchar (30),
datanasc_cli date,
cod_sex integer not null,
cod_end integer not null,
cod_tel integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_end) references Endereço (cod_end),
foreign key (cod_tel) references Telefone (cod_tel)
);

create table Departamento (
cod_dep integer not null primary key auto_increment,
nome_dep varchar (100),
descrição_dep varchar (300)
);

create table Funcionario (
cod_func integer not null primary key auto_increment,
nome_func varchar (200) not null,
cpf_func varchar (20) not null,
rg_func varchar (20),
datanasc_func date,
salário_func double not null,
função_func varchar (50) not null,
cod_sex integer not null,
cod_dep integer not null,
cod_end integer not null,
cod_tel integer not null,
foreign key (cod_sex) references Sexo (cod_sex),
foreign key (cod_dep) references Departamento (cod_dep),
foreign key (cod_end) references Endereço (cod_end),
foreign key (cod_tel) references Telefone (cod_tel)
);

create table onibus (
cod_oni integer not null primary key auto_increment,
modelo_oni varchar (100) not null,
marca_oni varchar (100),
placa_oni varchar (50),
tipo_oni varchar (100)
);

create table Poltrona(
cod_pol integer not null primary key auto_increment,
número_pol integer not null,
situação_pol varchar (100) not null,
cod_oni integer not null,
foreign key (cod_oni) references Onibus (cod_oni)
);

create table Trecho_Viagem (
cod_tre integer not null primary key auto_increment,
data_part_tre date not null,
data_cheg_tre date not null,
horário_part_tre time not null,
horário_cheg_tre time not null,
distancia_tre float,
tarifa_tre float,
cod_cid_origem int not null,
cod_cid_destino int not null,
cod_oni int not null,
foreign key (cod_cid_origem) references Cidade (cod_cid),
foreign key (cod_cid_destino) references Cidade (cod_cid),
foreign key (cod_oni) references Onibus (cod_oni)
);

create table Passagem (
cod_pas integer not null primary key auto_increment,
data_pas date,
valor_pas float,
cod_cli integer not null,
cod_func integer not null,
cod_tre integer not null,
poltrona_pas integer,
foreign key (cod_cli) references Cliente (cod_cli),
foreign key (cod_func) references Funcionario (cod_func),
foreign key (cod_tre) references Trecho_Viagem (cod_tre)
);

create table Caixa (
cod_caixa integer not null primary key auto_increment,
dataabertura_caixa date not null,
datafechamento_caixa date,
saldoinicial_caixa double not null,
valorcréditos_caixa double,
valordébitos_caixa double,
saldofinal_caixa double,
cod_func int not null,
foreign key (cod_func) references Funcionario (cod_func)
);

create table Recebimentos (
cod_receb integer not null primary key auto_increment,
data_receb date,
valor_receb double,
formapag_receb varchar (100),
cod_caixa integer not null,
cod_pas integer not null,
foreign key (cod_caixa) references Caixa (cod_caixa),
foreign key (cod_pas) references Passagem (cod_pas)
);

#INICIE A PARTIR DAQUI SUA LISTA DE EXERCÍCIOS

#TAREFA 1
Delimiter $$
create procedure InserirEstado (nome varchar(200), sigla varchar(2))
begin
declare estadoRepetido varchar(200);
select nome_est into estadoRepetido from Estado where nome_est = nome;
	if ( nome = estadoRepetido) then
		select "O Estado já existe, informe um estado válida" as Erro;
	else
		insert into Estado values(null, nome, sigla);
		select 'Insert realizado com sucesso!' as Confirmacao;
	end if;
end;
$$ Delimiter ;

call InserirEstado ("Rondônia", "RO");
call InserirEstado ("Bahia", "BA");
call InserirEstado ("Minas Gerais", "MG");
call InserirEstado ("Mato Grosso", "MT");
call InserirEstado ("São Paulo", "SP");
call InserirEstado ("Acre", "AC");
call InserirEstado ("Amazonas", "AM");
call InserirEstado ("Mato Grosso do Sul", "MS");
call InserirEstado ("Roraima", "RR");
call InserirEstado ("Rio de Janeiro", "RJ");

#TAREFA 2
DELIMITER $$
create procedure InserirCidade (nome varchar(200), codigo_est int)
begin
declare cidadeRepetido varchar(300);
declare codigoEstado int;
select cod_est into codigoEstado from Estado where cod_est = codigo_est;
select nome_cid into cidadeRepetido from Cidade where nome_cid = nome;
  if ( codigo_est = codigoEstado ) then
	if ( nome = cidadeRepetido ) then
	  select "O nome inserido já existe, digite outro nome" as ERRO;
	else
	  insert into Cidade values (null, nome, codigo_est);
	  select "Cidade inserida com sucesso" as VÁLIDO;
	end if;
  else
    select "O Estado não existe, informe um estado válido" as ERRO;
  end if;
end;
$$ DELIMITER ;

call InserirCidade("Porto Velho", 1);
call InserirCidade("Ji-Paraná", 1);
call InserirCidade("Ariquemes", 1);
call InserirCidade("Cacoal", 1);
call InserirCidade("Costa Marques", 1);
call InserirCidade("Vilhena", 1);
call InserirCidade("Cerejeiras", 1);
call InserirCidade("São Miguel do Guaporé", 1);
call InserirCidade("São Francisco do Guaporé", 1);
call InserirCidade("Rolim de Moura", 1);
call InserirCidade("Rondonópolis", 4);
call InserirCidade("Várzea Grande", 4);
call InserirCidade("Cuiabá", 4);
call InserirCidade("Rio Branco", 6);
call InserirCidade("Brasiléia", 6);
call InserirCidade("Autazes", 7);
call InserirCidade("Barreirinha", 7);
call InserirCidade("Manaus", 7);
call InserirCidade("Dourados", 8);
call InserirCidade("Campo Grande", 8);
call InserirCidade("Paulo Afonso", 2);
call InserirCidade("Salvador", 2);
call InserirCidade("Sabará", 3);
call InserirCidade("Teófilo Otoni", 3);
call InserirCidade("São Paulo", 5);
call InserirCidade("Rio Claro", 5);

# TAREFA 3
DELIMITER $$
create procedure InserirEndereco ( rua varchar(255), numero int, bairro varchar(255), cep varchar(255), codigo_cid int)
begin
declare codigoCidade int;
select cod_cid into codigoCidade from Cidade where cod_cid = codigo_cid;
  if ( codigo_cid = codigoCidade ) then
	insert into Endereço values (null, rua, numero, bairro, cep, codigo_cid);
    select "O Enderço foi inserido com sucesso" as VÁLIDO;
  else
    select "A cidade não existe, informe uma cidade válida" as ERRO;
  end if;
end;
$$ DELIMITER ;

call InserirEndereco("Rua Senador Álvaro Maia", 3800, "Arigolândia", "76801-194", 1);
call InserirEndereco("Travessa Particular", 165, "Olaria", "76801-264", 2);
call InserirEndereco("Rua Olavo Bilac", 686, "Clériston Andrade", "48603-360", 3);
call InserirEndereco("Alameda Praia de São Conrado", 888, "Patamares", "41680-012", 4);
call InserirEndereco("Rua Bom Viver", 639, "Rosário", "34575-230", 5);
call InserirEndereco("Rua Trinta", 905, "Ipiranga", "39801-031", 6);
call InserirEndereco("Rua do Triângulo", 799, "Santa Cruz", "78710-810", 7);
call InserirEndereco("Rua Israel", 212, "Canelas", "78148-808", 8);
call InserirEndereco("Rua Barão de Jaguara", 714, "Mooca", "03105-120", 12);
call InserirEndereco("Rio Claro", 194, "Rua 3 RAC", "13506-342", 11);

# TAREFA 4
DELIMITER $$
create procedure InserirSexo ( sexo varchar(300))
begin
declare sexoRepetido varchar(300);
select nome_sex into sexoRepetido from Sexo where nome_sex = sexo;
  if ( sexo <> "" ) then
    if ( sexo = sexoRepetido ) then
	  select "O nome inserido em sexo já existe, digite outro nome" as ERRO;
    else
	  insert into Sexo values (null, sexo);
	  select "Sexo inserido com sucesso" as VÁLIDO;
    end if;
  else
    select "Sexo está vazio, insira um nome" as ERRO;
  end if;  
end;
$$ DELIMITER ;

call InserirSexo("Masculino");
call InserirSexo("Feminino");

# TAREFA 4
DELIMITER $$
create procedure InserirTelefone(celular varchar(100), casa varchar(100), trabalho varchar(100))
begin
declare celularVazio varchar(300);
select celular_tel into celularVazio from telefone where celular_tel = celular;
  if ( celular <> "" ) then
  	  insert into telefone values (null, celular, casa, trabalho);
	  select "Telefone inserido com sucesso" as VÁLIDO;
  else
    select "Celular está vazio, insira um celular" as ERRO;
  end if;  
end;
$$ DELIMITER ;

call InserirTelefone('(11) 98326-3956', '(11) 2876-8243', '(11) 5176-9612');
call InserirTelefone('(37) 3599-2314', '(37) 99388-9129', '(37) 7527-5836');
call InserirTelefone('(68) 2648-6488', '(68) 98428-1487', '(68) 2645-6444');
call InserirTelefone('(75) 3798-3180', '(75) 99347-3927', '(75) 5434-3793');
call InserirTelefone('(79) 3839-6781', '(79) 98378-4867', '(79) 45634-3783');

# TAREFA 6
DELIMITER $$
create procedure InserirCliente(nome varchar(200), estadoCivil varchar(50), cpf varchar(50), rg varchar(50), dataNasc date, 
codigo_end int, codigo_sex int, codigo_tel int)
begin
declare codigoEndereco int;
declare codigoSexo int;
declare codigoTelefone int;
select cod_end into codigoEndereco from Endereço where cod_end = codigo_end;
select cod_sex into codigoSexo from Sexo where cod_sex = codigo_sex;
select cod_tel into codigoTelefone from Telefone where cod_tel = codigo_tel;
  if ( codigo_end = codigoEndereco ) then
	  if ( codigo_sex = codigoSexo ) then
		  if ( codigo_tel = codigoTelefone ) then
			insert into Cliente values (null, nome, estadoCivil, cpf, rg, dataNasc, codigo_end, codigo_sex, codigo_tel );
			select "O Cliente foi inserido com sucesso" as VÁLIDO;
		  else
			select "O Telefone não existe, informe um telefone válido" as ERRO;
		  end if;
	  else
		select "O Sexo não existe, informe uma sexualidade válida" as ERRO;
	  end if;
  else
    select "O Endereço não existe, informe um endereço válido" as ERRO;
  end if;
end;
$$ DELIMITER ;

call InserirCliente('Francisco Enrico Calebe Drumond','Casado','504.316.553-75','32.522.298-8','1971-07-24',1,1,1);
call InserirCliente('Josefa Eduarda Stefany Melo','Casado','344.904.983-65','48.038.404-6','1981-09-09',2,2,1);
call InserirCliente('Aparecida Andreia Nogueira','Casado','462.066.258-50','33.106.528-9','1991-11-16',1,2,2);
call InserirCliente('Aline Sandra Rezende','Casado','557.594.696-73','42.363.032-5','1999-05-06',2,2,1);
call InserirCliente('Fábio Martin Oliver Ramos','Casado','051.615.587-33','11.526.178-3','2000-01-27',1,1,2);

# TAREFA 7
DELIMITER $$
create procedure InserirDepartamento(nome varchar(100), descricao varchar(300))
begin
declare nomeVazio varchar(100);
declare descricaoVazio varchar(300);
select nome_dep into nomeVazio from Departamento where nome_dep = nome;
select descrição_dep into descricaoVazio from Departamento where descrição_dep = descricao;
  if ( nome <> "" ) then
	  if ( descricao <> "" ) then
		  insert into Departamento values (null, nome, descricao);
		  select "Departamento inserido com sucesso" as VÁLIDO;
	  else
		select "A descrição está vazia, insira uma descrição" as ERRO;
	  end if; 
  else
    select "O campo Nome está vazio, insira um nome" as ERRO;
  end if;  
end;
$$ DELIMITER ;

call InserirDepartamento('Vendas de Passagens','vende passagens');
call InserirDepartamento('Caixa','Receber os pagamentos');
call InserirDepartamento('faxineiro','Limpar todo o local');

# TAREFA 8
DELIMITER $$
create procedure InserirFuncionario(nome varchar(200), cpf varchar(20), rg varchar(20), dataNascimento date, salario double, funcao varchar(50), idSexo int, idDepartamento int, idEndereco int, idTelefone int)
begin
declare verifIdEndereco int;
declare verifIdSexo int;
declare verifIdTelefone int;
declare verifIdDepartamento int;
declare verifIdVendedorPassagens int;

select cod_end into verifIdEndereco from Endereço where cod_end = idEndereço;
select cod_sex into verifIdSexo from Sexo where cod_sex = idSexo;
select cod_tel into verifIdTelefone from Telefone where cod_tel = idTelefone;
select cod_dep into verifIdDepartamento from Departamento where cod_dep = idDepartamento;
select cod_dep into verifIdVendedorPassagens from Departamento where nome_dep = "Vendas de Passagens";

	if (idEndereco = verifIdEndereco) then
		if (IdSexo = verifIdSexo) then
			if (idTelefone = verifIdTelefone) then
				if (idDepartamento = verifIdDepartamento) then
					if (funcao = "Vendedor") then
						if (idDepartamento = verifIdVendedorPassagens) then
							insert into Funcionario values (null, nome, cpf, rg, dataNascimento, salario, funcao, idSexo, idDepartamento, idEndereco, idTelefone);
							select "Funcionário inserido com sucesso" as VÁLIDO;
						else
							select "Vendedor não pertencente ao setor Vendas de Passsagens" as ERRO;
                        end if;
                    else
						insert into Funcionario values (null, nome, cpf, rg, dataNascimento, salario, funcao, idSexo, idDepartamento, idEndereco, idTelefone);
						select "Funcionário inserido com sucesso" as VÁLIDO;
                    end if;
				else
					select "O departamento selecionado não existe" as ERRO;
				end if;
            else    
				select "O telefone selecionado não existe" as ERRO;
			end if;
        else    
            select "O sexo selecionado não existe" as ERRO;            
		end if;
    else    
        select "O endereço selecionado não existe" as ERRO;
	end if;
end;
$$ DELIMITER ;

call InserirFuncionario ("Luan Ferreira Barbosa", "03945621870", "76552479", '2004-02-12', 1200, "Vendedor", 1, 1, 1, 1);
call InserirFuncionario ("Pamela Jiulia Gonçalves Dias", "07585625487", "85462175", '2000-10-20', 1400, "Motorista", 2, 2, 2, 2);
call InserirFuncionario ("Ziraldo Carlos de Almeida", "05167545789", "74800125", '2002-05-15', 1550, "Faxineiro", 3, 3, 3, 3);
call InserirFuncionario ("Henrique Pereira Neves", "61058778495", "65488874", "1999-05-23", 1200, "Vendedor", 1, 2, 4, 4);

#TAREFA 9
Delimiter $$
create procedure InserirOnibus (modelo varchar(100), marca varchar(100), placa varchar(50), tipo varchar(100))
begin
	if ( modelo = "Amazon Bus Premium") then
        if (tipo = "Executive") then
			insert into Onibus values (null, modelo, marca, placa, tipo);
			select "Ônibus inserido com sucesso" as VÁLIDO;
		else
			select "Tipo inválido de Ônibus" as VÁLIDO;
        end if;
	else
		if ( modelo = "Amazon Bus Leito") then
			if (tipo = "Confort") then
				insert into Onibus values (null, modelo, marca, placa, tipo);
				select "Ônibus inserido com sucesso" as VÁLIDO;
			else
				select "Tipo inválido de Ônibus" as VÁLIDO;
			end if;
		else
				select "Modelo inválido de Ônibus" as VÁLIDO;
		end if;
	end if;
end;
$$ Delimiter ;

call InserirOnibus ("Amazon Bus Premium", "Mercedes", "NSG64DS05", "Executive");
call InserirOnibus ("Amazon Bus Premium", "Mercedes", "H5S1AD505", "Executive");
call InserirOnibus ("Amazon Bus Leito", "Mercedes", "ASD549521", "Confort");
call InserirOnibus ("Amazon Bus Leito", "Mercedes", "ZKSDJAJ54", "Confort");

#TAREFA 10
Delimiter $$
create procedure InserirPoltrona (codigoOnibus int)
begin
declare contador int;
declare tipo varchar(100);

set @contador = 1;
select tipo_oni into tipo from Onibus where codigoOnibus = cod_oni;

	if (tipo = "Executive") then
		while (@contador < 49) do
			insert into Poltrona values (null, @contador, "Livre", codigoOnibus);
            set @contador = @contador + 1;
        end while;
			select "Poltronas inseridas com sucesso" as VÁLIDO;
	else
		if (tipo = "Confort") then
			while (@contador < 59) do
				insert into Poltrona values (null, @contador, "Livre", codigoOnibus);
				set @contador = @contador + 1;
			end while;
			select "Poltronas inseridas com sucesso" as VÁLIDO;
		else
			select "Ônibus não existente no sistema" as ERRO;
        end if;
    end if;
end;
$$ Delimiter ;

call InserirPoltrona (1);
call InserirPoltrona (2);
call InserirPoltrona (3);
call InserirPoltrona (4);
