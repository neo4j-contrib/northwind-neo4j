// NORTHWIND - load suppliers
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/suppliers.csv" AS row
CREATE (n:Supplier)
SET n = row,
    n.SupplierID = toInt(row.SupplierID)
