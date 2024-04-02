-- 1 : Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées de façon décroissante sur la durée de réalisation

-- SELECT category_name, recipe_name, preparation_time
-- FROM recipe
-- INNER JOIN category ON recipe.id_category = category.id_category




-- 2 : En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

-- SELECT category_name, recipe_name, preparation_time, COUNT(recipe_ingredients.id_recipe) AS nbIngredients
-- FROM recipe
-- INNER JOIN category ON recipe.id_category = category.id_category
-- INNER JOIN recipe_ingredients ON recipe.id_recipe = recipe_ingredients.id_recipe
-- GROUP BY recipe.id_recipe
-- ORDER BY nbIngredients DESC




-- 3 :  Afficher les recettes qui nécessitent au moins 30 min de préparation

-- SELECT recipe_name, preparation_time
-- FROM recipe
-- WHERE preparation_time = '30'




-- 4 :  Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en question)

-- SELECT *
-- FROM recipe
-- WHERE recipe_name LIKE '%Salade%'




-- 5 :  Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de pouvoir lister les détails de cette recettes (ingrédients)

-- INSERT INTO recipe (recipe_name, preparation_time, instructions, id_category)
-- VALUES ('Pâtes à la bolognaise', '20', 'Instructions de mon choix', 2)




-- 6 :  Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre convenance)

-- UPDATE recipe
-- SET recipe_name = "Taboulé à l'oriental"
-- WHERE id_recipe = 3




-- 7 :  Supprimer la recette n°3 de la base de données

-- DELETE FROM `recipe_ingredients`
-- WHERE `id_recipe` = 3;
-- DELETE FROM `recipe`
-- WHERE `id_recipe` = 3;





-- 8 :  Afficher le prix total de la recette n°5

-- SELECT id_recipe, SUM(quantity * price) AS Total
-- FROM recipe_ingredients
-- INNER JOIN ingredient ON recipe_ingredients.id_ingredient = ingredient.id_ingredient
-- WHERE id_recipe = 5





-- 9 : Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)

-- SELECT r.recipe_name, ingredient_name, quantity, price
-- FROM recipe_ingredients ri
-- INNER JOIN recipe r ON ri.id_recipe = r.id_recipe
-- INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
-- WHERE r.id_recipe = 5





-- 10 : Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 € (J'avais déjà le poivre)

-- INSERT INTO ingredient (ingredient_name, unity, price)
-- VALUES ('Echalottes', 'Unité', 0.5)





-- 11 :  Modifier le prix de l’ingrédient n°12 (prix à votre convenance)

-- UPDATE ingredient
-- SET price = '0.75'
-- WHERE id_ingredient = 12





-- 12 :  Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

-- SELECT category_name, COUNT(recipe_name) AS NbRecipe
-- FROM category
-- INNER JOIN recipe ON category.id_category = recipe.id_category
-- GROUP BY category_name





-- 13 : Afficher les recettes qui contiennent l’ingrédient « Poulet » (J'ai changé 'poulet' en 'sel')

-- SELECT id_recipe, recipe_ingredients.id_ingredient, ingredient_name
-- FROM recipe_ingredients
-- INNER JOIN ingredient ON recipe_ingredients.id_ingredient = ingredient.id_ingredient
-- WHERE ingredient_name LIKE '%Sel%'





-- 14 : Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes

-- UPDATE recipe
-- SET preparation_time = preparation_time - 5





-- 15 : Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure

-- SELECT r.id_recipe, recipe_name, i.id_ingredient, price
-- FROM recipe_ingredients ri 
-- INNER JOIN recipe r ON ri.id_recipe = r.id_recipe
-- INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
-- WHERE price <= 2





-- 16 : Afficher la / les recette(s) les plus rapides à prépare

-- SELECT recipe_name, preparation_time
-- FROM recipe
-- WHERE preparation_time = (SELECT MIN(preparation_time) FROM recipe);





-- 17 : Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau chaude qui consiste à verser de l’eau chaude dans une tasse

-- SELECT recipe.id_recipe, recipe_name, id_ingredient
-- FROM recipe
-- LEFT JOIN recipe_ingredients ri ON recipe.id_recipe = ri.id_recipe
-- WHERE id_ingredient IS NULL




-- 18 : Trouver les ingrédients qui sont utilisés dans au moins 3 recettes

-- SELECT ri.id_ingredient, i.ingredient_name
-- FROM recipe_ingredients ri
-- INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
-- GROUP BY ri.id_ingredient, i.id_ingredient
-- HAVING COUNT(DISTINCT ri.id_recipe) >= 3;




-- 19 : Ajouter un nouvel ingrédient à une recette spécifique

-- INSERT INTO recipe_ingredients (quantity, id_ingredient, id_recipe)
-- VALUES ('1','65', '13')




-- 20 Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est donc exclu d’utiliser la clause LIMIT)
-- SELECT recipe_ingredients.id_recipe, recipe_name, SUM(quantity * price) AS Total
-- FROM recipe_ingredients
-- INNER JOIN ingredient ON recipe_ingredients.id_ingredient = ingredient.id_ingredient
-- INNER JOIN recipe ON recipe_ingredients.id_recipe = recipe.id_recipe
-- GROUP BY id_recipe
-- !!! Je ne trouve pas le moyen de filtrer pour n'afficher que la valeur la plus haute !!!