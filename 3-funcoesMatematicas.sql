-- SELECT AVG(vlProduto) FROM tb_Produtos
-- SELECT STDEV(vlProduto) FROM tb_Produtos

/*SELECT nmProduto, vlProduto, Calc.Media, Calc.DesvioPadrao, (vlProduto - Calc.Media)/Calc.DesvioPadrao AS Z_Score
FROM tb_Produtos,
(SELECT AVG(vlProduto) AS Media, STDEV(vlProduto) AS DesvioPadrao
FROM tb_Produtos) Calc*/

/*SELECT nmProduto, vlProduto, AVG(vlProduto) OVER() AS Media, STDEV(vlProduto) OVER() AS DesvioPadrao -- usando OVER!
FROM tb_Produtos*/

/*UPDATE tb_Produtos
SET vlProduto = 4.25
WHERE nmProduto = 'Suco de Morango'*/ -- arrumando o valor do suco de morango para não ter valor repetido

SELECT nmProduto, 
		vlProduto,
		Posicao
FROM(
	SELECT 
		nmProduto, 
		vlProduto,
		RANK() OVER(ORDER BY vlProduto) AS Posicao -- rankear e ordenar os dados
	FROM tb_Produtos) Dados
WHERE Posicao <= 5

-- select * from tb_Produtos

--DESC --O DESC ORDENA DO MAIOR PRO MENOR