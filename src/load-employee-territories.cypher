// NORTHWIND - relate Employees to their Territory
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/employee-territories.csv" AS row
MATCH (e:Employee { EmployeeID: toInt(row.EmployeeID) })
WITH e, row
MATCH (t:Territory { TerritoryID: toInt(row.TerritoryID) })
WITH e,t
CREATE (e)-[:REPRESENTS]->(t)
