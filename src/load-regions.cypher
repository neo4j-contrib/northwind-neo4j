// NORTHWIND - load regions
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/regions.csv" AS row
CREATE (n:Region)
SET n = row,
    n.RegionID = toInt(row.RegionID)
