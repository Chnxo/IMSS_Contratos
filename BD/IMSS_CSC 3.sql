USE [master]
GO
/****** Object:  Database [IMSS_CSC]    Script Date: 12/06/2012 15:02:16 ******/
CREATE DATABASE [IMSS_CSC] ON  PRIMARY 
( NAME = N'IMSS_CSC', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\IMSS_CSC.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMSS_CSC_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\IMSS_CSC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IMSS_CSC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMSS_CSC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMSS_CSC] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [IMSS_CSC] SET ANSI_NULLS OFF
GO
ALTER DATABASE [IMSS_CSC] SET ANSI_PADDING OFF
GO
ALTER DATABASE [IMSS_CSC] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [IMSS_CSC] SET ARITHABORT OFF
GO
ALTER DATABASE [IMSS_CSC] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [IMSS_CSC] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [IMSS_CSC] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [IMSS_CSC] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [IMSS_CSC] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [IMSS_CSC] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [IMSS_CSC] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [IMSS_CSC] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [IMSS_CSC] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [IMSS_CSC] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [IMSS_CSC] SET  DISABLE_BROKER
GO
ALTER DATABASE [IMSS_CSC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [IMSS_CSC] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [IMSS_CSC] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [IMSS_CSC] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [IMSS_CSC] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [IMSS_CSC] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [IMSS_CSC] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [IMSS_CSC] SET  READ_WRITE
GO
ALTER DATABASE [IMSS_CSC] SET RECOVERY SIMPLE
GO
ALTER DATABASE [IMSS_CSC] SET  MULTI_USER
GO
ALTER DATABASE [IMSS_CSC] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [IMSS_CSC] SET DB_CHAINING OFF
GO
USE [IMSS_CSC]
GO
/****** Object:  Table [dbo].[Tipo_Estudio_RMN]    Script Date: 12/06/2012 15:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Estudio_RMN](
	[Tip_Est_Id] [int] IDENTITY(0,1) NOT NULL,
	[Tip_Est_Nombre] [nvarchar](max) NOT NULL,
	[Tip_Est_Costo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Tipo_Estudio_RMN] PRIMARY KEY CLUSTERED 
(
	[Tip_Est_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prioridad_RMN]    Script Date: 12/06/2012 15:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prioridad_RMN](
	[Pri_Id] [int] IDENTITY(0,1) NOT NULL,
	[Pri_Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Calidad] PRIMARY KEY CLUSTERED 
(
	[Pri_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 12/06/2012 15:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuesto](
	[Pre_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pre_partida] [int] NOT NULL,
	[Pre_num_contrato] [int] NOT NULL,
	[Pre_concepto] [nvarchar](50) NOT NULL,
	[Pre_Ano] [int] NOT NULL,
	[Pre_Monto] [decimal](18, 2) NOT NULL,
	[Pre_Vigencia] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Presupuesto_1] PRIMARY KEY CLUSTERED 
(
	[Pre_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente_RMN]    Script Date: 12/06/2012 15:02:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente_RMN](
	[Pac_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pac_Afiliacion] [nvarchar](16) NOT NULL,
	[Pac_Apellido_Pat] [nvarchar](25) NOT NULL,
	[Pac_Apellido_Mat] [nvarchar](25) NOT NULL,
	[Pac_Nombre] [nvarchar](50) NOT NULL,
	[Pac_Num_Tel] [nchar](11) NULL,
 CONSTRAINT [PK_Paciente_RMN_1] PRIMARY KEY CLUSTERED 
(
	[Pac_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[eli_paciente]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[eli_paciente]
	@id int
AS
BEGIN
	DELETE Paciente where Pac_Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[getPresupuesto]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPresupuesto]
AS
BEGIN
	SELECT * FROM Presupuesto WHERE
		Pre_Ano = YEAR(GETDATE())
END
GO
/****** Object:  Table [dbo].[Estudio_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudio_RMN](
	[Est_Id] [int] IDENTITY(1,1) NOT NULL,
	[Est_Fecha_sol] [nchar](10) NOT NULL,
	[Est_Fecha_rea] [nchar](10) NOT NULL,
	[Est_Observaciones] [nvarchar](max) NULL,
	[Fk_Tipo_Id] [int] NOT NULL,
	[Fk_Pri_Id] [int] NOT NULL,
	[Fk_Pac_Afiliacion] [int] NOT NULL,
 CONSTRAINT [PK_Estudio_RMN_1] PRIMARY KEY CLUSTERED 
(
	[Est_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[eli_tipo_est_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eli_tipo_est_RMN]
	@id int
AS
BEGIN
	delete from Tipo_Estudio_RMN where Tip_Est_Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[eli_prioridad_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eli_prioridad_RMN]
	@id int
AS
BEGIN
	DELETE FROM Prioridad_RMN WHERE Pri_Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[agr_tip_Prioridad_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_tip_Prioridad_RMN]
	@id int,
	@nombre nvarchar(50)
AS
BEGIN
	if (@id >= 0)
	begin
		update Prioridad_RMN set Pri_Nombre = @nombre where Pri_Id= @id
	end
	else
	begin
		insert into Prioridad_RMN
		values
		(
			@nombre
		)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[agr_tip_est_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_tip_est_RMN]
	@nombre nvarchar(max),
	@costo money
AS
BEGIN
	insert into Tipo_Estudio_RMN
	values
	(
		@nombre,
		@costo
	)
END
GO
/****** Object:  StoredProcedure [dbo].[agr_presupuesto_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_presupuesto_RMN]
    @partida int,
    @num_contrato int,
    @concepto nvarchar(50),
	@ano int,
    @monto decimal(18,2),
    @vigencia nvarchar(10)
AS
BEGIN
	insert into Presupuesto
	values
	(
        @partida,
        @num_contrato,
        @concepto,
		@ano,
        @monto,
        @vigencia
	)
END
GO
/****** Object:  StoredProcedure [dbo].[agr_pac_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_pac_RMN]
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
GO
/****** Object:  StoredProcedure [dbo].[Bus_Tipo_EstudioRMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Bus_Tipo_EstudioRMN]
 @nombre nvarchar(max)
as

BEGIN
    select Tipo_Estudio_RMN.Tip_Est_Costo from Tipo_Estudio_RMN
     where Tipo_Estudio_RMN.Tip_Est_Nombre=@nombre
END
GO
/****** Object:  StoredProcedure [dbo].[all_tip_prioridad_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[all_tip_prioridad_RMN]
as
begin
  select * from Prioridad_RMN
end
GO
/****** Object:  StoredProcedure [dbo].[all_tip_est_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[all_tip_est_RMN]
as
begin
  select * from Tipo_Estudio_RMN
end
GO
/****** Object:  StoredProcedure [dbo].[all_presupuestos_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[all_presupuestos_RMN]
as
begin
  select * from Presupuesto
end
GO
/****** Object:  StoredProcedure [dbo].[mod_tip_est_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mod_tip_est_RMN]
    @id int,
    @nombre nvarchar(max),
	@costo money
AS
BEGIN
	update Tipo_Estudio_RMN
	set
        Tip_Est_Nombre = @nombre,
		Tip_Est_Costo = @costo
		
	where Tip_Est_Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[mod_prioridad]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mod_prioridad]
    @id int,
    @nombre nvarchar(50)
AS
BEGIN
	update Prioridad_RMN
	set
        Pri_Nombre = @nombre
		
	where Pri_Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[mod_presupuesto]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mod_presupuesto]
    @id int,
    @partida int,
	@num_contrato int,
    @concepto nvarchar(50),
    @ano int,
    @monto decimal(18,2),
    @vigencia nvarchar(10)
AS
BEGIN
	update Presupuesto
	set
        Pre_partida = @partida,
        Pre_num_contrato = @num_contrato,
        Pre_concepto = @concepto,
        Pre_Ano = @ano,
        Pre_Monto = @monto,
        Pre_Vigencia = @vigencia
		
	where Pre_Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[mod_paciente]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mod_paciente]
    @afil int,
    @a_pat nvarchar(25),
    @a_mat nvarchar(25),
    @nombre nvarchar(50),
    @num_tel nchar(11)
AS
BEGIN
	update Paciente_RMN
	set
        Pac_Apellido_Pat = @a_pat,
        Pac_Apellido_Mat = @a_pat,
        Pac_Nombre = @nombre,
        Pac_Num_Tel = @num_tel
		
	where Pac_Afiliacion = @afil
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarPresupuesto]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarPresupuesto]
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
GO
/****** Object:  StoredProcedure [dbo].[eli_Estudio_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[eli_Estudio_RMN]
	@codigo int
AS
BEGIN
	delete from Estudio_RMN where  Est_Id= @codigo
END
GO
/****** Object:  StoredProcedure [dbo].[Mod_Estudios_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mod_Estudios_RMN]
@id int,
@fecha_so nchar(10),
@fecha_re nchar(10),
@Observa nvarchar(max),
@fk_Tipo_id int,
@fk_Cal_id int,
@fk_afiliacion nvarchar(16)
as
begin
update Estudio_RMN
set
Est_Fecha_sol=@fecha_so,Est_Fecha_rea=@fecha_re,Est_Observaciones=@Observa,Fk_Tipo_id=@fk_Tipo_Id,
Fk_Cal_Id=@fk_Cal_id,Fk_Pac_Afiliacion=@fk_afiliacion
where Est_Id=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[mostrar_estudios]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mostrar_estudios]
as
begin
select Estudio_RMN.Est_Id as 'Núm. Estudio',Estudio_RMN.Est_Fecha_sol as 'Fecha de solicitud',
Estudio_RMN.Est_Fecha_rea as 'Fecha de realización',Paciente_RMN.Pac_Afiliacion as 'Afiliación',
Paciente_RMN.Pac_Apellido_Pat as 'Apellido Paterno',
Paciente_RMN.Pac_Apellido_Mat as 'Apellido Materno',
Paciente_RMN.Pac_Nombre as 'Nombre del paciente',
Tipo_Estudio_RMN.Tip_Est_Nombre as 'Tipo de estudio',
Tipo_Estudio_RMN.Tip_Est_Costo as 'Costo del estudio',
Prioridad_RMN.Pri_Nombre as 'Prioridad del estudio',
Estudio_RMN.Est_Observaciones as 'Observaciones'
from Estudio_RMN inner join Paciente_RMN on Fk_Pac_Afiliacion=Pac_Afiliacion
inner join Tipo_Estudio_RMN on Fk_Tipo_Id=Tip_Est_Id inner join Prioridad_RMN
on Fk_Pri_Id=Pri_Id
end
GO
/****** Object:  StoredProcedure [dbo].[all_estudios_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[all_estudios_RMN]
as
begin
   select * from Estudio_RMN
end
GO
/****** Object:  StoredProcedure [dbo].[agr_est_RMN]    Script Date: 12/06/2012 15:02:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agr_est_RMN]
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
GO
/****** Object:  ForeignKey [FK_Estudio_RMN_Paciente_RMN]    Script Date: 12/06/2012 15:02:26 ******/
ALTER TABLE [dbo].[Estudio_RMN]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RMN_Paciente_RMN] FOREIGN KEY([Fk_Pac_Afiliacion])
REFERENCES [dbo].[Paciente_RMN] ([Pac_Id])
GO
ALTER TABLE [dbo].[Estudio_RMN] CHECK CONSTRAINT [FK_Estudio_RMN_Paciente_RMN]
GO
/****** Object:  ForeignKey [FK_Estudio_RMN_Prioridad_RMN]    Script Date: 12/06/2012 15:02:26 ******/
ALTER TABLE [dbo].[Estudio_RMN]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RMN_Prioridad_RMN] FOREIGN KEY([Fk_Pri_Id])
REFERENCES [dbo].[Prioridad_RMN] ([Pri_Id])
GO
ALTER TABLE [dbo].[Estudio_RMN] CHECK CONSTRAINT [FK_Estudio_RMN_Prioridad_RMN]
GO
/****** Object:  ForeignKey [FK_Estudio_RMN_Tipo_Estudio_RMN]    Script Date: 12/06/2012 15:02:26 ******/
ALTER TABLE [dbo].[Estudio_RMN]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RMN_Tipo_Estudio_RMN] FOREIGN KEY([Fk_Tipo_Id])
REFERENCES [dbo].[Tipo_Estudio_RMN] ([Tip_Est_Id])
GO
ALTER TABLE [dbo].[Estudio_RMN] CHECK CONSTRAINT [FK_Estudio_RMN_Tipo_Estudio_RMN]
GO
