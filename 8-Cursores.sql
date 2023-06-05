-- Variáveis do cursor
DECLARE @FirstName VARCHAR(50),
		@MiddleName VARCHAR(50),
		@LastName VARCHAR(50)
-- Criando um cursor
DECLARE cur_NomeCompleto CURSOR
FOR SELECT FirstName, 
		   MiddleName, 
		   LastName 
	FROM Person.Person

-- Abrindo o cursor
OPEN cur_NomeCompleto

-- Selecionar os dados
FETCH NEXT FROM cur_NomeCompleto
INTO @FirstName, @MiddleName, @LastName

WHILE @@FETCH_STATUS = 0 -- loop que pega todos os nomes com query dinâmica
BEGIN 
	SELECT @FirstName + ' ' + ISNULL(@MiddleName, '') + @LastName

	FETCH NEXT FROM cur_NomeCompleto
	INTO @FirstName, @MiddleName, @LastName
END

SELECT @FirstName, @MiddleName, @LastName

--Fechando e desalocando o cursor da memória
CLOSE cur_NomeCompleto
DEALLOCATE cur_NomeCompleto