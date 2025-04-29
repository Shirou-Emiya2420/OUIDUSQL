/* Définir clef primair, étranger */

/* 1 */
SELECT recipe_name, preparation_time, category_name 
FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category
ORDER BY preparation_time DESC;

/* 2 */
SELECT recipe_name, preparation_time, category_name, COUNT(ingredient_name) 
FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category
INNER JOIN recipe_ingredients ON recipe.id_recipe = recipe_ingredients.id_recipe
INNER JOIN ingredient ON recipe_ingredients.id_ingredient =  ingredient.id_ingredient
GROUP BY recipe.id_recipe
ORDER BY preparation_time DESC;

/* 3 */
SELECT recipe_name
FROM recipe
WHERE preparation_time >= 30;

/* 4 */
SELECT recipe_name
FROM recipe
WHERE recipe_name LIKE '%Salade%';

/* 5 */
INSERT INTO recipe (recipe_name, preparation_time, instructions, id_category)
VALUES ("Pâtes à la carbonara", 20, "PENSER A CUIR LES PÂTES SINON PAS BON", 2);

SELECT recipe_name, preparation_time, instructions, id_category FROM recipe
WHERE recipe_name = "Pâtes à la carbonara";

/* 6 */
UPDATE recipe
SET recipe_name = "LA BONNE GROSSE LOOSER Q"
WHERE id_recipe = 3;

SELECT recipe_name, preparation_time, instructions, id_category FROM recipe
WHERE id_recipe = 3;

/* 7 */
DELETE FROM recipe
WHERE id_recipe = 2;

/* 8 */
SELECT SUM(price) AS prixtt
FROM recipe r
INNER JOIN category c ON r.id_category = c.id_category
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient ON recipe_ingredients.id_ingredient =  ingredient.id_ingredient
WHERE recipe.id_recipe = 5;

SELECT ingredient_name, price FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category
INNER JOIN recipe_ingredients ON recipe.id_recipe = recipe_ingredients.id_recipe
INNER JOIN ingredient ON recipe_ingredients.id_ingredient =  ingredient.id_ingredient
WHERE recipe.id_recipe = 5;

/* 9 */
SELECT ingredient_name, quantity, price
FROM recipe
INNER JOIN recipe_ingredients ON recipe.id_recipe = recipe_ingredients.id_recipe
INNER JOIN ingredient ON recipe_ingredients.id_ingredient = ingredient.id_ingredient
WHERE recipe.id_recipe = 5;

/* 10 */

INSERT INTO ingredient(ingredient_name, unity, price)
VALUES ("Poivre", "cuillère à café", 2.5);

SELECT * FROM ingredient WHERE ingredient_name = "Poivre";

/* 11 */

UPDATE ingredient
SET price = 1
WHERE id_ingredient = 12;

SELECT * FROM ingredient WHERE id_ingredient = 12;

/* 12 */

SELECT category_name cn, COUNT(recipe_name) AS ttr
FROM category c
INNER JOIN recipe r ON c.id_category = r.id_category
GROUP BY category_name;

/* 13 */

SELECT recipe_name rn
FROM recipe r
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE ingredient_name = "Poulet"; 

/* 14 */

UPDATE recipe
Set preparation_time = preparation_time - 5;

SELECT recipe_name, preparation_time
FROM recipe;

/* 15 */
SELECT DISTINCT recipe_name rn
FROM recipe r
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE i.price <= 2;

/* 16 */
SELECT recipe_name, preparation_time
FROM recipe
ORDER BY preparation_time ASC
LIMIT 10;

SELECT recipe_name, preparation_time
FROM recipe;

/* 17 */
SELECT DISTINCT recipe_name rn
FROM recipe r
LEFT JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
WHERE ri.id_ingredient IS NULL;

SELECT recipe_name rn, ingredient_name 
FROM recipe r
LEFT JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
LEFT JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE recipe_name = "Pâtes à la carbonara";

/* 18 */
SELECT i.ingredient_name
FROM ingredient i
INNER JOIN recipe_ingredients ri ON i.id_ingredient = ri.id_ingredient
GROUP BY i.id_ingredient
HAVING COUNT(DISTINCT ri.id_recipe) >= 3;

/* 19 */

INSERT INTO ingredient(ingredient_name, unity, price)
VALUE ("rage", "HectoLitre", 3);
INSERT INTO recipe_ingredients(id_recipe, id_ingredient, quantity)
VALUE (3, LAST_INSERT_ID(), 4);

SELECT recipe_name rn, ingredient_name ia
FROM recipe r
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE r.id_recipe = 3;

/* 20 */
SELECT r.recipe_name, SUM(price) AS prixtt
FROM recipe r
INNER JOIN category c ON r.id_category = c.id_category
INNER JOIN recipe_ingredients ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY r.id_recipe
HAVING prixtt = (
    SELECT MAX(total_price)
    FROM (
        SELECT SUM(i2.price) AS total_price
        FROM recipe r2
        INNER JOIN recipe_ingredients ri2 ON r2.id_recipe = ri2.id_recipe
        INNER JOIN ingredient i2 ON ri2.id_ingredient = i2.id_ingredient
        GROUP BY r2.id_recipe
    ) AS prices
);

SELECT recipe_name, SUM(i2.price) AS total_price
FROM recipe r2
INNER JOIN recipe_ingredients ri2 ON r2.id_recipe = ri2.id_recipe
INNER JOIN ingredient i2 ON ri2.id_ingredient = i2.id_ingredient
GROUP BY r2.id_recipe
ORDER BY total_price DESC;
