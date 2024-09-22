USE transporte_mercancias;
GO

-- NIVEL BÁSICO

-- 1. Consulta básica de conductores:
-- Escribe una consulta que muestre los nombres, apellidos y antigüedad de todos los conductores en la base de datos.

SELECT * FROM conductores;
SELECT nombres, apellido_paterno, apellido_materno, antiguedad FROM conductores;

-- 2. Camiones activos:
-- Escribe una consulta que muestre las placas vehiculares y la capacidad de todos los camiones cuyo estado actual es "activo".

-- 3. Rutas entre ciudades:
-- Encuentra todas las rutas en las que la ciudad de origen es 'Lima'. Muestra el destino, la distancia y el tiempo aproximado de viaje.

-- 4. Buscar conductores con incidentes:
-- Escribe una consulta para obtener los nombres completos y la cantidad de incidentes de todos los conductores.


-- NIVEL INTERMEDIO

-- 1. Viajes recientes:
-- Escribe una consulta que muestre los datos de los viajes (ID de viaje, fecha de salida y llegada) realizados en los últimos 6 meses.

SELECT id, fecha_llegada, fecha_salida
FROM viajes
WHERE fecha_salida >= DATEADD(MONTH, -6 , GETDATE());


-- 2. Conductores con más de 2 incidentes:
-- Escribe una consulta que muestre los nombres completos y el número de licencia de los conductores que han tenido más de 2 incidentes.

-- 3. Camiones y rutas:
-- Escribe una consulta que muestre la placa vehicular y la ciudad destino de los camiones que han recorrido rutas con más de 500 km de distancia.

-- 4. Detalles de incidentes:
-- Escribe una consulta para listar los detalles de todos los incidentes (nombres del conductor, tipo de incidente, y descripción del incidente).


-- NIVEL AVANZADO

-- 1. Conductores sin incidentes:
-- Escribe una consulta que muestre los nombres completos y el número de licencia de los conductores que no han tenido ningún incidente.

SELECT c.nombres, c.apellido_paterno, c.apellido_materno, COUNT(i.id) AS cantidad_incidentes
FROM conductores c
LEFT JOIN incidentes i ON c.id = i.conductor_id
GROUP BY c.nombres, c.apellido_paterno, c.apellido_materno;

SELECT CONCAT(c.nombres, ' ', c.apellido_paterno, ' ', c.apellido_materno) AS nombres_completos, c.licencia_conducir
FROM conductores c
LEFT JOIN incidentes i
ON c.id = i.conductor_id
WHERE i.conductor_id IS NULL;


-- 2. Costo de mantenimientos:
-- Escribe una consulta que muestre el costo total de mantenimientos para cada camión, agrupando por camión.

-- 3. Ranking de conductores:
-- Escribe una consulta que muestre un ranking de conductores basado en la cantidad de incidentes, ordenado de mayor a menor.

-- 4. Consumo promedio de combustible:
-- Escribe una consulta para calcular el consumo promedio de combustible en los viajes realizados en las últimas 12 semanas.
