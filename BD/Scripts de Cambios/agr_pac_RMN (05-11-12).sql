USE [IMSS_CSC]
GO
/****** Object:  StoredProcedure [dbo].[agr_pac_RMN]    Script Date: 11/05/2012 17:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[agr_pac_RMN]
    @afiliacion nvarchar(16),
    @ape_pat nvarchar(25),
    @ape_mat nvarchar(25),
    @nombre nvarchar(max),
    @num_tel nchar(11)
as
BEGIN
    insert into Paciente_RMN values(@afiliacion,@ape_pat,@ape_mat,@nombre,@num_tel)
    select SCOPE_IDENTITY()
END