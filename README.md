# Northwinded - Mocked Northwind Data


| File                     | Description              | Medium | Large  | Generator                        |
| -------------------------|--------------------------|--------|--------|----------------------------------|
| categories.csv           | product categories       | 80     |  800   | http://www.mockaroo.com/d0d02120 |
| customers.csv            | people who buy products  | 910    | 9100   | http://www.mockaroo.com/9a6c4590 |
| employees.csv            | people who sell products | 100    | 1000   | http://www.mockaroo.com/c92d4f60 |
| products.csv             | products to be sold      | 770    | 7700   | http://www.mockaroo.com/a6023820 |
| orders.csv               | orders for products      | 8300   | 83000  | http://www.mockaroo.com/247a94a0 |
| order-details.csv        | itemized product details | 21550  | 215500 | http://www.mockaroo.com/abf09420 |
| territories.csv          | sales territories        | 520    | 5200   | http://www.mockaroo.com/7e16adc0 |
| regions.csv              | sales regions            | 4      | 4      | _1_                              |
| employee-territories.csv | where employees sell     | 480    | 4800   | http://www.mockaroo.com/ee7baaf0 |
| shippers.csv             | shipping companies       | 3      | 3      | _1_                              |
| suppliers.csv            | product suppliers        | 290    | 2900   | http://www.mockaroo.com/d78dbdd0 |


1. regions * shippers are the same as in the original Northwind


### Generator Notes

Adjust ID ranges based on sizes, before generating.

- (Northwind Employees)[http://www.mockaroo.com/c92d4f60]
  - `ReportsTo` is a range of `employees.EmployeeID`
- (Northwind Employee Territories)[http://www.mockaroo.com/ee7baaf0]
  - `EmployeeID` is a range of `employees.EmployeeID`
  - `TerritoryID` is a range of `territoriesTerritoryID`
- (Northwind Order Detail)[http://www.mockaroo.com/abf09420]
  - `OrderID` is a range of `orders.OrderID`
  - `ProductID` is a range of `products.ProductID`
- (Northwind Orders)[http://www.mockaroo.com/247a94a0]
  - `CustomerID` is a range of `customers.CustomerID`
  - `EmployeeID` is a range of `employees.EmployeeID`
  - `ShipVia` is a range of `shippers.ShipperID`
- (Northwind Products)[http://www.mockaroo.com/a6023820]
  - `SupplierID` is a range of `suppliers.SupplierID`
  - `CategoryID` is a range of `categories.CategoryID`



Mockaroo is limited to 5000 records, so use an awk script to bump numbers when needed
- download the first chunk
  `curl "http://www.mockaroo.com/abf09420/download?count=5000&key=477ba4c0" > orders1.csv`
- download the second chunk
  `curl "http://www.mockaroo.com/abf09420/download?count=5000&key=477ba4c0" > orders2.csv`
- trim the header off second chunk
  `tail -n +2 orders2.csv > orders2-trim.csv`
- bump the rowid in second chunk
  `awk -f offset.awk -v offset=5000 orders2-trim.csv > orders2.csv`
- join the chunks
  `cat orders*.csv > orders.csv`

Need to remove extra columns? Do this to keep the columns you want:

`cut -d "," -f 1-10 products.csv > products.csv-cut`

1. `categories.csv`
- product categories
- count: 80
2. `customers.csv`
- people who are customers
- => (:Person:Customer)
3. `employees.csv`
- people who are employees
- => (:Person:Employee)
4. `orders.csv`
- product orders
- => (:Order)
5. `products.csv`
- products sold by Northwind
- => (:Product)
6. `order-details.csv`
- extra detail about an order
- => (:OrderDetail)
7. `territories.csv`
- Sales territories
- => (:Territory)
8. `employee-territories.csv`
- join table of employees to their territories
- => (:Employee)-[:SELLS_IN]->(:Territory)
