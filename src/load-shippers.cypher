// NORTHWIND - load shippers
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/shippers.csv" AS row
CREATE (n:Shipper)
SET n = row,
    n.ShipperID = toInt(row.ShipperID)
