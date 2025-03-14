-- Criando Banco de Dados para Ordens de serviço de uma Oficina Mecânica

create database oficina;

use oficina;

-- Criando Tabelas
-- Tabela Clientes

create table clientes(
	idCliente int auto_increment primary key,
    Nome varchar(15) not null,
    Sobrenome varchar(15) not null,
    CPF varchar(11) not null,
    Endereço varchar(100) not null,
    constraint unique_CPF unique (CPF)
);

alter table clientes auto_increment=1;

-- Tabela Veiculos

create table veiculos(
	idVeiculo int auto_increment primary key,
    idCliente int,
    Placa varchar(7) not null,
    Marca varchar(20) not null,
    Modelo varchar(20) not null,
    Cor varchar(20) not null,
    constraint fk_veiculos_cliente foreign key (idCliente) references clientes(idCliente),
	constraint unique_Placa unique (Placa)
);

alter table veiculos auto_increment=1;

-- Tabela Ordem de Serviço

create table ordemServico(
	idOrdem int auto_increment primary key,
    idCliente int,
    idVeiculo int,
    DataEmissao date not null,
    StatusServico ENUM('Em Análise', 'Aguardando Autorização', 'Autorizado', 'Em Execução', 'Finalizado') default 'Em Análise',
    DataEntrega date,
    constraint fk_ordem_cliente foreign key (idCliente) references clientes(idCliente),
    constraint fk_ordem_veiculo foreign key (idVeiculo) references Veiculos(idVeiculo)
);

alter table ordemServico auto_increment=1;

-- Tabela Peças

create table pecas(
	idPecas int auto_increment primary key,
	Nome varchar(45) not null,
    Referencia varchar(45) not null,
    Valor float not null,
    constraint unique_referencia unique(Referencia)
);

alter table ordemServico auto_increment=1;

-- Tabela Material para Conserto

create table material(
	idOrdem int,
	idPecas int,
	Quantidade int not null,
    primary key (idOrdem, idPecas),
    constraint fk_pecas_ordem foreign key (idOrdem) references ordemServico(idOrdem),
    constraint fk_pecas_pecas foreign key (idPecas) references pecas(idPecas)
);

-- Tabela Mão-de-Obra

create table maoDeObra(
	idMaoDeObra int auto_increment primary key,
	Servico varchar(45) not null,
    Valor float not null
);

alter table maoDeObra auto_increment=1;

-- Tabela Tipo de Serviço

create table servico(
	idOrdem int,
	idMaoDeObra int,
    primary key (idOrdem, idMaoDeObra),
    constraint fk_servico_ordem foreign key (idOrdem) references ordemServico(idOrdem),
    constraint fk_servico_maoDeObra foreign key (idMaoDeObra) references maoDeObra(idMaoDeObra)
);

-- Tabela Funcionários

create table funcionarios(
	idFuncionario int auto_increment primary key,
    Nome varchar(15) not null,
    Sobrenome varchar(15) not null,
    Endereço varchar(100) not null,
    Especialidade varchar(45)
);

alter table clientes auto_increment=1;

-- Tabela Equipe

create table equipe(
	idEquipe int auto_increment primary key,
	Departamento varchar(45) not null,
    idSupervisor int,
    constraint fk_supervisor foreign key (idSupervisor) references funcionarios(idFuncionario)
);

alter table equipe auto_increment=1;

-- Tabela Equipe de Funcionários

create table equipeFuncionarios(
	idFuncionario int,
	idEquipe int,
    primary key (idFuncionario, idEquipe),
    constraint fk_funcionario_equipe foreign key (idFuncionario) references funcionarios(idFuncionario),
    constraint fk_equipe_funcionario foreign key (idEquipe) references equipe(idEquipe)
);

-- Tabela Análise/Execução do Serviço

create table analiseExecucao(
	idOrdem int,
	idEquipe int,
    primary key (idOrdem, idEquipe),
    constraint fk_ordem_equipe foreign key (idOrdem) references ordemServico(idOrdem),
    constraint fk_equipe_ordem foreign key (idEquipe) references equipe(idEquipe)
);
