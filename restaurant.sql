CREATE TABLE restaurant (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    distance NUMERIC,
    stars NUMERIC,
    category VARCHAR,
    fav_dish VARCHAR,
    takeout_avail boolean,
    visit_date TIMESTAMP
);

INSERT INTO restaurant VALUES (
    DEFAULT,
    'The Pig',
    6.0,
    2.3,
    'BBQ',
    'Pork Ribs',
    TRUE,
    '2019-07-04 10:00:00'
),
(
    DEFAULT,
    'China Wok',
    2.3,
    4.0,
    'Chinese',
    'Orange Chicken',
    FALSE,
    '2020-05-12 10:00:00'
),
(
    DEFAULT,
    'Gatas',
    5.0,
    4.5,
    'Bar',
    'Hot Wings',
    TRUE,
    '2020-03-04 10:00:00'
),
(
    DEFAULT,
    'Subway',
    2.3,
    1.5,
    'Subs',
    'Black Forest Ham',
    FALSE,
    '2019-12-04 10:00:00'
),
(
    DEFAULT,
    'Pizza Hut',
    8.0,
    4.6,
    'Pizza',
    'Pan Pizza',
    TRUE,
    '2020-02-20 10:00:00'
),
(
    DEFAULT,
    'Dominos Pizza',
    8.3,
    4.5,
    'Pizza',
    'Jalapeno Cheese Bread',
    TRUE,
    '2020-05-20 10:00:00'
);


-- Write Queries Below --

-- The names of the restaurants that you gave less than 3 stars to

SELECT name FROM restaurant 
WHERE stars < 3;


-- The favorite dishes of all 3-star(+) restaurants

SELECT fav_dish FROM restaurant
WHERE stars > 3;

-- The the id of a restaurant by a specific restaurant name, 'Subway'

SELECT id FROM restaurant 
WHERE name = 'Subway';

--  Restaurants in the category of 'BBQ'

SELECT name FROM restaurant
WHERE category = 'Pizza';

-- Restaurants that do take out

SELECT name FROM restaurant 
WHERE takeout_avail = TRUE;

-- Restaurants that do take out and are in the category of 'Pizza', and favorit dish is Pan Pizza

SELECT name FROM restaurant 
WHERE takeout_avail = TRUE AND fav_dish = 'Pan Pizza';

-- Restaurants within 3 miles

SELECT name FROM restaurant 
WHERE distance < 3;

-- Restaurants I haven't eaten at this year

SELECT name FROM restaurant
WHERE visit_date < '2020-01-01'; 

-- Restaurants I haven't eaten at this year and has more than 4 stars

SELECT name FROM restaurant
WHERE visit_date < '2020-01-01' AND stars >= 2; 

-- Aggregation and Sorting Queries --
-- ******************************* --

-- List restaurants by the closest distance.
SELECT * FROM restaurant
ORDER BY distance ASC;

-- List the closest restaurant
SELECT name AS closest_restaurant, distance FROM restaurant
WHERE distance = 
    (SELECT MIN(distance) 
    FROM restaurant);

-- List the top 2 restaurants by distance.
SELECT * FROM restaurant
ORDER BY distance DESC
LIMIT 2;

-- List the top 2 restaurants by stars.
SELECT * FROM restaurant
ORDER BY stars DESC
LIMIT 2;

-- List the top 2 restaurants by stars where the distance is less than 2 miles.

-- Count the number of restaurants in the db.

-- Count the number of restaurants by category.

-- Get the average stars per restaurant by category.

-- Get the max stars of a restaurant by category.