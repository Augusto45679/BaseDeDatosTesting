-- 1. ¿Como puedo ordenar de mayor a menor? ¿ De menor a mayor?
-- Usas la cláusula ORDER BY al final de tu consulta.
-- De menor a mayor (Ascendente): Se usa ASC. Esta es la opción por defecto, así que si no pones nada, ordenará de menor a mayor.
-- De mayor a menor (Descendente): Se usa DESC.

SELECT descrip, precio
FROM ARTICULOS
ORDER BY precio ASC;

-- 2.¿Como puedo filtrar por letras del abecedario?
-- Usas la cláusula WHERE junto con el operador LIKE y los comodines
-- % (representa cero o más caracteres) y _ (representa un solo carácter).

SELECT nombre
FROM CLIENTES
WHERE nombre LIKE 'A%';


-- 3. ¿Como puedo ordenar por orden alfabetico?
-- lo mismo que el punto 1, pero en vez de precio, se usa el nombre o la columna que quieras.

-- 4. ¿Como puedo filtar por año?
-- Usas la cláusula WHERE y necesitas una función para extraer el año de una columna de tipo DATE. 
-- En Oracle (que parece ser el dialecto por el TO_DATE y VARCHAR2), puedes usar EXTRACT

SELECT codfac, fecha, codcli
FROM FACTURAS
WHERE EXTRACT(YEAR FROM fecha) = 2022;

-- ADD ONS

-- JOINs (Uniones): Cuando necesitas datos de más de una tabla a la vez, usas JOIN.
-- Por ejemplo, si quieres ver el nombre del cliente y el nombre de su pueblo (no solo el código):
SELECT c.nombre AS NombreCliente, p.nombre AS NombrePueblo
FROM CLIENTES c
JOIN PUEBLOS p ON c.codpue = p.codpue;
--Funciones de Agregado: COUNT, SUM, AVG, MAX, MIN te permiten hacer cálculos sobre grupos de filas.
--A menudo se usan con GROUP BY. Por ejemplo, para contar cuántos clientes hay en cada pueblo:
SELECT codpue, COUNT(*) AS NumeroClientes
FROM CLIENTES
GROUP BY codpue;

--ALIAS
-- Existen alias de columnas y tablas
-- Puedes usar la palabra clave AS (que es la forma más clara y recomendada) o simplemente
-- poner el alias después del nombre de la columna (aunque esto puede ser menos legible).


-- Mostrar el código de artículo y la cantidad de aquellas líneas cuyo descuento es igual a 10% o
-- cuyo precio supera los 30$

SELECT
     l.codArt AS codigoArticulo,
     l.cant AS cantidad
FROM
     ARTICULOS a
JOIN LINEAS_FAC l ON a.codart = l.codart 
WHERE 
    l.dto = 10 
    OR l.precio > 30



