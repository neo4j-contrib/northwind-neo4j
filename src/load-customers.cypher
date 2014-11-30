// NORTHWIND - load customers
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/customers.csv" AS row
CREATE (n:Customer)
SET n = row
