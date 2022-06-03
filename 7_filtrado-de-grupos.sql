# 46. Mostrar listados los años de independencia (sin nulos) junto a la cantidad de países que la hayan 
# conseguido en ese año. Se desea visualizar aquellos años donde más de un país se haya independizado. 
# (Se esperan 2 columnas y 39 registros).

SELECT IndepYear as ANIO_INDEP, COUNT(Name) AS CANT_PAISES
FROM country 
WHERE IndepYear is not null 
GROUP By IndepYear
HAVING CANT_PAISES > 1;

# 47. Listar los países junto a la cantidad de idiomas diferentes hablados, pero solo aquellos donde se 
# hablen entre tres y cinco idiomas diferentes. (Se esperan 2 columnas y 80 registros).

SELECT P.name AS PAIS, COUNT(L.Language) AS CANT_IDIOMAS
FROM country AS P
RIGHT JOIN countrylanguage as L ON P.code = L.countrycode
GROUP By P.name
HAVING CANT_IDIOMAS >= 3 AND CANT_IDIOMAS <=5;

# 48. Mostrar los distritos, junto al nombre del país al que pertenecen, cuya población total 
# (también listada) no supere los diez mil habitantes. (Se esperan 3 columnas y 35 registros).
SELECT C.district AS DISTRITO, P.name AS PAIS, SUM(C.population) AS POBLACION
FROM city AS C
LEFT JOIN country as P ON C.countrycode = P.code 
GROUP By C.district
HAVING POBLACION <= 10000
ORDER By DISTRITO;

# 49. Mostrar las regiones junto a su densidad poblacional promedio, donde ésta supere a la mitad de la 
# densidad poblacional máxima. (Se esperan 2 columnas y 3 registros).
SELECT P.region AS REGION, 
	AVG(P.population/ P.SurfaceArea) AS DEN_REGION_PROM
FROM country AS P
GROUP By P.region
HAVING DEN_REGION_PROM > MAX(P.population/ P.SurfaceArea)/2;

# 50. Mostrar los lenguajes oficiales junto a su porcentaje promedio de habla, cuyo promedio no supere un 
# dígito entero. (Se esperan 2 columnas y 7 registros).
SELECT L.language AS LENGUAJE, AVG(L.percentage) AS PORCENTAJE
FROM countrylanguage AS L
WHERE IsOfficial = True 
GROUP By L.language
HAVING PORCENTAJE < 9;