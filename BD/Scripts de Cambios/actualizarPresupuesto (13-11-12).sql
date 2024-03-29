USE [IMSS_CSC]
GO
/****** Object:  StoredProcedure [dbo].[actualizarPresupuesto]    Script Date: 11/13/2012 16:22:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[actualizarPresupuesto]
	@PresupuestoID int,
	@Costo decimal
AS
BEGIN
	UPDATE Presupuesto 
	SET 
		Pre_Monto = Pre_Monto - @Costo
	WHERE
		Pre_Id = @PresupuestoID	
	SELECT Pre_Monto FROM Presupuesto WHERE Pre_Id = @PresupuestoID
END