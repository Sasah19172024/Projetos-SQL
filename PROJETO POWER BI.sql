-- ##############################################################
--         PROJETO DE INTEGRAÇÂO SQL SERVER E POWER BI
-- ##############################################################

--1. Apresentação

--2. Download Branco de dados adventureWorks 2014

--3. Definindo os indicadores do projeto

--ABA GERAL

-- i) Receita Total
-- ii) Quantidade Vendida
-- iii) Total de Categoria de Produtos
-- iv) Quantidades de Clientes
-- v) Receita Total e Lucro por Mes
-- vi) Margem de lucro
-- vii) Quantidade Vendida por Mes
-- viii) Lucro por País

--ABA CLIENTES

-- i) Vendas por País
-- ii) Clientes por País
-- iii) Clientes por Gênero
-- iv) Vendas por Categoria


--4. Defininfo as Tabelas e Colunas a serem usadas no projeto

-- Tabela

SELECT * FROM FactInternetSales
SELECT * FROM DimProductCategory
SELECT * FROM DimCustomer
SELECT * FROM DimGeography


-- COLUNAS

-- SalesOrderNumber               (FactInternetSales)
-- OrderDate                      (FactInternetSales)
-- EnglishProductCategoryName     (DimProductCategory)****
-- CustomerKey                    (DimCustomer)
-- FirstName + ' ' + LastName     (DimCustomer)
-- Gender                         (DimCustomer)
-- EnglishCountryRegionName       (DimGeography)
-- OrderQuantity                  (FactInternetSales)
-- SalesAmount                    (FactInternetSales)
-- ToatlProductCost               (FactInternetSales)
-- SalesAmount - TotalProductCost (FactInternetSales)


--5. Criando a VIEW RESULTADOS_ADW

CREATE OR ALTER VIEW RESULTADOS_ADW
AS
SELECT 
	FIS.SalesOrderNumber AS'N° PEDIDO',
	FIS.OrderDate AS'DATA PEDIDO',
	EnglishProductCategoryName AS'CATEGORIA PRODUTO',
	DC.CustomerKey AS'ID CLIENTE',
	DC.FirstName + ' ' + DC.LastName AS'NOME CLIENTE',
	REPLACE(REPLACE(DC.Gender, 'M', 'Masculino'), 'F', 'Feminino') AS'GENERO',
	DG.EnglishCountryRegionName AS'PAIS',
	FIS.OrderQuantity AS'QTD. VENDIDA',
	FIS.SalesAmount AS'RECEITA VENDIDA',
	FIS.TotalProductCost AS'CUSTO VENDA',
	FIS.SalesAmount - FIS.TotalProductCost AS'LUCRO VENDA'
FROM FactInternetSales FIS
INNER JOIN DimProduct DP ON FIS.ProductKey = DP. ProductKey
	INNER JOIN DimProductSubcategory DPS ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey
		INNER JOIN DimProductCategory DPC ON DPS.ProductCategoryKey = DPC.ProductCategoryKey
INNER JOIN DimCustomer DC ON FIS.CustomerKey = DC.CustomerKey
	INNER JOIN DimGeography DG ON DC. GeographyKey = DG.GeographyKey


SELECT * FROM RESULTADOS_ADW

BEGIN TRANSACTION T1
UPDATE FactInternetSales
SET OrderQuantity = 1

COMMIT TRANSACTION T1