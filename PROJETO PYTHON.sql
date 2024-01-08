-- Projeto 1 - Integra��o Python e SQL

-- Aula 1. Explica��o do projedo de integra��o
-- Aula 2. Preparando o SQL Server para a integra��o
-- Aula 3. configura��es iniciais no Jupyter
-- Aula 4. Adicionando os comandos em SQL dentro do Jupyter
-- Aula 5. Tornando o cadastro de dados autom�tico por meio de vari�veis

CREATE DATABASE PythonSQL
USE PythonSQL

CREATE TABLE Vendas(
	id_venda INT,
	data_venda DATE,
	cliente VARCHAR(100),
	produto VARCHAR(100),
	preco DECIMAL(10,2),
	quantidade INT)

INSERT INTO Vendas(id_venda, data_venda,cliente,produto,preco,quantidade)
VALUES
	(1, '22/04/2022', 'Ana', 'Celular', 2000, 1)


SELECT * FROM Vendas