USE [IMSS_CSC]
GO
/****** Object:  StoredProcedure [dbo].[agr_est_RMN]    Script Date: 11/13/2012 15:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[agr_est_RMN]
    @fecha_uno nchar(10),
    @fecha_dos nchar(10),
    @observ nvarchar(MAX),
    @fktipo_id int,
    @fkcal_id int,
    @fkpac_afi nvarchar(16)
AS
BEGIN
	
    insert into Estudio_RMN
	values
	(
		@fecha_uno,@fecha_dos,@observ,@fktipo_id,@fkcal_id,@fkpac_afi
	)
	select SCOPE_IDENTITY()
END