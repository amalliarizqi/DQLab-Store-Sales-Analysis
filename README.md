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
**Preview Data**
Query berikut digunakan untuk melihat 10 data prtama dari dqlab_sales_store

```sql
SELECT *
FROM dqlab_sales_store
LIMIT 10 ;
```

**Query Result**
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
### A. DQLab Store Overall Performance
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

#### 2. Overall Performance by Product Sub Category
Query ini digunakan untuk membandingkan total penjualan setiap subkategori produk pada tahun 2011 dan 2012.

``` sql
SELECT
    YEAR(order_date) AS years,
    product_sub_category,
    SUM(sales) AS sales
FROM dqlab_sales_store
WHERE
    order_status = 'Order Finished'
    AND YEAR(order_date) BETWEEN 2011 AND 2012
GROUP BY
    YEAR(order_date),
    product_sub_category
ORDER BY
    years ASC,
    sales DESC;
```

**Query Result**
| Tahun | Subkategori Produk | Total Penjualan |
|---:|---|---:|
| 2011 | Chairs & Chairmats | 622962720 |
| 2011 | Office Machines | 545856280 |
| 2011 | Tables | 505875008 |
| 2011 | Copiers and Fax | 404074080 |
| 2011 | Telephones and Communication | 392194658 |
| 2011 | Binders and Binder Accessories | 298023200 |
| 2011 | Storage & Organization | 285991820 |
| 2011 | Appliances | 272630020 |
| 2011 | Computer Peripherals | 232677960 |
| 2011 | Bookcases | 169304620 |
| 2011 | Office Furnishings | 160471500 |
| 2011 | Paper | 111080380 |
| 2011 | Pens & Art Supplies | 43093800 |
| 2011 | Envelopes | 36463900 |
| 2011 | Labels | 15607780 |
| 2011 | Scissors, Rulers and Trimmers | 12638340 |
| 2011 | Rubber Bands | 3090120 |
| 2012 | Office Machines | 811427140 |
| 2012 | Chairs & Chairmats | 654168740 |
| 2012 | Telephones and Communication | 422287514 |
| 2012 | Tables | 388993784 |
| 2012 | Binders and Binder Accessories | 363879200 |
| 2012 | Storage & Organization | 356714140 |
| 2012 | Computer Peripherals | 308014340 |
| 2012 | Copiers and Fax | 292489800 |
| 2012 | Appliances | 266131100 |
| 2012 | Office Furnishings | 178927480 |
| 2012 | Bookcases | 159984680 |
| 2012 | Paper | 126896160 |
| 2012 | Envelopes | 58629280 |
| 2012 | Pens & Art Supplies | 43818480 |
| 2012 | Scissors, Rulers and Trimmers | 36776400 |
| 2012 | Labels | 10007040 |
| 2012 | Rubber Bands | 3837880 |

**Insight:**
- Pada tahun 2011, subkategori Chairs & Chairmats memiliki total penjualan tertinggi, yaitu 622.962.720.
- Pada tahun 2012, Office Machines menjadi subkategori dengan total penjualan tertinggi, yaitu 811.427.140.
- Total penjualan Office Machines meningkat dari 545.856.280 pada 2011 menjadi 811.427.140 pada 2012.
- Rubber Bands menjadi subkategori dengan total penjualan terendah pada kedua tahun tersebut.

### B. DQLab Store Promotion Effectiveness and Efficiency
Melakukan analisis keterkaitan antara sales dengan promosi
yang sudah dilakukan oleh DQLab Store sebelumnya.

#### 1. Promotion Effectiveness and Efficiency by Years
Efektifitas dan efisiensi dari promosi yang dilakukan akan dianalisa berdasarkan _Burn Rate_ yaitu dengan membandigkan total value promosi yang dikeluarkan terhadap total sales yang diperoleh. DQLab berharap bahwa _burn rate_ tetap berada diangka maskimum 4.5%.

``` sql
SELECT
    YEAR(order_date) AS years,
    SUM(sales) AS sales,
    SUM(discount_value) AS promotion_value,
    ROUND(
        (SUM(discount_value) / SUM(sales)) * 100,
        2
    ) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE
    order_status = 'Order Finished'
GROUP BY YEAR(order_date)
ORDER BY years ASC
```

**Query Result**
| Tahun | Total Penjualan | Nilai Promosi | Burn Rate (%) |
|---:|---:|---:|---:|
| 2009 | 4613872681 | 214330327 | 4.65 |
| 2010 | 4059100607 | 197506939 | 4.87 |
| 2011 | 4112036186 | 214611556 | 5.22 |
| 2012 | 4482983158 | 225867642 | 5.04 |

