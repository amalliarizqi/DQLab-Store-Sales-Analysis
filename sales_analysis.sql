
-- Project Data Analysis for Retail: Sales Performance Report

/*
DQLab Store Overall Performance

Melakukan analisis terhadap overall performance dari DQLab Store
berdasarkan tahun dan product sub category.
*/

-- a. Overall Performance by Year

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


-- b. Overall Performance by Product Sub Category

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


/*
DQLab Store Promotion Effectiveness and Efficiency

Melakukan analisis keterkaitan antara sales dengan promosi
yang sudah dilakukan oleh DQLab Store sebelumnya.
*/

-- a. Promotion Effectiveness and Efficiency by Years

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
ORDER BY years ASC;


-- b. Promotion Effectiveness and Efficiency by Product Sub Category

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


/*
Customer Analytics

Mengetahui pertumbuhan dari sisi customer.
*/

-- Customers Transactions per Year

SELECT
    YEAR(order_date) AS years,
    COUNT(DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE
    order_status = 'Order Finished'
GROUP BY YEAR(order_date)
ORDER BY years ASC;