# Proyecto de Gestión de Ventas

## 1. Descripción del proyecto

Este proyecto consiste en la creación de una estructura de base de datos relacional para gestionar información de productos, clientes y ventas, utilizando SQL Server 2025.

El objetivo es aplicar los conceptos básicos de SQL mediante la creación de bases de datos y tablas, la inserción de registros y la ejecución de consultas de selección y filtrado.

## 2. Descripción del problema

Un comercio necesita organizar la información de sus productos, clientes y transacciones de ventas para facilitar su consulta y análisis.

Para resolver esta necesidad, se propone una base de datos compuesta por tres tablas relacionadas conceptualmente:

- **Productos:** almacena el nombre, la categoría y el precio de cada producto.
- **Clientes:** registra el nombre y la ciudad de cada cliente.
- **Ventas:** contiene información sobre las transacciones realizadas, incluyendo el producto, el cliente, la cantidad y la fecha de venta.

Esta estructura permite relacionar la información comercial y practicar consultas SQL para recuperar y filtrar datos según diferentes condiciones.

## 3. Estructura de archivos

El proyecto está organizado de la siguiente manera:

```text
Proyecto_Ventas/
├── README.md
└── scripts/
    ├── 01_tablas_base.sql
    └── 02_consultas_iniciales.sql
```

- `README.md`: describe el proyecto y explica cómo ejecutar los scripts.
- `scripts/01_tablas_base.sql`: contiene las instrucciones para crear la base de datos, definir las tablas e insertar los datos de prueba.
- `scripts/02_consultas_iniciales.sql`: contiene las consultas de selección y filtrado para validar la información almacenada.

## 4. Tecnologías utilizadas

- Microsoft SQL Server 2025.
- Lenguaje SQL (Structured Query Language).
- SQL Server Management Studio (SSMS) para ejecutar y administrar los scripts.

## 5. Pasos para ejecutar el proyecto

1. Abrir SQL Server Management Studio y conectarse a una instancia de SQL Server 2025.
2. Abrir el archivo `scripts/01_tablas_base.sql`.
3. Ejecutar el script para crear la base de datos, las tablas y cargar los datos iniciales.
4. Abrir el archivo `scripts/02_consultas_iniciales.sql`.
5. Seleccionar la base de datos del proyecto y ejecutar las consultas.
6. Verificar los resultados obtenidos en la ventana de resultados de SQL Server Management Studio.

**Importante:** ejecutar primero el script de creación y carga de datos antes de ejecutar las consultas de validación.

## 6. Objetivos de aprendizaje

- Crear una base de datos y tablas mediante `CREATE DATABASE` y `CREATE TABLE`.
- Definir claves primarias mediante `PRIMARY KEY`.
- Utilizar tipos de datos como `INT`, `VARCHAR`, `DECIMAL` y `DATE`.
- Insertar registros mediante `INSERT INTO`.
- Recuperar información mediante `SELECT`.
- Filtrar registros utilizando `WHERE`, operadores lógicos y operadores de comparación.
- Identificar valores nulos mediante `IS NULL` e `IS NOT NULL`.

## 7. Resultado esperado

Al finalizar el ejercicio, se contará con una base de datos relacional de gestión de ventas con información de productos, clientes y transacciones, junto con consultas SQL que permitan validar su contenido y aplicar operaciones básicas de selección y filtrado.

Este proyecto constituye la estructura inicial sobre la cual se podrán desarrollar análisis y consultas más avanzadas en futuras etapas.