**Insight**
- Burn rate terendah terjadi pada tahun 2009, yaitu sebesar 4,65%, sedangkan yang tertinggi terjadi pada tahun 2011 sebesar 5,22%.
- Seluruh tahun memiliki burn rate di atas target maksimum 4,5%.
- Pada tahun 2012, total penjualan dan nilai promosi mencapai nilai tertinggi selama periode analisis, dengan burn rate sebesar 5,04%.

#### 2. Promotion Effectiveness and Efficiency by Product Sub Category
``` sql
SELECT
    YEAR(order_date) AS years,
    product_sub_category,
    product_category,
    SUM(sales) AS sales,
    SUM(discount_value) AS promotion_value,
    ROUND(
        (SUM(discount_value) / SUM(sales)) * 100,
        2
    ) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE
    YEAR(order_date) = 2012
    AND order_status = 'Order Finished'
GROUP BY
    YEAR(order_date),
    product_sub_category,
    product_category
ORDER BY sales DESC;
```

**Query Result**
| Tahun | Subkategori Produk | Kategori Produk | Total Penjualan | Nilai Promosi | Burn Rate (%) |
|---:|---|---|---:|---:|---:|
| 2012 | Office Machines | Technology | 811427140 | 46616695 | 5.75 |
| 2012 | Chairs & Chairmats | Furniture | 654168740 | 26623882 | 4.07 |
| 2012 | Telephones and Communication | Technology | 422287514 | 18800188 | 4.45 |
| 2012 | Tables | Furniture | 388993784 | 16348689 | 4.2 |
| 2012 | Binders and Binder Accessories | Office Supplies | 363879200 | 22338980 | 6.14 |
| 2012 | Storage & Organization | Office Supplies | 356714140 | 18802166 | 5.27 |
| 2012 | Computer Peripherals | Technology | 308014340 | 15333293 | 4.98 |
| 2012 | Copiers and Fax | Technology | 292489800 | 14530870 | 4.97 |
| 2012 | Appliances | Office Supplies | 266131100 | 14393300 | 5.41 |
| 2012 | Office Furnishings | Furniture | 178927480 | 8233849 | 4.6 |
| 2012 | Bookcases | Furniture | 159984680 | 10024365 | 6.27 |
| 2012 | Paper | Office Supplies | 126896160 | 6224694 | 4.91 |
| 2012 | Envelopes | Office Supplies | 58629280 | 2334321 | 3.98 |
| 2012 | Pens & Art Supplies | Office Supplies | 43818480 | 2343501 | 5.35 |
| 2012 | Scissors, Rulers and Trimmers | Office Supplies | 36776400 | 2349280 | 6.39 |
| 2012 | Labels | Office Supplies | 10007040 | 452245 | 4.52 |
| 2012 | Rubber Bands | Office Supplies | 3837880 | 117324 | 3.06 |


**Insight:**
- Office Machines memiliki total penjualan tertinggi pada tahun 2012, yaitu sebesar 811.427.140, dengan burn rate sebesar 5,75%.
- Scissors, Rulers and Trimmers memiliki burn rate tertinggi, yaitu 6,39%, meskipun total penjualannya relatif rendah dibandingkan subkategori lainnya.
- Rubber Bands memiliki burn rate terendah, yaitu 3,06%, diikuti oleh Envelopes sebesar 3,98%.
- Dari 17 subkategori produk, hanya 5 subkategori yang memiliki burn rate di bawah target maksimum 4,5%, yaitu Chairs & Chairmats, Telephones and Communication, Tables, Envelopes, dan Rubber Bands.

### C. Customer Analytics
Mengetahui pertumbuhan dari sisi customer.

#### Customers Transactions per Year
``` sql
SELECT
    YEAR(order_date) AS years,
    COUNT(DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE
    order_status = 'Order Finished'
GROUP BY YEAR(order_date)
ORDER BY years ASC;
```

**Query Result**
| Tahun | Jumlah Pelanggan |
|---:|---:|
| 2009 | 585 |
| 2010 | 593 |
| 2011 | 581 |
| 2012 | 594 |


**Insight:**
- Jumlah pelanggan terbanyak tercatat pada tahun 2012, yaitu sebanyak 594 pelanggan.
- Jumlah pelanggan paling sedikit tercatat pada tahun 2011, yaitu sebanyak 581 pelanggan.
- Jumlah pelanggan berfluktuasi selama periode 2009–2012, dengan peningkatan dari 581 pelanggan pada 2011 menjadi 594 pelanggan pada 2012.
