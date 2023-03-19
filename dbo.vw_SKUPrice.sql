CREATE VIEW dbo.vw_SKUPrice
AS
SELECT s.*,
       dbo.udf_GetSKUPrice(s.ID) as Price
  FROM dbo.SKU s;