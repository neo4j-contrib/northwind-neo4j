// NORTHWIND - relate territories with sales regions
MATCH (t:Territory),(r:Region)
WHERE r.RegionID = t.RegionID 
MERGE (t)-[:IS_IN]->(r)
