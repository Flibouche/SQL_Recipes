-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour kevin_recipessql
CREATE DATABASE IF NOT EXISTS `kevin_recipessql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kevin_recipessql`;

-- Listage de la structure de la table kevin_recipessql. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table kevin_recipessql.category : ~3 rows (environ)
INSERT INTO `category` (`id_category`, `category_name`) VALUES
	(1, 'entrée'),
	(2, 'plat'),
	(3, 'dessert');

-- Listage de la structure de la table kevin_recipessql. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) NOT NULL DEFAULT '0',
  `unity` varchar(100) NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table kevin_recipessql.ingredient : ~55 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `ingredient_name`, `unity`, `price`) VALUES
	(1, 'Boeuf', 'G', 10),
	(2, 'Oeuf', 'Unité', 0.5),
	(8, 'Poivre', 'Cuillière à café', 2.5),
	(9, 'Poulet', 'G', 5),
	(10, 'Guanciale', 'G', 7),
	(11, 'Pecorino', 'G', 3),
	(12, 'Lait', 'CL', 0.75),
	(13, 'Maïs', 'G', 0.5),
	(14, 'Sel', 'Cuillière à café', 0.5),
	(15, 'Carotte', 'G', 0.7),
	(16, 'Champignon de Paris', 'G', 1),
	(17, 'Laitue', 'G', 0.5),
	(18, 'Roquette', 'G', 0.5),
	(19, 'Mâche', 'G', 0.5),
	(20, 'Emmental', 'G', 1.5),
	(21, 'Sucre', 'Cuillière à café', 0.7),
	(22, 'Pomme de terre', 'G', 0.3),
	(23, 'Pomme', 'Unité', 0.5),
	(24, 'Farine de blé', 'G', 0.3),
	(25, 'Huile de tournesol', 'Cuillière à soupe', 0.5),
	(26, 'Huile d\'olive', 'Cuillière à soupe', 0.8),
	(27, 'Avocat', 'Unité', 1.3),
	(28, 'Tomate', 'Unité', 0.7),
	(29, 'Oignon', 'Unité', 1),
	(30, 'Citron vert', 'Unité', 1),
	(31, 'Mozzarella', 'Unité', 2),
	(32, 'Vinaigre balsamique', 'CL', 3),
	(33, 'Basilic', 'Unité', 2),
	(34, 'Spaghetti', 'G', 0.5),
	(35, 'Semoule', 'G', 0.5),
	(36, 'Menthe', 'Unité', 0.7),
	(37, 'Persil plat', 'Unité', 0.5),
	(38, 'Coriandre', 'Unité', 0.5),
	(39, 'Concombre', 'Unité', 0.3),
	(40, 'Citron jaune', 'Unité', 0.6),
	(41, 'Beurre', 'G', 1),
	(42, 'Lardon', 'G', 1),
	(43, 'Ail', 'Unité', 0.4),
	(44, 'Bouquet garni', 'Unité', 1),
	(45, 'Bouillon de boeuf', 'Unité', 0.1),
	(46, 'Vin rouge', 'CL', 3),
	(47, 'Vin blanc', 'CL', 3),
	(48, 'Comté', 'G', 2),
	(49, 'Beaufort', 'G', 2.5),
	(50, 'Moutarde', 'Cuillière à café', 0.3),
	(51, 'Kirsch', 'CL', 0.8),
	(52, 'Pain', 'G', 0.3),
	(53, 'Gousse de vanille', 'Unité', 1),
	(54, 'Cacao', 'G', 0.7),
	(55, 'Mascarpone', 'G', 1),
	(56, 'Biscuit cuillère', 'Unité', 0.3),
	(57, 'Café noir', 'CL', 0.3),
	(58, 'Pâte brisée', 'Unité', 1),
	(59, 'Echalottes', 'Unité', 0.5),
	(65, 'Sucre roux', 'Cuillière à café', 0.3);

