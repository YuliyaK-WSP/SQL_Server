USE [Sql_Test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE dbo.usp_MakeFamilyPurchase
  (@FamilySurName varchar(255))
AS
BEGIN
	DECLARE @cnt INT;
	SELECT @cnt = COUNT(1)
	  FROM dbo.Family f
	 WHERE f.SurName = @FamilySurName;
	IF @cnt > 0 
		UPDATE dbo.Family
		  SET BudgetValue = BudgetValue - (SELECT SUM(b.Value)
		                       FROM dbo.Basket b)
		 WHERE SurName = @FamilySurName;
	ELSE
		RAISERROR ('Такой семьи нет', -1, -1);
END
GO
