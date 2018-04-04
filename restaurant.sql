--Creates the Table

CREATE TABLE restaurant (
  id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR,
  distance INTEGER,
  stars INTEGER,
  category VARCHAR,
  favorite_dish VARCHAR,
  takeout BOOLEAN
);


-- Inserts the Values

INSERT INTO restaurant VALUES (
  DEFAULT, 'chipotle', 4, 4, 'mexican', 'burrito', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'panda express', 3, 3, 'chinese', 'orange chicken', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'carrabbas', 6, 5, 'italian', 'chicken bryan', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'uchi', 5, 5, 'japanese', 'negi toro maki', FALSE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'pappasito''s', 6, 4, 'mexican', 'beef fajitas', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'pronto', 8, 4, 'italian', 'pasta julia', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'oishii', 7, 4, 'japanese', 'spider roll', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'pappa''s bbq', 3, 4, 'bbq', 'brisket', TRUE
);

INSERT INTO restaurant VALUES (
  DEFAULT, 'kim son', 2, 3, 'vietnamese', 'egg rolls', TRUE
);


--Queries

-- The names of the restaurants that you gave a 5 stars to
SELECT name FROM restaurant WHERE stars = 5;


-- The favorite dishes of all 5-star restaurants
SELECT name, favorite_dish FROM restaurant WHERE stars = 5;

-- The the id of a restaurant by a specific restaurant name, say 'Moon Tower'
SELECT id FROM restaurant WHERE name = 'carrabbas';

-- restaurants in the category of 'BBQ'
SELECT * FROM restaurant WHERE category = 'bbq';

-- restaurants that do take out
SELECT * FROM restaurant WHERE takeout = FALSE;

-- restaurants that do take out and is in the category of 'BBQ'
SELECT * FROM restaurant WHERE takeout = TRUE AND category = 'bbq';

-- restaurants within 2 miles
SELECT * FROM restaurant WHERE distance <= 2;

-- restaurants you haven't ate at in the last week

-- forgot to add the column...
ALTER TABLE restaurant ADD COLUMN last_eaten_in_weeks INTEGER;

-- Adding the data to the new column
UPDATE restaurant set last_eaten_in_weeks = 1 WHERE id = 1;
UPDATE restaurant set last_eaten_in_weeks = 4 WHERE id = 2;
UPDATE restaurant set last_eaten_in_weeks = 12 WHERE id = 3;
UPDATE restaurant set last_eaten_in_weeks = 9 WHERE id = 4;
UPDATE restaurant set last_eaten_in_weeks = 20 WHERE id = 5;
UPDATE restaurant set last_eaten_in_weeks = 13 WHERE id = 6;
UPDATE restaurant set last_eaten_in_weeks = 16 WHERE id = 7;
UPDATE restaurant set last_eaten_in_weeks = 6 WHERE id = 8;
UPDATE restaurant set last_eaten_in_weeks = 1 WHERE id = 9;

SELECT * FROM restaurant WHERE last_eaten_in_weeks > 1;


-- restaurants you haven't ate at in the last week and has 5 stars
SELECT * FROM restaurant WHERE last_eaten_in_weeks > 1 AND stars = 5;


--AGGREGATION AND SORTING QUERIES

--list restaurants by the closest distance.
SELECT * FROM restaurant GROUP BY distance;

--list the top 2 restaurants by distance.
SELECT * FROM restaurant ORDER BY distance LIMIT 2;

-- list the top 2 restaurants by stars.
SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;

-- list the top 2 restaurants by stars where the distance is less than 2 miles. 
-- did <= instead of < becuase I didn't have any restaurants less than 2 miles in my DB.
SELECT * FROM restaurant WHERE distance <= 2 ORDER BY stars DESC LIMIT 2;

-- count the number of restaurants in the db.
SELECT COUNT(*) FROM restaurant;

-- count the number of restaurants by category.
SELECT category, COUNT(*) FROM restaurant GROUP BY category;

-- get the average stars per restaurant by category.
SELECT category, AVG(stars) FROM restaurant GROUP BY category;

-- get the max stars of a restaurant by category.
SELECT category, MAX(stars) FROM restaurant GROUP BY category;