-- Listage de la structure de la table kevin_recipessql. recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `id_recipe` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(200) NOT NULL,
  `preparation_time` int NOT NULL DEFAULT (0),
  `instructions` text,
  `id_category` int NOT NULL,
  PRIMARY KEY (`id_recipe`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `FK1_recipe_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table kevin_recipessql.recipe : ~9 rows (environ)
INSERT INTO `recipe` (`id_recipe`, `recipe_name`, `preparation_time`, `instructions`, `id_category`) VALUES
	(5, 'Pâtes à la carbonara', 15, 'Remplissez une grande casserole d\'eau. ( Il faut compter 1 litre d\'eau pour 100 grammes de pâtes ).\r\nPortez à ébullition et ajoutez du gros sel.\r\nPendant que vos pâtes cuisent, coupez la charcuterie en morceaux et faites la dorer dans une poêle à feu doux.\r\nDans un saladier, séparez les blancs des jaunes. Fouettez les jaunes et incorporez le pécorino. Ajoutez environ 2 louches de bouillon de cuisson comme sur la vidéo.\r\nUne fois les spaghettis cuits al dente, les déposer dans la poêle sans les égoutter avec la charcuterie\r\net ajouter la sauce carbonara. Bien mélanger.\r\nServez immédiatement et déguster.', 2),
	(6, 'Boeuf bourguignon', 15, 'Tailler le bœuf en cubes de 3 à 4 cm de côte. Peler les oignons sans les écorcher. Peler et couper les carottes en rondelles pas trop fines (2mm au minimum). Peler l\'ail et enlever le germe.\r\nDans une grande cocotte, faire fondre le beurre. Ajouter les oignons entiers et les lardons. Faire revenir en remuant constamment. Lorsqu\'ils sont dorés, les retirer avec un écumoire, et réserver.\r\nDans la même cocotte, faire revenir les morceaux de viande à feu vif. Ajouter les carottes, et faire revenir encore 5 mn.\r\nLorsque la viande est bien dorée, saupoudrer de farine (60g) et laisser roussir en remuant toujours\r\nVerser le bouillon (que vous aurez préparé en faisant fondre les 2 cubes de bouillon de viande dans 50 cl d\'eau bouillante). Bien gratter les sucs. Remettre les lardons et les oignons dans la cocotte. Verser le vin rouge. Saler, poivrer et ajouter le bouquet garni et les gousses d\'ail écrasées. Porter à ébullition. Couvrir et laisser mijoter doucement pendant 3 heures (petits bouillons).\r\nAu bout de ce temps, ajouter les champignons émincés, et mettre à cuire encore une demi-heure. Retirer le bouquet garni et verser dans un plat Servir avec des pâtes (tagliatelles par exemple), ou des pommes de terre vapeur (la sauce doit être liée, mais non épaisse. Sinon, rajouter un peu d\'eau).\r\n', 2),
	(7, 'Fondue savoyarde', 25, 'Avant de commencer il faut s\'organiser pour éviter de surchauffer sa fondue. 4 conseils au préalable:\r\n1/ couper les différents fromages en cubes puis réserver.\r\n2/ frotter le caquelon à fondue avec une gousse d\'ail épluchée et coupé en deux.\r\n3/ Utiliser votre gazinière pour faire fondre le fromage. Si vous avez un caquelon en fonte il est recommandé de faire chauffer votre préparation sur votre gazinière. Si votre caquelon est issu d\'un appareil électrique il est préférable de la préparer directement dans son caquelon posé sur son support électrique.\r\n4/ N\'hésitez pas à mettre à proximité de vous l\'ensemble des ingrédients (moutarde, fromages, épices, vin blanc, gnôle, ...). Ceci permettra de vous concentrer uniquement sur vos gestes. C\'est parti\r\nVerser la moitié du vin blanc sec dans le caquelon pendant 5 minutes à feu fort.\r\nEnsuite mettre le caquelon (rechaud) sur feu doux pour éviter de brûler le fromage. Plonger au fur et à mesure vos cubes (ou lamelles) de fromages dans le caquelon.\r\nArrosez à plusieurs reprises le vin blanc de Savoie en couvrant généreusement les fromages\r\nLaissez fondre, sans cesser de mélanger avec un mouvement en huit et avec votre cuillère en bois, jusqu\'à ce que la fondue devienne lisse et homogène\r\nIncorporez quelques gouttes de gnôle, la moutarde et un peu de poivre.\r\nLaissez cuire encore 5 min sans cesser de remuer\r\nVous pouvez servir cette fondue onctueuse et l\'accompagner d\'une salade sans oublier de mettre une bouteille de vin blanc à table Avant la fin de la dégustation de la fondue vous pouvez ajouter un jaune d’œuf, mélanger avant le restant de fromage et couper le feu de l\'appareil à fondue.\r\nAstuces (ou pas): 1: Vous pouvez ajouter un peu de muscade dans ce plat. 2: Je déconseille de mettre de la Maïzena', 2),
	(8, 'Oeuf à la neige', 10, 'Séparez les blancs d’oeufs des jaunes. Fouettez les blancs d’oeufs à petite vitesse : lorsqu’ils moussent, ajoutez le sucre pour les serrer. Continuez à fouetter jusqu’à ce que la neige soit bien ferme. Faites chauffer 2 litres d’eau et maintenez à touts petits frémissements. Pochez de petites louches de blancs montés 5 à 7 minutes sur une face, puis 2 ou 3 minutes sur l’autre face. Égouttez-les sur un torchon propre et sec et réservez-les.\r\nFaites chauffer 70 cl de lait chaud dans une casserole avec la gousse de vanille fendue en 2 dans la longueur et grattée. Blanchissez les jaunes d’oeufs avec 60 g de sucre, versez le lait bouillant dessus et remettez la préparation à épaissir à feu doux en mélangeant constamment (la crème ne doit surtout pas bouillir) à l’aide d’une spatule en bois. Lorsque la crème nappe la spatule, ôtez la gousse, stoppez la cuisson et laissez refroidir.\r\nServez la crème anglaise refroidie dans une assiette creuse, garnie de blancs d’oeufs cuits.', 3),
	(9, 'Tiramisu', 10, 'Séparer les blancs des jaunes d\'oeufs.\r\nMélanger les jaunes avec le sucre roux et le sucre vanillé.\r\nAjouter le mascarpone au fouet.\r\nMonter les blancs en neige et les incorporer délicatement à la spatule au mélange précédent. Réserver.\r\nMouiller les biscuits dans le café rapidement avant d\'en tapisser le fond du plat.\r\nRecouvrir d\'une couche de crème au mascarpone puis répéter l\'opération en alternant couche de biscuits et couche de crème en terminant par cette dernière.\r\nSaupoudrer de cacao.\r\nMettre au réfrigérateur 4 heures minimum puis déguster frais.', 3),
	(10, 'Tarte aux pommes', 20, 'Éplucher et découper en morceaux 4 Golden.\r\nFaire une compote : les mettre dans une casserole avec un peu d\'eau (1 verre ou 2). Bien remuer. Quand les pommes commencent à ramollir, ajouter un sachet ou un sachet et demi de sucre vanillé. Ajouter un peu d\'eau si nécessaire.Vous saurez si la compote est prête une fois que les pommes ne seront plus dures du tout. Ce n\'est pas grave s\'il reste quelques morceaux.\r\nPendant que la compote cuit, éplucher et couper en quatre les deux dernières pommes, puis, couper les quartiers en fines lamelles (elles serviront à être posées sur la compote).\r\nPréchauffer le four à 210°C (thermostat 7).\r\nLaisser un peu refroidir la compote et étaler la pâte brisée dans un moule et la piquer avec une fourchette.\r\nVerser la compote sur la pâte et placer les lamelles de pommes en formant une spirale ou plusieurs cercles, au choix ! Disposer des lamelles de beurre dessus.\r\nMettre au four et laisser cuire pendant 30 min max. Surveiller la cuisson. Vous pouvez ajouter un peu de sucre vanillé sur la tarte pendant que çà cuit pour caraméliser un peu.', 3),
	(11, 'Pâtes à la bolognaise', 15, 'Instructions de mon choix', 2),
	(12, 'Oeuf au plat', 2, 'Faire cuire un oeuf dans une poêle et voilà !', 1),
	(13, 'Tasse d\'eau chaude', 2, 'Mettre de l\'eau dans une tasse et la chauffer au micro-ondes', 1);

-- Listage de la structure de la table kevin_recipessql. recipe_ingredients
CREATE TABLE IF NOT EXISTS `recipe_ingredients` (
  `quantity` float NOT NULL,
  `id_ingredient` int NOT NULL,
  `id_recipe` int NOT NULL,
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_recipe` (`id_recipe`),
  CONSTRAINT `FK_recipe_ingredients_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_recipe_ingredients_recipe` FOREIGN KEY (`id_recipe`) REFERENCES `recipe` (`id_recipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table kevin_recipessql.recipe_ingredients : ~52 rows (environ)
INSERT INTO `recipe_ingredients` (`quantity`, `id_ingredient`, `id_recipe`) VALUES
	(300, 34, 5),
	(180, 10, 5),
	(4, 2, 5),
	(6, 14, 5),
	(4, 8, 5),
	(1500, 1, 6),
	(200, 42, 6),
	(60, 41, 6),
	(5, 29, 6),
	(60, 15, 6),
	(2, 43, 6),
	(60, 24, 6),
	(50, 46, 6),
	(2, 45, 6),
	(250, 16, 6),
	(1, 44, 6),
	(2, 14, 6),
	(4, 8, 6),
	(30, 47, 7),
	(400, 48, 7),
	(400, 20, 7),
	(400, 49, 7),
	(1, 43, 7),
	(1, 50, 7),
	(3, 51, 7),
	(1, 2, 7),
	(500, 52, 7),
	(2, 8, 7),
	(5, 2, 8),
	(70, 12, 8),
	(1, 53, 8),
	(12, 21, 8),
	(1, 14, 8),
	(30, 54, 9),
	(250, 55, 9),
	(25, 21, 9),
	(3, 2, 9),
	(1, 53, 9),
	(24, 56, 9),
	(50, 57, 9),
	(30, 41, 10),
	(1, 58, 10),
	(6, 23, 10),
	(1, 53, 10),
	(300, 34, 11),
	(6, 28, 11),
	(4, 26, 11),
	(1, 33, 11),
	(2, 14, 11),
	(1, 2, 12),
	(10, 41, 12),
	(1, 65, 13);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
