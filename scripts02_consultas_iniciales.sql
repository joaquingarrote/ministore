USE ministore;


SELECT *
FROM productos;

SELECT *
FROM clientes;

SELECT *
FROM ventas;


SELECT nombre, ciudad
FROM clientes
WHERE ciudad = 'Pergamino' OR ciudad = 'Rosario'


SELECT *
FROM productos
WHERE precio <= 1000 AND categoria = 'Computación'

SELECT *
FROM ventas
WHERE producto_id is null OR cliente_id is null;