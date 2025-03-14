-- Inserindo dados ao banco de dados oficina

use oficina;

-- Tabela Clientes

insert into clientes(Nome, Sobrenome, CPF, Endereço)
	values('Monica','Riegel',12358649576,'São Leopldo / RS'),
			('Gabriel','Borba',52346987564,'Novo Hamburgo / RS'),
            ('Glaci','Fagundes',63198723659,'São Leopoldo / RS'),
            ('Ismael','Riegel',67985324658,'Nova Petropolis / RS'),
            ('Leonice','Secco',26879564358,'Novo Hamburgo / RS');

-- Tabela Veiculos

insert into veiculos(idCliente, Placa, Marca, Modelo, Cor)
	values('5','ABD2356','Chevrolet','Onix','Prata'),
			('3','DRT2359','Fiat','Argo','Vermelho'),
            ('3','WGR8642','kia','Seltos', 'Branco'),
            ('2','KYH6319','Toyota','Corola','Preto'),
            ('4','QTF6429','Fiat','Uno','Branco'),
            ('5','EMT8765','Chevrolet','Onix','Preto'),
            ('1','TBM2568','Fiat','Mobi','Preto');

-- Tabela Ordem de Serviço

insert into ordemServico(idCliente, idVeiculo, DataEmissao, StatusServico, DataEntrega)
	Values('1', '7', 20250225, 'Finalizado', 20250228),
			('3', '2', 20250228, 'Autorizado', 20250315),
            ('4', '5', 20250301, 'Finalizado', 20250302),
            ('3', '3', 20250305, 'Aguardando Autorização', null);
            
-- Tabela Peças

insert into pecas(Nome, Referencia, Valor)
	values('Bateria', '356846525', 200),
			('Pastilha de freio', 'afev12535', 80),
            ('Filtro de ar', '53978615', 40),
            ('Amortecedores', 'plt2546gt8', 15),
            ('Correia dentada', '26498376421', 400),
            ('Radiador', 'fg863ert', 500);

-- Tabela Material para Conserto

insert into material(idOrdem, idPecas, Quantidade)
	values('1', '6', 1),
			('2', '1', 1),
			('2', '4', 2),
            ('2', '5', 1),
            ('4', '1', 1);
            
-- Tabela Mão-de-Obra

insert into maoDeObra(Servico, Valor)
	Values('Concerto', 300),
			('Revisão', 500);

-- Tabela Tipo de Serviço

insert into servico(idOrdem, idMaoDeObra)
	values('1', '1'),
			('2', '1'),
            ('3','2'),
            ('4', '1');

-- Tabela Funcionários

insert into funcionarios(Nome, Sobrenome, Endereço, Especialidade)
	values('João','Silva','Novo Hamburgo / RS','Mecanico'),
			('Ana','Rosa','Novo Hamburgo / RS','Mecanico'),
            ('Pedro','Oliveira','Novo Hamburgo / RS','Auxiliar'),
            ('Paulo','Andrade','Novo Hamburgo / RS','Auxiliar'),
            ('Maria','Dias','Novo Hamburgo / RS','Auxiliar');


-- Tabela Equipe

insert into equipe(Departamento, idSupervisor)
	values('Eletrica', '2'),
			('Mecanica', '1');

-- Tabela Equipe de Funcionários

insert into equipeFuncionarios(idFuncionario, idEquipe)
	values('1', '2'),
			('2', '1'),
            ('3', '1'),
            ('4', '2'),
            ('5', '2');


-- Tabela Análise/Execução do Serviço

insert into analiseExecucao(idOrdem, idEquipe)
	values('1', '2'),
			('2', '2'),
            ('3', '1'),
            ('3', '2'),
            ('4', '2');

