# Northwinded - Mocked Northwind Data


| File                     | Description              | Medium | Large | Generator                        |
| -------------------------|--------------------------|--------|-------|----------------------------------|
| categories.csv           | product categories       | 80     |       | http://www.mockaroo.com/d0d02120 |
| customers.csv            | people who buy products  | 910    |       | http://www.mockaroo.com/9a6c4590 |
| employees.csv            | people who sell products | 100    |       | http://www.mockaroo.com/c92d4f60 |
| products.csv             | products to be sold      | 770    |       | http://www.mockaroo.com/a6023820 |
| orders.csv               | orders for products      | 8300   |       | http://www.mockaroo.com/247a94a0 |
| order-details.csv        | itemized product details | 21550  |       | http://www.mockaroo.com/247a94a0 |
| territories.csv          | sales territories        | 520    |       | http://www.mockaroo.com/247a94a0 |
| regions.csv              | sales regions            | 4      |       | _1_                              |
| employee-territories.csv | where employees sell     | 480    |       | http://www.mockaroo.com/ee7baaf0 |
| shippers.csv             | shipping companies       | 3      |       | _1_                              |
| suppliers.csv            | product suppliers        | 290    |       | http://www.mockaroo.com/d78dbdd0 |


1. regions * shippers are the same as in the original Northwind


### Generator Notes

Mockaroo is limited to 5000 records, so use an awk script to bump numbers when needed
- download the first chunk
  `curl "http://www.mockaroo.com/abf09420/download?count=5000&key=477ba4c0" > orders1.csv`
- download the second chunk
  `curl "http://www.mockaroo.com/abf09420/download?count=5000&key=477ba4c0" > orders2.csv`
- trim the header off second chunk
  `tail -n +2 orders2.csv > orders2-trim.csv`
- bump the rowid in second chunk
  `awk -f offset.awk -v offset=5000 orders2-trim.csv > orders2.csv`

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
