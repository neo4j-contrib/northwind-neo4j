// NORTHWIND - load shippers
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/shippers.csv" AS row
CREATE (c:Shipper)
SET c = row,
    c.ShipperID = toInt(row.ShipperID)
