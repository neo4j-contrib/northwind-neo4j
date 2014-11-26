// NORTHWIND - load customers
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/customers.csv" AS row
CREATE (c:Customer:Person)
SET c = row
