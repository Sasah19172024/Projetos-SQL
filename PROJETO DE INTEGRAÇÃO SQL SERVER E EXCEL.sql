-- ###############################################
--    PROJETO DE INTEGRAÇÃO SQL SERVER E EXCEL
-- ###############################################

--1. Apresentação

--2. Download Banco de Dados AdventureWorks 2014

--3. Definindo os indicadores do projeto
--i) Total de vendas Internet por categoria
--ii) Receita total internet por mes do pedido
--iii) Receita e custo total internet por pais
--iv) Total de vendas de internet por sexo

--OBS: O ANO DE ANALISE SERA APEAS 2013 (ano do pedido)

--4. Definindo Tabelas
-- i) FactInternetSales
-- ii) DimProductCategory
-- iii)	DimSalesTerritory
-- iv) DimCustomer


--5. Definindo as colunas da view VENDAS_INTERNET

-- VIEW FINAL VENDAS_INTERNET
--Colunas:

--SalesOrderNumber                    (TABELA 1: FactInternetSales)
--OrderDate                           (TABELA 1: FactInternetSales)
--EnglishProductCategoryName          (TABELA 4: DimProductCategory)
--FirstNameLastName                   (TABELA 2: DimCustomer)
--Gender                              (TABELA 2: DimCustomer)
--SalesTerritoryCountry               (TABELA 3: DimSalesTerritory)
--OrderQuantity                       (TABELA 1: FactInternetSales)
--TotalProductCost                    (TABELA 1: FactInternetSales)
--SalesAmount                         (TABELA 1: FactInternetSales)


--6. Criando o código da view VENDAS INTERNET

 -- i) Total de Vendas Internet por Categoria do Produtoa
 -- ii) Receita Total Internet por Mês do Pedido
 -- iii) Receita e Custo Total Internet por País
 -- iv) Total de Vendas Internet por Sexo do Cliente

 --OBS: 0 ANO DE ANÁLISE SERÁ APENAS 2013 (ANO DO PEDIDO)
CREATE OR ALTER VIEW VENDAS_INTERNET AS
SELECT
	fis.SalesOrderNumber AS 'NUM DO PEDIDO',
	fis.OrderDate 'DATA PEDIDO',
	dpc.EnglishProductCategoryName 'CATEGORIA PRODUTO',
	dc. FirstName +dc. LastName 'NOME CLIENTE',
	Gender AS 'SEXO',
	SalesTerritoryCountry 'PAIS',
	fis.OrderQuantity 'QTD VENDAS',
	fis. TotalProductCost 'CUSTO DE VENDA',
	fis.SalesAmount 'RECEITA DE VENDA'
FROM FactInternetSales fis
	INNER JOIN DimProduct dp ON fis.ProductKey = dp. ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
	INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
	INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimSalesTerritory dst ON fis.SalesTerritoryKey= dst.SalesTerritoryKey 
WHERE YEAR (OrderDate) = 2013



 
 
 

	


