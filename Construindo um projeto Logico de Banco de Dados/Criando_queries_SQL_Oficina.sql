-- Criando queries SQL para Oficina Mecanica

use oficina;

-- Recuperações simples com SELECT Statement;

-- Clientes da Oficina

Select * from clientes;

-- Veiculos dos clientes

Select Placa, Marca, Modelo, Cor from veiculos;

-- Funcionários da Oficina

Select Nome, Especialidade from funcionarios;

-- Filtros com WHERE Statement;

-- Veiculos de cor preta
select * from veiculos
	where cor='Preto';
    
-- Ordens de serviço do cliente 1

select idOrdem, StatusServico as Statusa, DataEntrega as Entrega from ordemservico
	where idCliente=1;

-- Crie expressões para gerar atributos derivados;

-- Veiculos dos clientes

Select Placa, concat(Marca, '/', Modelo) Marca_Modelo, Cor from veiculos;

-- Quantos veiculos cada cliente tem

select idCliente, count(*) as Veiculos from veiculos 	
    group by idCliente;

-- Defina ordenações dos dados com ORDER BY;

-- Ordenar Ordens de Serviço por cliente

Select * from ordemservico
	order by idCliente;


-- Condições de filtros aos grupos – HAVING Statement;

-- Clientes que possuem 2 ou mais veiculos

select idCliente, count(*) as Veiculos from veiculos 	
    group by idCliente
    having Veiculos>=2;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

-- Mão-de-obra de cada serviço do maior para o menor

select idOrdem Ordem_de_Serviço, concat(Nome, ' ', Sobrenome) Cliente, Servico Serviço, Valor from ordemservico
	inner join clientes using (idCliente)
    inner join servico using (idOrdem)
    inner join maodeobra using (idMaoDeObra)
    order by Valor desc;
    
-- Valor Total de cada ordem de serviço da Cliente Glaci

select o.idOrdem Ordem_de_Serviço, concat(c.Nome, ' ', c.Sobrenome) Cliente, mo.Valor Mão_de_Obra, sum(p.Valor)  Peças,sum(p.Valor) + mo.Valor Total from ordemservico o
	inner join clientes c  on c.idCliente=o.idCliente
    inner join servico s on o.idOrdem=s.idOrdem
    inner join maodeobra mo on s.idMaoDeObra=mo.idMaoDeObra
    inner join material mt on mt.idOrdem=o.idOrdem
    inner join pecas p on p.idPecas=mt.idPecas
    where c.Nome='Glaci'
    group by o.idOrdem, mo.Valor
    order by o.idOrdem;
    
-- Equipe responsável pela Ordem de Srviço 4

select concat(f.Nome, ' ', f.Sobrenome) Funcionario, Especialidade, Departamento from ordemservico o
	inner join analiseexecucao a on o.idOrdem=a.idOrdem
    inner join equipe e on e.idEquipe=a.idEquipe
    inner join equipefuncionarios ef on e.idEquipe=ef.idEquipe
    inner join funcionarios f on f.idFuncionario=ef.idFuncionario
    where o.idOrdem=4;
	
-- Supervisores responsáveis pelas Ordens de Serviço já finalizadas    
    
select o.idOrdem Ordem_de_Serviço ,concat(f.Nome, ' ', f.Sobrenome) Supervisor, Departamento, Especialidade from ordemservico o
	inner join analiseexecucao a on o.idOrdem=a.idOrdem
    inner join equipe e on e.idEquipe=a.idEquipe
    inner join equipefuncionarios ef on e.idSupervisor=ef.idFuncionario
    inner join funcionarios f on f.idFuncionario=ef.idFuncionario
    where o.StatusServico='Finalizado'
    order by e.idSupervisor;
