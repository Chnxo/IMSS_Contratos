/*
   Monday, November 05, 20125:56:49 PM
   User: 
   Server: pse020\sqlexpress
   Database: IMSS_CSC
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Paciente_RMN SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Estudio_RMN
	DROP CONSTRAINT FK_Estudio_RMN_Tipo_Estudio_RMN
GO
ALTER TABLE dbo.Tipo_Estudio_RMN SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Estudio_RMN
	DROP CONSTRAINT FK_Estudio_RMN_Prioridad_RMN
GO
ALTER TABLE dbo.Prioridad_RMN SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Estudio_RMN
	(
	Est_Id int NOT NULL IDENTITY (1, 1),
	Est_Fecha_sol nchar(10) NOT NULL,
	Est_Fecha_rea nchar(10) NOT NULL,
	Est_Observaciones nvarchar(MAX) NULL,
	Fk_Tipo_Id int NOT NULL,
	Fk_Pri_Id int NOT NULL,
	Fk_Pac_Afiliacion int NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Estudio_RMN SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Estudio_RMN ON
GO
IF EXISTS(SELECT * FROM dbo.Estudio_RMN)
	 EXEC('INSERT INTO dbo.Tmp_Estudio_RMN (Est_Id, Est_Fecha_sol, Est_Fecha_rea, Est_Observaciones, Fk_Tipo_Id, Fk_Pri_Id, Fk_Pac_Afiliacion)
		SELECT Est_Id, Est_Fecha_sol, Est_Fecha_rea, Est_Observaciones, Fk_Tipo_Id, Fk_Pri_Id, CONVERT(int, Fk_Pac_Afiliacion) FROM dbo.Estudio_RMN WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Estudio_RMN OFF
GO
DROP TABLE dbo.Estudio_RMN
GO
EXECUTE sp_rename N'dbo.Tmp_Estudio_RMN', N'Estudio_RMN', 'OBJECT' 
GO
ALTER TABLE dbo.Estudio_RMN ADD CONSTRAINT
	PK_Estudio_RMN_1 PRIMARY KEY CLUSTERED 
	(
	Est_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Estudio_RMN ADD CONSTRAINT
	FK_Estudio_RMN_Prioridad_RMN FOREIGN KEY
	(
	Fk_Pri_Id
	) REFERENCES dbo.Prioridad_RMN
	(
	Pri_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Estudio_RMN ADD CONSTRAINT
	FK_Estudio_RMN_Tipo_Estudio_RMN FOREIGN KEY
	(
	Fk_Tipo_Id
	) REFERENCES dbo.Tipo_Estudio_RMN
	(
	Tip_Est_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Estudio_RMN ADD CONSTRAINT
	FK_Estudio_RMN_Paciente_RMN FOREIGN KEY
	(
	Est_Id
	) REFERENCES dbo.Paciente_RMN
	(
	Pac_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
