use dbLojaJailson
-- 1) Retorna a data atual
SELECT GETDATE()

-- 2) Retorna a diferen�a entre a data do meio com a data do final, no formato de tempo do primeiro par�metro
SELECT DATEDIFF(YEAR,'2000-10-23', GETDATE())

-- 3) Adicionar ou remover a data
SELECT DATEADD(YEAR, -1, GETDATE()) -- um ano atr�s

-- 4) Localiza��o da data no tempo
SELECT DATEPART(WEEKDAY, '2000-10-23') -- eu nasci numa segunda! uhu

-- 5) Intervalos de tempo
SELECT * from tb_Vendas WHERE dtVenda BETWEEN DATEADD(YEAR, -1, GETDATE()) AND GETDATE() -- datas das vendas de um ano atr�s at� hj

-- 6) Formata��o
SELECT FORMAT(CAST(GETDATE() as date), 'dd/MM/yyyy') -- seleciona s� a hora, por exemplo

-- tabelas tempor�rias
CREATE TABLE #tmp_dados(
	nome VARCHAR(50),
	idade INT
);
INSERT INTO #tmp_dados(nome, idade) VALUES ('Sarah', 23);
SELECT * FROM #tmp_dados;