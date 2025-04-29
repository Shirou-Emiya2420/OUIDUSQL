# 📚 Recettes SQL — Projet Base de Données

## 🚀 Présentation
Ce projet consiste à créer, insérer et manipuler une base de données de **recettes de cuisine**, avec leurs **ingrédients** et **catégories** associées.

Les objectifs :
- Modéliser une base cohérente (recettes, ingrédients, catégories)
- Insérer des données réalistes
- Effectuer des requêtes SQL complexes
- Travailler avec des notions comme `JOIN`, `GROUP BY`, `HAVING`, `MAX`, `DISTINCT`, etc.

---

## 🛠 Fichiers fournis

| Fichier | Description |
|:--------|:------------|
| `drop.sql` | Script pour supprimer les anciennes tables |
| `recipe.sql` | Script de création des tables (`recipe`, `ingredient`, `category`, `recipe_ingredients`) |
| `value_insert.sql` | Premiers jeux de données (catégories, ingrédients, recettes) |
| `value_insert_2.sql` | Second jeux d'insertion d'ingrédients et de recettes |
| `requet.sql` | Ensemble de requêtes d'interrogation sur la base |

---

## 🏐 Structure de la base

### Tables principales :
- `ingredient` : stocke les ingrédients disponibles
- `category` : stocke les types de recettes (entrée, plat, dessert, etc.)
- `recipe` : stocke les recettes
- `recipe_ingredients` : fait la liaison entre recettes et ingrédients (avec quantité)

---

## 🧹 Principales fonctionnalités SQL

- **Ajout de recettes sans ingrédients** (ex: tasse d'eau chaude)
- **Calcul du coût total d'une recette** (`SUM(price)`)
- **Recherche des recettes les plus chères**
- **Filtrer les ingrédients utilisés dans au moins 3 recettes**
- **Lister les recettes sans aucun ingrédient**
- **Récupération du dernier ID inséré** (`LAST_INSERT_ID()`)

---

## 📋 Instructions d'utilisation

1. **Supprimer** les anciennes tables :
   ```bash
   source drop.sql
   ```

2. **Créer** la structure de la base :
   ```bash
   source recipe.sql
   ```

3. **Insérer** les données :
   ```bash
   source value_insert.sql
   source value_insert_2.sql
   ```

4. **Exécuter** les requêtes :
   ```bash
   source requet.sql
   ```

---

## 🧐 Concepts SQL utilisés

- **`CREATE TABLE` / `DROP TABLE`**
- **`PRIMARY KEY` / `FOREIGN KEY`**
- **`AUTO_INCREMENT`**
- **`INNER JOIN`, `LEFT JOIN`**
- **`GROUP BY`, `HAVING`, `ORDER BY`**
- **`DISTINCT`, `MAX()`, `SUM()`, `COUNT()`**
- **`WHERE IS NULL`**
- **Sous-requêtes imbriquées**

---

## 🌟 Objectifs pédagogiques

- Savoir modéliser et interroger une base de données relationnelle
- Savoir travailler avec des jointures complexes
- Être capable de construire des requêtes conditionnelles avancées
- Être autonome pour ajouter, modifier et interroger des données métier réalistes

---

## 🌈 Exemple de requête avancée

> Trouver toutes les recettes dont le prix est égal au prix maximum :

```sql
SELECT r.recipe_name, SUM(i.price) AS prixtt
FROM recipe r
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
```

---

## 📌 Notes importantes

- Certaines recettes peuvent ne contenir **aucun ingrédient** volontairement.
- Plusieurs recettes peuvent avoir **le même prix total**.
- Les données sont conçues pour être facilement extensibles.

---

# 🏁 Bravo !
Ce projet constitue une base solide pour aller plus loin :  
- Optimisation des requêtes  
- Ajout de vues SQL  
- Génération de statistiques avancées

