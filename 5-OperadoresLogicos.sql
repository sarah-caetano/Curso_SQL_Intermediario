
SELECT * FROM tb_Clientes
WHERE DATEDIFF(YEAR, dtNascimento, GETDATE()) < 30 
AND NOT (inSexo = 'F') -- Clientes homens que s�o mais novos que 30 anos

-- AND, NOT, OR