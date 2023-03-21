USE [Sql_Test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER TRIGGER [dbo].[TR_Basket_insert_update] 
   ON [dbo].[Basket] 
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Basket
	     SET DiscountValue = i.value * 0.05 
		 FROM dbo.Basket b
		 JOIN inserted i on i.ID = b.ID
		WHERE b.ID_SKU IN (SELECT ID_SKU
				     FROM inserted
				     GROUP BY ID_SKU
				     HAVING COUNT(ID_SKU) > 1);
    UPDATE dbo.Basket
	     SET DiscountValue = 0
		 FROM dbo.Basket b
		 JOIN inserted i on i.ID = b.ID
		WHERE b.ID_SKU IN (SELECT ID_SKU
				     FROM inserted
				     GROUP BY ID_SKU
				     HAVING COUNT(ID_SKU) = 1);
END
