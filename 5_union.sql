# 26. Listar los nombres de los países sudamericanos junto a los nombres (alias 'Capital') de sus capitales. (Se esperan 2 columnas y 14 registros).
SELECT country.name, city.name 
FROM country LEFT JOIN city ON country.capital = city.id WHERE continent LIKE 'South America';
# 27. Listar el código de país, junto a los nombres de las ciudades y su cantidad de habitantes, de aquellos cuya expectativa de vida sea mayor a 80. (Se esperan 3 columnas y 253 registros).
SELECT country.code, city.name, city.population 
FROM country RIGHT JOIN city ON country.code = city.CountryCode WHERE LifeExpectancy > 80;
# 28. Listar las capitales de los países cuya forma de gobierno sea una República Federal. (Se esperan 2 columnas y 15 registros).
SELECT country.name AS PAIS,city.name AS CAPITAL,country.GovernmentForm 
FROM country LEFT JOIN city ON city.id = country.capital WHERE GovernmentForm = 'Federal Republic';
# 29. Listar los lenguajes oficiales, junto al nombre de sus respectivos países, donde la cantidad de 
# habitantes de dicho país esté entre un millón y tres millones. (Se esperan 2 columnas y 14 registros).
SELECT country.name AS PAIS, countrylanguage.language AS LENGUAJE_OFICIAL
FROM country 
RIGHT JOIN countrylanguage ON country.code = countrylanguage.CountryCode AND countrylanguage.IsOfficial = True 
WHERE country.Population > 1000000 AND Population < 3000000;
# 30. Listar los códigos, los nombres locales y la región a la que pertenecen aquellos países donde se 
# hable español. (Se esperan 3 columnas y 28 registros).
SELECT country.code AS CODIGO,country.localname AS "NOMBRE LOCAL",country.region AS REGION
FROM countrylanguage
RIGHT JOIN country ON country.code = countrylanguage.CountryCode
WHERE countrylanguage.Language='Spanish';
# 31. Listar los nombres y las capitales de los países en cuya capital se concentre más de la mitad de 
#su población total. (Se esperan 2 columnas y 14 registros).
SELECT city.name, country.name 
FROM city 
RIGHT JOIN country ON city.id = country.capital 
WHERE city.population >= (country.population/2);
# 32. Listar los nombres y la superficie de los países africanos cuya capital coincida con el nombre del
# distrito a la que pertenece. (Se esperan 2 columnas y 32 registros).
SELECT P.name AS PAIS, P.SurfaceArea AS SUPERFICIE, C.name AS nombre, C.district AS DISTRITO
FROM country AS P 
LEFT JOIN city AS C ON c.id = P.capital 
WHERE P.continent = 'Africa' AND C.name = C.district ;
# 33. Listar los nombres, las capitales y el año de independencia (sin nulos) de los 20 países más 
# antiguos. (Se esperan 3 columnas y 20 registros).
SELECT P.name AS PAIS, C.name, P.IndepYear AS anio_indep
FROM country as P 
LEFT JOIN city AS C ON P.capital = C.id
WHERE P.IndepYear is not null 
ORDER By IndepYear ASC LIMIT 20;

# 34. Listar las ciudades junto a sus idiomas oficiales, donde no se hable español, inglés, portugués, 
# italiano, francés o alemán de manera oficial. (Se esperan 2 columnas y 2694 registros).
SELECT C.name AS CIUDAD, L.Language
FROM city AS C
LEFT JOIN countrylanguage AS L ON L.CountryCode = C.CountryCode 
WHERE L.IsOfficial = True AND L.Language not in ('Spanish','English','Portuguese','Italian','French','German');

# 35. Listar nombre, población y país de las diez ciudades europeas de habla inglesa más pobladas. 
# (Se esperan 3 columnas y 10 registros).
SELECT C.name AS CIUDAD, C.population as POBLACION, P.name AS PAIS
FROM city AS C
LEFT JOIN countrylanguage AS L ON L.countrycode = C.countrycode
LEFT JOIN country AS P ON P.code = C.countrycode
WHERE L.Language = 'English' 
ORDER By C.population DESC LIMIT 10
