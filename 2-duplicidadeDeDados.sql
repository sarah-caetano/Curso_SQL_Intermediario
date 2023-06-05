-- SELECT * FROM tb_Produtos
-- SELECT * FROM tb_ProdutoVenda
-- SELECT * FROM #tmp_Backup


-- Salvar os duplicados

-- Segundo:
SELECT nmProduto, vlProduto
INTO #tmp_Backup -- inserir na tabela temporária
FROM tb_Produtos
WHERE nmProduto in (
-- Primeiro:
SELECT
	--COUNT(*),
	nmProduto
FROM 
	tb_Produtos
GROUP BY 
	nmProduto
HAVING
	COUNT(*)>=2 -- os dados duplicados
)
-- Apagar os duplicados da base principal
BEGIN TRAN;
DELETE FROM tb_ProdutoVenda

DELETE FROM tb_Produtos WHERE nmProduto in (
SELECT
	--COUNT(*),
	nmProduto
FROM 
	tb_Produtos
GROUP BY 
	nmProduto
HAVING
	COUNT(*)>=2
)
DELETE FROM #tmp_Backup WHERE vlProduto = 2.5

INSERT INTO tb_Produtos
SELECT * FROM #tmp_Backup

DELETE FROM tb_Produtos WHERE cdProduto = 40;
DELETE FROM tb_Produtos WHERE cdProduto = 41;

-- ROLLBACK TRAN;
-- Voltar com os dados sem a duplicidade