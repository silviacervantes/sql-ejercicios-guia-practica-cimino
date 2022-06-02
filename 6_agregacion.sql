# 36. Mostrar según la tabla de países, la cantidad total de población, la población máxima, la población 
# mínima, el promedio de población y con cuántos registros de población se cuenta. 
# (Se esperan 5 columnas y 1 registro).
SELECT SUM(P.population) AS TOTAL, 
	MAX(P.population) AS MAX,
    MIN(P.population)AS MIN,
    AVG(P.population) AS PROM,
    COUNT(P.population) AS CANT_REGISTROS
FROM country AS P;

# 37. Mostrar según la tabla de países, la cantidad total de población, la población máxima, 
# la población mínima y el promedio de población, por cada continente. 
# (Se esperan 5 columnas y 7 registros).
SELECT P.continent AS CONTINENTE,
	SUM(P.population) AS TOTAL, 
	MAX(P.population) AS MAX,
    MIN(P.population)AS MIN,
    AVG(P.population) AS PROM,
    COUNT(P.population) AS CANT_REGISTROS
FROM country AS P
GROUP By P.continent;

# 38. Agrupar a todos los países según el continente al que pertenecen. Mostrar los continentes junto a 
# la cantidad de naciones que pertenecen a cada uno. (Se esperan 2 columnas y 7 registros).
SELECT P.continent AS CONTINENTE, COUNT(P.name) AS CANT_NACIONES 
FROM country AS P
GROUP By P.continent;

# 39. Agrupar a todas las ciudades según el país al que pertenecen. Mostrar los códigos de países junto 
# a la sumatoria total de habitantes de cada uno. (Se esperan 2 columnas y 232 registros).
SELECT C.CountryCode AS CODIGO_PAIS, SUM(C.population) AS SUMA_POBLACION 
FROM city AS C
GROUP By C.CountryCode;

# 40. Agrupar a todos los lenguajes según su nombre. Mostrar los nombres de los lenguajes junto al 
# porcentaje de habla mínimo registrado para cada uno. (Se esperan 2 columnas y 457 registros).
SELECT L.Language AS Lenguaje, L.percentage AS "%"
FROM countrylanguage AS L
GROUP By language;

# 41. Mostrar las distintas formas de gobierno posibles de los países europeos junto a su correspondiente 
# promedio de población que vive bajo estas circunstancias. (Se esperan 2 columnas y 10 registros).
SELECT P.GovernmentForm, AVG(P.population)
FROM country AS P
GROUP By P.GovernmentForm;

# 42. Mostrar las diez regiones de mayor expectativa de vida promedio. (Se esperan 2 columnas y 10 
# registros).
SELECT P.region, AVG(P.LifeExpectancy) AS promedio_vida
FROM country AS P
GROUP By P.region ORDER By promedio_vida DESC LIMIT 10;

# 43. Mostrar los nombres de los diez distritos de mayor cantidad de ciudades con cantidad de habitantes 
# mayor al medio millón, junto a la cantidad de ciudades. (Se esperan 3 columnas y 10 registros).
SELECT C.district AS DISTRITO, COUNT(C.id) AS CANT_CIUDADES
FROM city as C
WHERE C.population > 500000
GROUP By C.district
ORDER By CANT_CIUDADES DESC 
LIMIT 10;

# 44. Mostrar los nombres de los países que tengan ciudades en el Caribe, junto al número de las mismas 
# por país. (Se esperan 2 columnas y 24 registros).
SELECT P.name, COUNT(C.id) AS CANTIDAD_CIUDADES
FROM city AS C
LEFT JOIN country  AS P ON (P.code = C.CountryCode) 
WHERE P.Region = 'Caribbean'
Group By P.name;

# 45. Mostrar los lenguajes existentes junto a la cantidad de países que lo hablan de manera oficial. 
# (Se esperan 2 columnas y 102 registros).

SELECT L.language AS LENGUAGE, COUNT(P.code) AS CANT_PAISES_HABLAN
FROM countryLanguage AS L
RIGHT JOIN country as P ON L.countrycode = P.code
WHERE L.IsOfficial = True
GROUP By L.language
ORDER By CANT_PAISES_HABLAN DESC;