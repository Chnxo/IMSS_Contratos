CREATE PROCEDURE  eli_paciente
	@id int
AS
BEGIN
	DELETE Paciente where Pac_Id = @id
END
GO
