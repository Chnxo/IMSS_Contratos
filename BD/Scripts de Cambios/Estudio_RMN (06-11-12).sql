/*
   Tuesday, November 06, 201210:29:23 AM
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
ALTER TABLE dbo.Estudio_RMN
	DROP CONSTRAINT FK_Estudio_RMN_Paciente_RMN
GO
ALTER TABLE dbo.Paciente_RMN SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Estudio_RMN ADD CONSTRAINT
	FK_Estudio_RMN_Paciente_RMN FOREIGN KEY
	(
	Fk_Pac_Afiliacion
	) REFERENCES dbo.Paciente_RMN
	(
	Pac_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Estudio_RMN SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
