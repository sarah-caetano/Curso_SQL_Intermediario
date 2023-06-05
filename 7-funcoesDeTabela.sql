/*
	Autora: Sarah Caetano
	Data: 04/06/2023
	Base: AdventureWorks2014
	Pasta: Documentos/MicrosoftSQLServerManagementStudio/Intermediario

	Função que retorna os dados completos do funcionário.
*/

--DECLARE @BusinessEntityID INT
--SET @BusinessEntityID = 7
CREATE FUNCTION UDF_DadosCompletosFuncionarios()
RETURNS @Retorno TABLE( -- PARÂMETROS QUE VÃO SER RETORNADOS
	NomeCompleto VARCHAR(50),
	Idade INT,
	Nascimento DATE,
	Sexo VARCHAR(1),
	AnosCasa INT,
	Cargo VARCHAR(50)
)

AS
BEGIN
INSERT INTO @Retorno
	SELECT
		P.FirstName + ' ' + ISNULL(P.MiddleName, '') + '. ' + P.LastName AS NomeCompleto,
		DATEDIFF(YEAR, E.BirthDate, GETDATE()) AS Idade,
		E.BirthDate AS Nascimento,
		E.Gender AS Sexo,
		DATEDIFF(YEAR, e.HireDate, GETDATE()) AS AnosCasa,
		E.JobTitle AS Cargo

	FROM 
		[Person].[Person] P INNER JOIN [HumanResources].[Employee] E 
		ON P.BusinessEntityID = E.BusinessEntityID
	--WHERE 
	--	P.BusinessEntityID = @BusinessEntityID
	RETURN
END

-- Como chamar ela:
-- select * from AdventureWorks2014.dbo.UDF_DadosCompletosFuncionarios()