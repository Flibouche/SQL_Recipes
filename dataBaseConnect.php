<?php
try {
    // On se connecte à MySQL
    $mysqlClient = new PDO('mysql:host=localhost;dbname=kevin_recipessql;charset=utf8', 'root', '');
} catch (Exception $e) {
    // En cas d'erreur, on affiche un message et on arrête tout
    die('Erreur : ' . $e->getMessage());
}
// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table recipes
$sqlQuery = 'SELECT * FROM recipe';
$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
$recipes = $recipesStatement->fetchAll();

// On affiche chaque recette une à une
foreach ($recipes as $recipe) {
?>
    <p><?php echo "Recette numéro : ".$recipe['id_recipe']; ?></p>
    <p><?php echo $recipe['recipe_name']; ?></p>
    <p><?php echo $recipe['instructions']; ?></p>
    <p><?php echo "Catégorie : ".$recipe['id_category']; ?></p>
<?php
}
?>