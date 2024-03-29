SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente_RMN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente_RMN](
	[Pac_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pac_Afiliacion] [nvarchar](16) NOT NULL,
	[Pac_Apellido_Pat] [nvarchar](25) NOT NULL,
	[Pac_Apellido_Mat] [nvarchar](25) NOT NULL,
	[Pac_Nombre] [nvarchar](50) NOT NULL,
	[Pac_Num_Tel] [nchar](11) NULL,
 CONSTRAINT [PK_Paciente_RMN] PRIMARY KEY CLUSTERED 
(
	[Pac_Afiliacion] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mod_Estudios_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Mod_Estudios_RMN]
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
end' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agr_tip_Prioridad_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[agr_tip_Prioridad_RMN]
	@nombre nvarchar(50)
AS
BEGIN
	insert into Prioridad_RMN
	values
	(
		@nombre
	)
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[all_tip_prioridad_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[all_tip_prioridad_RMN]
as
begin
  select * from Prioridad_RMN
end' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agr_tip_est_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[agr_tip_est_RMN]
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eli_tipo_est_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[eli_tipo_est_RMN]
	@id int
AS
BEGIN
	delete from Tipo_Estudio_RMN where Tip_Est_Id = @id
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mod_tip_est_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mod_tip_est_RMN]
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agr_presupuesto_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[agr_presupuesto_RMN]
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[all_tip_est_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[all_tip_est_RMN]
as
begin
  select * from Tipo_Estudio_RMN
end' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[all_presupuestos_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[all_presupuestos_RMN]
as
begin
  select * from Presupuesto
end' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prioridad_RMN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prioridad_RMN](
	[Pri_Id] [int] IDENTITY(0,1) NOT NULL,
	[Pri_Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Calidad] PRIMARY KEY CLUSTERED 
(
	[Pri_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agr_est_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[agr_est_RMN]
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[all_estudios_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[all_estudios_RMN]
as
begin
   select * from Estudio_RMN
end' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[agr_pac_RMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[agr_pac_RMN]
    @afiliacion nvarchar(16),
    @ape_pat nvarchar(25),
    @ape_mat nvarchar(25),
    @nombre nvarchar(max),
    @num_tel nchar(11)
as
BEGIN
    insert into Paciente_RMN values(@afiliacion,@ape_pat,@ape_mat,@nombre,@num_tel)
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bus_Tipo_EstudioRMN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Bus_Tipo_EstudioRMN]
 @nombre nvarchar(max)
as

BEGIN
    select Tipo_Estudio_RMN.Tip_Est_Costo from Tipo_Estudio_RMN
     where Tipo_Estudio_RMN.Tip_Est_Nombre=@nombre
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[elimina]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[elimina]
	@codigo int
AS
BEGIN
	delete from Estudio_RMN where  Est_Id= @codigo
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mod_presupuesto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mod_presupuesto]
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mod_paciente]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mod_paciente]
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
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Presupuesto]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tipo_Estudio_RMN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tipo_Estudio_RMN](
	[Tip_Est_Id] [int] IDENTITY(0,1) NOT NULL,
	[Tip_Est_Nombre] [nvarchar](max) NOT NULL,
	[Tip_Est_Costo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Tipo_Estudio_RMN] PRIMARY KEY CLUSTERED 
(
	[Tip_Est_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estudio_RMN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estudio_RMN](
	[Est_Id] [int] IDENTITY(1,1) NOT NULL,
	[Est_Fecha_sol] [nchar](10) NOT NULL,
	[Est_Fecha_rea] [nchar](10) NOT NULL,
	[Est_Observaciones] [nvarchar](max) NULL,
	[Fk_Tipo_Id] [int] NOT NULL,
	[Fk_Pri_Id] [int] NOT NULL,
	[Fk_Pac_Afiliacion] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Estudio_RMN_1] PRIMARY KEY CLUSTERED 
(
	[Est_Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mod_prioridad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mod_prioridad]
    @id int,
    @nombre nvarchar(50)
AS
BEGIN
	update Prioridad_RMN
	set
        Pri_Nombre = @nombre
		
	where Pri_Id = @id
END' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrar_estudios]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrar_estudios]
as
begin
select Estudio_RMN.Est_Id as ''Núm. Estudio'',Estudio_RMN.Est_Fecha_sol as ''Fecha de solicitud'',
Estudio_RMN.Est_Fecha_rea as ''Fecha de realización'',Paciente_RMN.Pac_Afiliacion as ''Afiliación'',
Paciente_RMN.Pac_Apellido_Pat as ''Apellido Paterno'',
Paciente_RMN.Pac_Apellido_Mat as ''Apellido Materno'',
Paciente_RMN.Pac_Nombre as ''Nombre del paciente'',
Tipo_Estudio_RMN.Tip_Est_Nombre as ''Tipo de estudio'',
Tipo_Estudio_RMN.Tip_Est_Costo as ''Costo del estudio'',
Prioridad_RMN.Pri_Nombre as ''Prioridad del estudio'',
Estudio_RMN.Est_Observaciones as ''Observaciones''
from Estudio_RMN inner join Paciente_RMN on Fk_Pac_Afiliacion=Pac_Afiliacion
inner join Tipo_Estudio_RMN on Fk_Tipo_Id=Tip_Est_Id inner join Prioridad_RMN
on Fk_Pri_Id=Pri_Id
end' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Estudio_RMN_Paciente_RMN]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudio_RMN]'))
ALTER TABLE [dbo].[Estudio_RMN]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RMN_Paciente_RMN] FOREIGN KEY([Fk_Pac_Afiliacion])
REFERENCES [dbo].[Paciente_RMN] ([Pac_Afiliacion])
GO
ALTER TABLE [dbo].[Estudio_RMN] CHECK CONSTRAINT [FK_Estudio_RMN_Paciente_RMN]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Estudio_RMN_Prioridad_RMN]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudio_RMN]'))
ALTER TABLE [dbo].[Estudio_RMN]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RMN_Prioridad_RMN] FOREIGN KEY([Fk_Pri_Id])
REFERENCES [dbo].[Prioridad_RMN] ([Pri_Id])
GO
ALTER TABLE [dbo].[Estudio_RMN] CHECK CONSTRAINT [FK_Estudio_RMN_Prioridad_RMN]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Estudio_RMN_Tipo_Estudio_RMN]') AND parent_object_id = OBJECT_ID(N'[dbo].[Estudio_RMN]'))
ALTER TABLE [dbo].[Estudio_RMN]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RMN_Tipo_Estudio_RMN] FOREIGN KEY([Fk_Tipo_Id])
REFERENCES [dbo].[Tipo_Estudio_RMN] ([Tip_Est_Id])
GO
ALTER TABLE [dbo].[Estudio_RMN] CHECK CONSTRAINT [FK_Estudio_RMN_Tipo_Estudio_RMN]
