--Selecting the sum of amount in the payment
SELECT SUM(AMOUNT)
FROM PAYMENT

--Selecting everything from the film
SELECT *
FROM FILM

--Selcting the count of the film
SELECT COUNT(1)
FROM film

--Counting the distinct rental duration
SELECT COUNT(DISTINCT(RENTAL_DURATION))
FROM FILM

--
SELECT STDDEV(LENGTH)
FROM FILM

--
SELECT SUM(AMOUNT)
FROM PAYMENT

--
SELECT MIN(TITLE)
FROM FILM

--
SELECT MIN(RATING)
FROM FILM

--
SELECT MIN(RENTAL_DATE)
FROM RENTAL

--Selecting the minimum and maximum rental date as the first rental date and last rental date
SELECT MIN(RENTAL_DATE) AS FIRST_RENTAL_DATE,
	MAX(RENTAL_DATE) AS LAST_RENTAL_DATE
FROM RENTAL

--
SELECT MAX(RETURN_DATE) AS LAST_RETURN_DATE,
	MAX(RENTAL_DATE) AS LAST_RETURN_DATE
FROM RENTAL

--Ordering the rental dates in the descending order
SELECT *
FROM RENTAL
ORDER BY RENTAL_DATE DESC

--
SELECT CATEGORY_ID,
	COUNT(*) AS CATEGORY_COUNT
FROM FILM_CATEGORY
GROUP BY CATEGORY_ID;

--
SELECT CATEGORY_ID,
	COUNT(*) AS CATEGORY_COUNT
FROM FILM_CATEGORY
GROUP BY CATEGORY_ID
ORDER BY CATEGORY_ID;

--
SELECT CATEGORY_ID,
	COUNT(*) AS CATEGORY_COUNT
FROM FILM_CATEGORY
GROUP BY CATEGORY_ID
--ORDER BY CATEGORY_ID,
ORDER BY CATEGORY_COUNT;

--
SELECT CATEGORY_ID,
	COUNT(CATEGORY_ID) AS CATEGORY_COUNT
FROM FILM_CATEGORY
GROUP BY CATEGORY_ID
ORDER BY CATEGORY_ID;

--
SELECT C.CATEGORY_ID,
	C.NAME AS CATEGORY_NAME,
	COUNT(*) AS FILM_COUNT
FROM CATEGORY C
JOIN FILM_CATEGORY FC ON C.CATEGORY_ID = FC.CATEGORY_ID
GROUP BY C.CATEGORY_ID,
	FC.CATEGORY_ID
ORDER BY FILM_COUNT DESC;

--

SELECT CU.CUSTOMER_ID,
	CU.FIRST_NAME,
	CU.LAST_NAME,
	COUNTRY.COUNTRY AS COUNTRY
FROM CUSTOMER CU
FULL JOIN ADDRESS ON ADDRESS.ADDRESS_ID = CU.ADDRESS_ID
FULL JOIN CITY ON ADDRESS.CITY_ID = CITY.CITY_ID
FULL JOIN COUNTRY ON COUNTRY.COUNTRY_ID = CITY.COUNTRY_ID;
--
select * from customer

