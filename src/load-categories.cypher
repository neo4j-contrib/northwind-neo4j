// NORTHWIND - load categories
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/northwind/data/categories.csv" AS row
CREATE (n:Category)
SET n = row, n.CategoryID = toInt(row.CategoryID)
