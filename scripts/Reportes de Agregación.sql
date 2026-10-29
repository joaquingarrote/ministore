/*
    Alumno: [Joaquin Garote]
    Fecha: 29/10/2026
    Proyecto: Ministore
    Archivo: reporte_agregaciones_V1.sql
    Descripción: Reportes utilizando funciones de agregación SQL.
*/

USE MiniStore;
GO

-- =========================================================
-- CONSULTA 1: MÉTRICA GLOBAL
-- ¿Cuántas ventas se registraron y cuántas unidades se vendieron?
-- COUNT cuenta las transacciones y SUM calcula las unidades.
-- =========================================================

SELECT
    COUNT(*) AS Total_Ventas,
    SUM(cantidad) AS Total_Unidades_Vendidas
FROM ventas;


-- =========================================================
-- CONSULTA 2: EXTREMOS Y PROMEDIOS
-- ¿Cuál es la cantidad mínima, máxima y promedio por venta?
-- Permite comprender el volumen de unidades por transacción.
-- =========================================================

SELECT
    MAX(cantidad) AS Cantidad_Maxima,
    MIN(cantidad) AS Cantidad_Minima,
    AVG(CAST(cantidad AS DECIMAL(10,2))) AS Cantidad_Promedio
FROM ventas;


-- =========================================================
-- CONSULTA 3: AGRUPAMIENTO SIMPLE
-- ¿Cuántas ventas y unidades se registraron por producto?
-- Permite identificar el volumen de ventas de cada producto.
-- =========================================================

SELECT
    p.nombre AS Nombre_Producto,
    COUNT(v.venta_id) AS Total_Ventas,
    SUM(v.cantidad) AS Total_Unidades_Vendidas
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.producto_id = v.producto_id
GROUP BY
    p.nombre
ORDER BY 
   SUM(v.cantidad) DESC;


-- =========================================================
-- CONSULTA 4: AGRUPAMIENTO CON ORDEN
-- ¿Qué productos tienen mayor volumen de unidades vendidas?
-- Se ordena de mayor a menor para facilitar la comparación.
-- =========================================================

SELECT
    p.nombre AS Nombre_Producto,
    COUNT(v.venta_id) AS Total_Ventas,
    COALESCE(SUM(v.cantidad), 0) AS Total_Unidades_Vendidas
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.producto_id = v.producto_id
GROUP BY
    p.producto_id,
    p.nombre
ORDER BY
    Total_Unidades_Vendidas DESC;


-- =========================================================
-- CONSULTA 5: FILTRO DE NEGOCIO CON HAVING
-- ¿Qué productos acumularon más de 5 unidades vendidas?
-- HAVING filtra los grupos después de realizar la agregación.
-- =========================================================

SELECT
    p.nombre AS Nombre_Producto,
    SUM(v.cantidad) AS Total_Unidades_Vendidas
FROM productos AS p
INNER JOIN ventas AS v
    ON p.producto_id = v.producto_id
GROUP BY
    p.producto_id,
    p.nombre
HAVING
    SUM(v.cantidad) > 5
ORDER BY
    Total_Unidades_Vendidas DESC;