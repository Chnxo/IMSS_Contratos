CREATE PROCEDURE getPresupuesto
AS
BEGIN
	SELECT * FROM Presupuesto WHERE
		Pre_Ano = YEAR(GETDATE())
END
GO
