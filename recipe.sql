CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    ingredient_name VARCHAR(100),
    unity VARCHAR(100),
    price DECIMAL(15,2)
);

CREATE TABLE category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);

CREATE TABLE recipe (
    id_recipe INT PRIMARY KEY AUTO_INCREMENT,
    recipe_name VARCHAR(200),
    preparation_time INT, 
    instructions TEXT,
    id_category INT,
    FOREIGN KEY (id_category) REFERENCES category(id_category)
);

CREATE TABLE recipe_ingredients (
    id_recipe INT,
    id_ingredient INT,
    quantity DECIMAL(15,2),
    FOREIGN KEY (id_recipe) REFERENCES recipe(id_recipe),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);