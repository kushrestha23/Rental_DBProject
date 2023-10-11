'Selecting the customer id , firstname, lastname and email from the customer table'
SELECT CUSTOMER_ID,
	FIRST_NAME,
	LAST_NAME,
	EMAIL
FROM CUSTOMER

'Selecting the data from the film table whose rental rate is 0.99'
SELECT *
FROM FILM
WHERE RENTAL_RATE = 0.99

'Selecting the data from the film table whose rental table is less than 1.99'
SELECT *
FROM FILM
WHERE RENTAL_RATE > 1.99

'Selecting the data from the film table whose rental rate is not equal to 2.99'
SELECT *
FROM FILM
WHERE RENTAL_RATE <> 2.99

'Selecting the data from the film table whose rental rate 
is greater than 2.99 and the length of the movie is 100'
SELECT *
FROM FILM
WHERE RENTAL_RATE >= 2.99
	AND LENGTH > 100
	
'Selecting the data from the film table whose rental rate 
is greater than 2.99 and the length of the movie is 100'
SELECT *
FROM FILM
WHERE LENGTH < 130
	AND LENGTH > 100
	
'Selecting the data from the film table whose film length is between 100 and 130'
SELECT *
FROM FILM
WHERE LENGTH BETWEEN 100 AND 130

--Selecting the trailers in the descriptio from the film
SELECT *
FROM FILM
WHERE 'Trailers' IN
		(SELECT DESCRIPTION
			FROM FILM)
			
-- Get the distinct film titles from the "Action" category and the "Sci-Fi" category
SELECT TITLE
FROM FILM
WHERE FILM_ID IN
		(SELECT FILM_ID
			FROM FILM_CATEGORY
			WHERE CATEGORY_ID =
					(SELECT CATEGORY_ID
						FROM CATEGORY
						WHERE NAME = 'Action' ) )
						
--Selecting everything from the Film_category.
SELECT *
FROM FILM_CATEGORY

--Selecting everything from the category.
SELECT *
FROM CATEGORY

--
SELECT FILM_ID
FROM FILM_CATEGORY
WHERE CATEGORY_ID IN
		(SELECT CATEGORY_ID
			FROM CATEGORY
			WHERE NAME = 'action')
			
--
SELECT *
FROM FILM
WHERE FILM_ID IN
		(SELECT FILM_ID
			FROM FILM_CATEGORY) WHERE CATEGORY_ID IN
		(SELECT CATEGORY_ID
			FROM CATEGORY
			WHERE NAME = 'action') 
						
--
SELECT *
FROM ACTOR
WHERE LENGTH(FIRST_NAME) > ALL
		(SELECT LENGTH(FIRST_NAME)
			FROM ACTOR)
--
SELECT *
FROM ACTOR
WHERE LENGTH(LAST_NAME) > ALL
		(SELECT LENGTH(FIRST_NAME)
			FROM ACTOR)
--
SELECT *
FROM ACTOR
WHERE LENGTH(LAST_NAME) > ALL
		(SELECT LENGTH(LAST_NAME)
			FROM CUSTOMER)
--
SELECT *
FROM ACTOR
WHERE LENGTH(LAST_NAME) > ANY
		(SELECT LENGTH(LAST_NAME)
			FROM CUSTOMER)
--
SELECT *
FROM ACTOR
WHERE LENGTH(FIRST_NAME) > ANY
		(SELECT LENGTH(LAST_NAME)
			FROM ACTOR)
--
SELECT *
FROM FILM
WHERE (RENTAL_RATE > .99)
	OR (LENGTH > 100)
	OR (RENTAL_DURATION > 2)
--
SELECT *
FROM FILM
WHERE (RENTAL_RATE > .99)
	OR (LENGTH > 100)
	OR (RENTAL_DURATION > 3)
--
SELECT CUSTOMER_ID,
	FIRST_NAME,
	LAST_NAME
FROM CUSTOMER C
WHERE EXISTS
		(SELECT 1
			FROM RENTAL R
			WHERE R.CUSTOMER_ID = C.CUSTOMER_ID
				AND R.RETURN_DATE IS NULL );
-- 

Select * from rental

--
SELECT *
FROM FILM
WHERE DESCRIPTION like 'A%'
--
SELECT *
FROM FILM
WHERE DESCRIPTION ilike '%cat%'
--
SELECT *
FROM FILM
WHERE DESCRIPTION ilike '%cat%'
	AND DESCRIPTION ilike '%dog%'
--
SELECT *
FROM FILM
WHERE DESCRIPTION ilike '%cat%dog%'
--
SELECT P.AMOUNT,
       P.PAYMENT_ID,
       R.INVENTORY_ID,
       R.RETURN_DATE
FROM PAYMENT P
FULL JOIN RENTAL R ON P.RENTAL_ID = R.RENTAL_ID;

--
SELECT P.AMOUNT,
       P.PAYMENT_ID,
       R.INVENTORY_ID,
       R.RETURN_DATE
FROM PAYMENT P
FULL JOIN RENTAL R ON P.RENTAL_ID = R.RENTAL_ID;
--
SELECT F.TITLE,
       C.NAME,
       FC.CATEGORY_ID
FROM FILM F
INNER JOIN FILM_CATEGORY FC ON FC.FILM_ID = F.FILM_ID
INNER JOIN CATEGORY C ON FC.CATEGORY_ID = C.CATEGORY_ID;

