ALTER PROCEDURE actualizarPresupuesto
	@PresupuestoID int,
	@Costo decimal
AS
BEGIN
	UPDATE Presupuesto 
	SET 
		Pre_Monto = @Costo
	WHERE
		Pre_Id = @PresupuestoID	
	SELECT Pre_Monto FROM Presupuesto WHERE Pre_Id = @PresupuestoID
END