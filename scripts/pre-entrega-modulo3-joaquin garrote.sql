/*
    AlumnO: [Joaquin Garrote]
    Proyecto: Ministore
    Módulo: 3 - Capa Relacional Avanzada
    Fecha: 29/10/2026
    Archivo: pre-entrega-modulo3-TUNOMBRE.sql
*/

USE MiniStore;
GO

-- =========================================================
-- 1. MASTER REPORT: VENTAS POR CLIENTE Y CATEGORÍA
-- Problema de negocio:
-- Identificar cuánto compró cada cliente por categoría
-- de producto para analizar sus preferencias de consumo.
-- Se combinan tres tablas y se aplican agregaciones.
-- =========================================================

SELECT
    c.cliente_id AS ID_Cliente,
    c.nombre AS Nombre_Cliente,
    p.categoria AS Categoria_Producto,
    COUNT(v.venta_id) AS Total_Transacciones,
    SUM(v.cantidad) AS Total_Unidades,
    SUM(v.cantidad * p.precio) AS Importe_Total
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.cliente_id = c.cliente_id
INNER JOIN productos AS p
    ON v.producto_id = p.producto_id
GROUP BY
    c.cliente_id,
    c.nombre,
    p.categoria
ORDER BY
    Importe_Total DESC;



-- =========================================================
-- 2.1. UNION: CLIENTES DE DOS CIUDADES
-- Problema de negocio:
-- Obtener una lista única de clientes de Buenos Aires
-- y Pergamino para analizar ambos mercados.
-- UNION elimina los registros duplicados.
-- =========================================================

SELECT
    c.cliente_id AS ID_Cliente,
    c.nombre AS Nombre_Cliente,
    c.ciudad AS Ciudad
FROM clientes AS c
WHERE c.ciudad = 'Buenos Aires'

UNION

SELECT
    c.cliente_id AS ID_Cliente,
    c.nombre AS Nombre_Cliente,
    c.ciudad AS Ciudad
FROM clientes AS c
WHERE c.ciudad = 'Pergamino';
GO


-- =========================================================
-- 2.2. EXCEPT: PRODUCTOS QUE NUNCA SE VENDIERON
-- Problema de negocio:
-- Identificar productos del catálogo que no aparecen
-- en ninguna venta para evaluar su rotación comercial.
-- EXCEPT devuelve los productos presentes en la primera
-- consulta que no aparecen en la segunda.
-- =========================================================

SELECT
    p.producto_id AS ID_Producto
FROM productos AS p

EXCEPT

SELECT
    v.producto_id AS ID_Producto
FROM ventas AS v;
GO


-- =========================================================
-- 3. AUDITORÍA: VENTAS CON PRODUCTOS HUÉRFANOS
-- Problema de negocio:
-- Detectar ventas cuyo producto no existe en el catálogo.
-- Si aparecen resultados, investigar el origen del dato,
-- notificar al responsable y corregir la referencia.
-- No eliminar registros sin verificar antes su validez.
-- =========================================================

SELECT
    v.venta_id AS ID_Venta,
    v.producto_id AS ID_Producto_Inexistente,
    v.cliente_id AS ID_Cliente,
    v.cantidad AS Cantidad_Vendida,
    v.fecha_venta AS Fecha_Venta
FROM ventas AS v
LEFT JOIN productos AS p
    ON v.producto_id = p.producto_id
WHERE p.producto_id IS NULL;
GO