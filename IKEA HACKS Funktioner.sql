/*
DATABASE FUNKTIONER

1. Vis Categories og productcategories 
*/
SELECT categories.category_name, productcategory.product_name, productcategory.pcategoryId 
FROM categories
INNER JOIN productcategory 
ON categories.categoriesId = productcategory.categoriesId;
----------------------------------------------------------------------------------------------------------------------
/*
2.	Vis Categories og antal productcategories der er hhv. oprettet og published for online brugerne 
*/
SELECT categories.category_name, productcategory.product_name, post.state 
FROM categories
INNER JOIN productcategory 
ON categories.categoriesId = productcategory.categoriesId
INNER JOIN post ON productcategory.pcategoryId =  post.pcategoryId 
WHERE state = true;
----------------------------------------------------------------------------------------------------------------------
/*
3.	Vis productcategories og antallet af posts der er registreret under dem hver især. 
*/
SELECT productcategory.product_name, 
         (SELECT COUNT(*) 
          FROM post 
         WHERE pcategoryId = productcategory.pcategoryId) Posts_count
  FROM productcategory;
----------------------------------------------------------------------------------------------------------------------  
/*
4.	Søg efter indlæg skrevet om <productcategory>. 
*/
SELECT productcategory.product_name, post.state, post.date_time, article.art_text, article.art_image, article.rating
FROM categories
INNER JOIN productcategory 
ON categories.categoriesId = productcategory.categoriesId
INNER JOIN post ON productcategory.pcategoryId =  post.pcategoryId
INNER JOIN article ON post.articleID = article.articleId;
----------------------------------------------------------------------------------------------------------------------
/*
5. Vis information om contributors
*/
SELECT * FROM ikea_hacks.contributor;
----------------------------------------------------------------------------------------------------------------------
/*
6.	Vis information om contributors indlæg 
*/
SELECT contributor.email,productcategory.product_name, post.state, post.date_time, 
article.art_text, article.art_image, article.rating
FROM categories
INNER JOIN productcategory 
ON categories.categoriesId = productcategory.categoriesId
INNER JOIN post ON productcategory.pcategoryId =  post.pcategoryId
INNER JOIN article ON post.articleID = article.articleId
INNER JOIN contributor ON post.userId = contributor.userId;
