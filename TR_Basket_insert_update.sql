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
	-- Как исправить ошибку при одновременном добавлении строк с разным SKU_ID Я не знаю
    IF (SELECT COUNT(1)
	      FROM inserted
		  GROUP BY ID_SKU) > 1
	   UPDATE dbo.Basket
	     SET DiscountValue = i.value * 0.05 
		 FROM dbo.Basket b
		 JOIN inserted i on i.ID = b.ID;
	ELSE
	  UPDATE dbo.Basket
	     SET DiscountValue = 0
		FROM dbo.Basket b
		JOIN inserted i on i.ID = b.ID;
END
