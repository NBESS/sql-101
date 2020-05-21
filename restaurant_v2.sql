CREATE TABLE restaurant (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    address VARCHAR,
    category VARCHAR
);

CREATE TABLE reviewer (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR,
    karma NUMERIC DEFAULT 0 CHECK (karma >=0 AND karma <= 7)
);

CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    reviewer_id INTEGER REFERENCES reviewer (id),
    stars INTEGER NOT NULL CHECK (stars >= 1 AND stars <= 5),
    title VARCHAR,
    review VARCHAR,
    restaurant_id INTEGER REFERENCES restaurant (id)
);

-- List all the reviews for a given restaurant given a specific restaurant ID.
SELECT review FROM review 
WHERE restaurant_id = 2;


-- List all the reviews for a given restaurant, given a SELECT review FROM review
SELECT review FROM review
INNER JOIN restaurant ON reviewer_id = restaurant_id
WHERE restaurant.name LIKE '%Burnt%';


-- List all the reviews for a given reviewer, given a specific author name.
SELECT review FROM review
INNER JOIN reviewer ON review.reviewer_id = reviewer.id
WHERE reviewer.name LIKE '%Greedy%';


-- List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.

SELECT restaurant.name, review FROM review
INNER JOIN restaurant ON review.restaurant_id = restaurant.id
ORDER BY restaurant.name ASC;

-- Get the average stars by restaurant. The result should have the restaurant name and its average star rating.

-- working on the lower code at the moment
SELECT name, review.stars FROM restaurant
INNER JOIN review ON restaurant.id = review.restaurant_id
WHERE review.stars = (SELECT AVG(stars) FROM review);




-- Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.



-- List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.



-- Get the average stars given by each reviewer. (reviewer name, average star rating)



-- Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)



-- Get the number of restaurants in each category. (category name, restaurant count)



-- Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)



-- Get the average star rating for a food category. (category name, average star rating)