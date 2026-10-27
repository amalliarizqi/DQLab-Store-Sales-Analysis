# Project Data Analysis for Retail: Sales Performance Report

## Dataset
Dataset yang digunakan berisi transaksi dari tahun 2009 sampai dengan tahun 2012 dengan jumlah raw data sebanyak 5500, termasuk di dalamnya order status yang terbagi menjadi order finished, order returned dan order cancelled.
Adapun dataset yang sudah diberikan dan akan digunakan pada project ini berisi data sebagai berikut.
1. OrderID
2. Order Status
3. Customer
4. Order Date
5. Order Quantity
6. Sales
7. Discount %
8. Discount
9. Product Category
10. Product Sub-Category

Nama tabel yang akan digunakan pada project ini adalah dqlab_sales_store.
### Preview Data
Query berikut digunakan untuk melihat 10 data prtama dari dqlab_sales_store

```sql
SELECT *
FROM dqlab_sales_store
LIMIT 10 ;
```
### Hasil Query
| order_id | order_status | customer | order_date | order_quantity | sales | discount | discount_value | product_category | product_sub_category |
|---:|---|---|---|---:|---:|---:|---:|---|---|
| 3 | Order Finished | Muhammed MacIntyre | 2010-10-13 | 6 | 523080 | 0.04 | 20923 | Office Supplies | Storage & Organization |
| 293 | Order Finished | Barry French | 2012-10-01 | 49 | 20246040 | 0.07 | 1417223 | Office Supplies | Appliances |
| 483 | Order Finished | Clay Rozendal | 2011-07-10 | 30 | 9931519 | 0.08 | 794522 | Technology | Telephones and Communication |
| 515 | Order Finished | Carlos Soltero | 2010-08-28 | 19 | 788540 | 0.08 | 63083 | Office Supplies | Appliances |
| 613 | Order Finished | Carl Jackson | 2011-06-17 | 12 | 187080 | 0.03 | 5612 | Office Supplies | Binders and Binder Accessories |
| 643 | Order Finished | Monica Federle | 2011-03-24 | 21 | 5563640 | 0.07 | 389455 | Office Supplies | Storage & Organization |
| 678 | Order Returned | Dorothy Badders | 2010-02-26 | 44 | 456820 | 0.07 | 31977 | Office Supplies | Paper |
| 807 | Order Finished | Neola Schneider | 2010-11-23 | 45 | 393700 | 0.01 | 3937 | Office Supplies | Paper |
| 868 | Order Finished | Carlos Daly | 2012-06-08 | 32 | 1433680 | 0 | 0 | Office Supplies | Appliances |
| 933 | Order Finished | Claudia Miner | 2012-08-04 | 15 | 161220 | 0.02 | 3224 | Office Supplies | Binders and Binder Accessories |

## SQL Analysis
Analisis dilakukan untuk memahami performa penjualan, efektivitas promosi, dan aktivitas pelanggan berdasarkan data transaksi DQLab Store.
### DQLab Store Overall Performance
Melakukan analisis terhadap overall performance dari DQLab Store
berdasarkan tahun dan product sub category.
#### 1. Overall Performance by Year
Query ini digunakan untuk menghitung total penjualan dan jumlah pesanan unik setiap tahun. Analisis hanya mencakup transaksi dengan status Order Finished.
```sql
SELECT
    YEAR(order_date) AS years,
    SUM(sales) AS sales,
    COUNT(DISTINCT order_id) AS number_of_order
FROM dqlab_sales_store
WHERE
    order_status = 'Order Finished'
    AND YEAR(order_date) BETWEEN 2009 AND 2012
GROUP BY YEAR(order_date)
ORDER BY years ASC;
```
**Query Result**
| years | sales | number_of_order |
|---:|---:|---:|
| 2009 | 4613872681 | 1244 |
| 2010 | 4059100607 | 1248 |
| 2011 | 4112036186 | 1178 |
| 2012 | 4482983158 | 1254 |

**Insight:**
- Total penjualan tertinggi terjadi pada tahun 2009, yaitu sebesar 4.613.872.681.
- Total penjualan terendah terjadi pada tahun 2010, yaitu sebesar 4.059.100.607.
- Total penjualan mengalami penurunan pada 2010, kemudian meningkat kembali pada 2011 dan 2012.
