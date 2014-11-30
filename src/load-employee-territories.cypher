// NORTHWIND - load Employee to Territory map
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/employee-territories.csv" AS row
CREATE (n:EmployeeToTerritory)
SET n.EmployeeID = row.EmployeeID,
    n.TerritoryID = row.TerritoryID
