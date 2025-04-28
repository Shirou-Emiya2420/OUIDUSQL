-- Catégories
INSERT INTO category (category_name) VALUES
('Entrée'), ('Plat principal'), ('Dessert');

-- Ingrédients
INSERT INTO ingredient (ingredient_name, unity, price) VALUES
('Tomate', 'pièce', 0.50),
('Mozzarella', 'g', 0.02),
('Basilic', 'g', 0.05),
('Huile d\'olive', 'cl', 0.10),
('Pâtes', 'g', 0.01),
('Sauce tomate', 'g', 0.02),
('Viande hachée', 'g', 0.03),
('Oignon', 'pièce', 0.20),
('Ail', 'gousse', 0.15),
('Farine', 'g', 0.01),
('Sucre', 'g', 0.01),
('Pomme', 'pièce', 0.60),
('Beurre', 'g', 0.02),
('Lait', 'cl', 0.05),
('Chocolat noir', 'g', 0.04),
('Œuf', 'pièce', 0.30);

-- Recettes
INSERT INTO recipe (recipe_name, preparation_time, instructions, id_category) VALUES
('Salade Caprese', 10, 'Couper tomates et mozzarella, assaisonner d\'huile et basilic frais.', 1),
('Spaghetti Bolognaise', 40, 'Cuire pâtes, préparer sauce tomate avec viande, ail et oignon.', 2),
('Tarte aux pommes', 60, 'Préparer pâte avec farine et beurre, garnir de pommes et cuire.', 3),
('Crêpes au chocolat', 25, 'Préparer pâte à crêpes, cuire puis garnir de chocolat fondu.', 3),
('Gratin de pâtes', 50, 'Cuire pâtes, mélanger crème, fromage râpé, cuire au four.', 2);

-- Ingrédients des recettes
INSERT INTO recipe_ingredients (id_recipe, id_ingredient, quantity) VALUES
(1, 1, 2), (1, 2, 150), (1, 3, 10), (1, 4, 5),
(2, 5, 200), (2, 6, 150), (2, 7, 150), (2, 8, 1), (2, 9, 2),
(3, 10, 200), (3, 12, 3), (3, 13, 100), (3, 11, 50), (3, 16, 1),
(4, 10, 150), (4, 14, 30), (4, 15, 100), (4, 16, 2),
(5, 5, 250), (5, 13, 50), (5, 14, 15), (5, 16, 2);
