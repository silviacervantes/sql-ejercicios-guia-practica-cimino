# 51. Insertar un nuevo cliente con los siguientes datos:
# '12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01', 'perez_luisenrique@ma1l.com', 
# '1157319468', 'Pujol 416', 'Caballito', 'Uruguay'
INSERT INTO clientes (dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)VALUES('12169851', 'Luis Enrique', 'Pérez', 'HOMBRE', '1954-06-01', 
'perez_luisenrique@ma1l.com', '1157319468', 'Pujol 416', 'Caballito', 'Uruguay');

# Insertar los siguientes clientes en una sola consulta:
# DNI Nombre Apellido Género Fecha de nacimiento Mail Móvil Dirección Barrio Nacido en
# 17278290 Florencia Santos MUJER 1963-07-12 flor.santos@ma1l.com 1148434346 Piran 3015 Villa Urquiza Argentina
# 16839283 Luisa Nina Escudero MUJER 1962-03-22 lulu62@hushma1l.com 1175940343 Superi 348 1º A Colegiales Colombia
# 19164274 Carlos Alberto Medina HOMBRE 1966-04-26 medinacarlosalberto@z0h0.com 1123423451 Mexico 2121 Balvanera Argentina

INSERT INTO clientes (dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
VALUES
('17278290','Florencia','Santos','MUJER', '1963-07-12','flor.santos@ma1l.com','1148434346','Piran 3015','Villa Urquiza','Argentina'),
('16839283','Luisa Nina','Escudero','MUJER','1962-03-22','lulu62@hushma1l.com','1175940343','Superi 348 1º A','Colegiales','Colombia'),
('19164274','Carlos Alberto','Medina','HOMBRE','1966-04-26','medinacarlosalberto@z0h0.com','1123423451','Mexico 2121','Balvanera','Argentina');

# Insertar una cliente llamada María Sol González, con DNI 36.427.254, nacida en Argentina el 15 de 
# agosto de 1992. Domiciliada en Gurruchaga 243, Villa Crespo. Su móvil es 1136782013 y su mail es 
# ma.gon54@gma1l.com.
INSERT INTO clientes (dni,nombre,apellido,genero,fecha_nacimiento,mail,movil,domicilio,barrio,nacionalidad)
VALUES ('36427254','Maria Sol','Gonzalez','MUJER','1992-08-15','ma.gon54@gma1l.com','1136782013','Gurruchaga 243','Villa Crespo','Argentina');

# Modificar el apellido de la cliente 85 por 'Chaves'. (Se espera 1 registro afectado).
SELECT * FROM clientes WHERE id_cliente = 85;
UPDATE clientes SET apellido = 'Chavez' WHERE id_cliente = 85;

# Agregar un cero a la izquierda de todos los DNI con exactamente siete cifras. 
# (Se esperan 1173 registros afectados).

SELECT dni FROM clientes WHERE length(dni) =7;
UPDATE clientes SET dni = CONCAT('0',dni) WHERE length(dni) =7;

# Agregar una tilde a todos los clientes llamados 'Nicolas' como único nombre para que el mismo pase a 
# ser 'Nicolás'. (Se esperan 3 registros afectados).

SELECT * FROM clientes WHERE nombre = 'Nicolas'
UPDATE clientes SET nombre = 'Nicolás' WHERE nombre = 'Nicolas'

# Poner en mayúsculas los apellidos de los clientes cuya nacionalidad no sea 'Argentina'. 
# (Se esperan 4450 registros afectados).
SELECT nombre FROM clientes WHERE nacionalidad <> 'Argentina';
UPDATE clientes SET nombre = UPPER(nombre) WHERE nacionalidad <> 'Argentina';

# 58. Eliminar al cliente 9802. (Se espera 1 registro afectado).
DELETE FROM clientes WHERE id_cliente = 9802;

# 59. Eliminar a los clientes cuyo servidor de mail sea 'z0h0'. (Se esperan 2127 registros afectados).
SELECT * FROM clientes WHERE mail LIKE '%@z0h0.%';
DELETE FROM clientes WHERE mail LIKE '%@z0h0.%';

# 60. Eliminar a todos los clientes que residan en el barrio de 'Flores'. 
# (Se esperan 803 registros afectados).
SELECT * FROM clientes WHERE barrio LIKE 'Floresta';
