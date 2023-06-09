USE [Sql_Test]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION dbo.udf_GetSKUPrice (@ID_SKU int)
  RETURNS DECIMAL(18,2)
AS
  BEGIN
  DECLARE @value DECIMAL(18,2);
    SELECT @value = SUM(b.Value)/SUM(b.Quantity) 
      FROM dbo.Basket b 
     WHERE b.ID_SKU = @ID_SKU;
	 RETURN ISNULL(@value, 0);
  END;
