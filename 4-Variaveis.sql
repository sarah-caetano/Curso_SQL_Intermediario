-- Locais
/* DECLARE @maiorPreco DECIMAL(6,2)
SET @maiorPreco = (SELECT MAX(vlProduto) FROM tb_Produtos)
SELECT @maiorPreco AS maiorPreco  -- vari�veis s� funcionam no escopo da execu��o - se n�o selecionar ela na execu��o ela n existe*/

-- CASE
/*SELECT 
	cdProduto,
	nmProduto,
	vlProduto,
	CASE
		WHEN vlProduto <= 6 THEN vlProduto*1.2 -- aumento de 20%
		WHEN vlProduto > 6 THEN vlProduto*0.8 ELSE vlProduto -- desconto de 20%
	END AS vlProdutoComDesconto
FROM tb_Produtos*/
 
 -- IF
 /*DECLARE @decisao SMALLINT
 SET @decisao = 1

 IF @decisao = 1
	SELECT 
		cdProduto,
		nmProduto,
		vlProduto,
		CASE
			WHEN vlProduto > 6 THEN vlProduto*0.8 ELSE vlProduto -- desconto de 20%
		END AS vlProdutoComDesconto
	FROM tb_Produtos
ELSE 
	SELECT 
		cdProduto,
		nmProduto,
		vlProduto
	FROM tb_Produtos*/

-- Intervalos
/*SELECT 
	cdProduto,
	nmProduto,
	vlProduto
FROM tb_Produtos
-- WHERE vlProduto > 4 AND vlProduto < 15
-- WHERE nmProduto = 'Coxinha'
-- WHERE nmProduto LIKE 'Suco %' -- campos que tem suco na frente (todos os sucos)*/

-- Vari�veis tipo TABELA
/*DECLARE @tabela TABLE(
	cdProduto INT PRIMARY KEY,
	nmProduto VARCHAR(50)
)
INSERT INTO @tabela VALUES (1, 'Pamonha')
SELECT * FROM @tabela*/