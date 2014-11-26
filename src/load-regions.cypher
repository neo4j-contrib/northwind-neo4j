// NORTHWIND - load regions
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/regions.csv" AS row
CREATE (c:Region)
SET c = row,
    c.RegionID = toInt(row.RegionID)
