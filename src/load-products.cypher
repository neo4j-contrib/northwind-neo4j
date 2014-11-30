// NORTHWIND - load products
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/products.csv" AS row
CREATE (n:Product)
SET n = row,
  n.ProductID = toInt(row.ProductID),
  n.SupplierID = toInt(row.SupplierID),
  n.CategoryID = toInt(row.CategoryID),
  n.UnitPrice = toFloat(row.UnitPrice),
  n.UnitsInStock = toInt(row.UnitsInStock),
  n.UnitsOnOrder = toInt(row.UnitsOnOrder),
  n.ReorderLevel = toInt(row.ReorderLevel),
  n.Discontinued = (row.Discontinued <> "0")
