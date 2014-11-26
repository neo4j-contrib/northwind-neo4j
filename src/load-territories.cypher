// NORTHWIND - load territories
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/territories.csv" AS row
CREATE (n:Territory)
SET n = row,
    n.TerritoryID = toInt(row.TerritoryID),
    n.RegionID = toInt(row.RegionID)
