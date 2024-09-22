USE transporte_mercancias;
GO

---------Insertando_datos_tablas_conductores-------------
INSERT INTO conductores (numero_documento, nombres, apellido_paterno, apellido_materno, licencia_conducir, fecha_contratacion, antiguedad, numero_incidentes)
VALUES 
    ('45312697', 'Daniel', 'Canales','Ramirez','LD123123','2023-01-23',1,2),
	('65315697', 'Jesus', 'Chara','Tiroles','XG163929','2022-02-08',2,3),
	('40352502', 'David', 'Giraldo','Torres','UR133410','2021-08-01',3,4),
	('79338646', 'Ricardo', 'Castillo','Melgar','HJ193590','2023-02-13',1,0),
	('92348521', 'Luis', 'Nuñez','Quispe','TY263294','2022-03-19',2,1);
 
INSERT INTO conductores (numero_documento, nombres, apellido_paterno, apellido_materno, licencia_conducir, fecha_contratacion, antiguedad, numero_incidentes)
VALUES 
    ('56321478', 'Carlos', 'Perez', 'Sanchez', 'GH294823', '2020-06-15', 4, 1),
    ('78349512', 'Fernando', 'Lopez', 'Garcia', 'LR482915', '2019-09-10', 5, 2),
    ('10349567', 'Jose', 'Martinez', 'Hernandez', 'DF901234', '2021-11-20', 2, 0),
    ('65478932', 'Alberto', 'Gomez', 'Ramirez', 'PL938274', '2020-03-05', 4, 3),
    ('87654321', 'Javier', 'Ortega', 'Cruz', 'YU762945', '2022-05-30', 2, 0),
    ('65748391', 'Maria', 'Paredes', 'Salazar', 'JH198273', '2021-07-18', 3, 1),
    ('23418765', 'Angela', 'Vega', 'Morales', 'FR762943', '2020-02-25', 4, 2),
    ('78456321', 'Ramon', 'Gutierrez', 'Linares', 'TH398215', '2019-12-14', 5, 4),
    ('12983456', 'Juan', 'Mendoza', 'Castro', 'BX128394', '2022-10-03', 1, 0),
    ('23456789', 'Lorena', 'Fuentes', 'Rojas', 'KT823947', '2021-05-22', 3, 1);


---------Insertando_datos_tablas_camiones-------------
INSERT INTO camiones ( placa_vehicular,capacidad_ton, fecha_adquisicion, estado_actual, ubicacion_actual)
VALUES 
    ('UXT12697', 20,'2020-01-23','activo','Lima'),
	('TYJ15697', 25,'2018-02-08','activo','Lima'),
	('GBR52502', 20,'2017-08-01','activo','Arequipa'),
	('KRZ38646', 30,'2020-02-13','activo','Arequipa'),
	('ZVR48521', 20,'2019-03-19','activo','Lima');


---------Insertando_datos_tablas_rutas-------------
INSERT INTO rutas (ciudad_origen, ciudad_destino, distancia_km, tiempo_aproximado, condicion_ruta)
VALUES 
    ('Lima','Trujillo',680,'08:00:00','Buena'),
	('Lima','Tumbes',980,'11:00:00','Buena'),
	('Lima','Caraz',620,'09:00:00','Regular'),
	('Arequipa','Puno',420,'06:00:00','Regular'),
	('Arequipa','Ica',350,'04:00:00','Buena');

---------Insertando_datos_tablas_tipo_incidentes-------------
INSERT INTO tipo_incidentes (tipo, descripcion)
VALUES 
    ('Atropello','El camión ocacionó un atropello'),
	('Vuelco','El camión se volcó'),
	('Incendio','El camión sufrió un incendio debido a problemas mecónicos y/o eléctricos'),
	('Choque1','El camión chocó con otro vehículo'),
	('Choque2','El camión fue chocado por otro vehículo');

-- Insertar algunos valores en la tabla tipo_carga
INSERT INTO tipo_carga (descripcion)
VALUES 
    ('Electrodomésticos'),
    ('Muebles'),
    ('Alimentos'),
    ('Material de construcción'),
    ('Productos químicos');
GO

-- Insertar valores en la tabla tipo_mantenimiento
INSERT INTO tipo_mantenimiento (descripcion)
VALUES 
    ('Preventivo'),
    ('Correctivo'),
    ('Emergencia');
GO

-- Modificar la tabla mantenimientos para usar tipo_mantenimiento_id como clave foránea
ALTER TABLE mantenimientos
ADD tipo_mantenimiento_id INT;

ALTER TABLE mantenimientos
ADD CONSTRAINT FK_tipo_mantenimiento FOREIGN KEY (tipo_mantenimiento_id) REFERENCES tipo_mantenimiento(id);
GO


-- Crear el procedimiento almacenado para insertar 1000 viajes aleatorios
CREATE PROCEDURE InsertarViajesAleatorios
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @camion_id INT;
    DECLARE @conductor_id INT;
    DECLARE @ruta_id INT;
    DECLARE @fecha_salida DATETIME;
    DECLARE @fecha_llegada DATETIME;
    DECLARE @tipo_carga_id INT;
    DECLARE @consumo_combustible DECIMAL(10, 2);

    WHILE @i <= 1000
    BEGIN
        -- Generar valores aleatorios para camion_id, conductor_id y ruta_id
        SET @camion_id = (SELECT FLOOR(RAND() * (5 - 1 + 1)) + 1); -- Valores entre 1 y 5 (suponiendo 5 camiones)
        SET @conductor_id = (SELECT FLOOR(RAND() * (5 - 1 + 1)) + 1); -- Valores entre 1 y 5 (suponiendo 5 conductores)
        SET @ruta_id = (SELECT FLOOR(RAND() * (5 - 1 + 1)) + 1); -- Valores entre 1 y 5 (suponiendo 5 rutas)

        -- Generar fechas aleatorias para salida y llegada
        SET @fecha_salida = DATEADD(DAY, FLOOR(RAND() * 365), '2024-01-01'); -- Fecha entre 2024-01-01 y 2024-12-31
        SET @fecha_llegada = DATEADD(HOUR, FLOOR(RAND() * 48) + 4, @fecha_salida); -- Agregar entre 4 y 48 horas a la fecha de salida

        -- Generar un tipo_carga_id aleatorio
        SET @tipo_carga_id = (SELECT FLOOR(RAND() * (5 - 1 + 1)) + 1); -- Valores entre 1 y 5 para tipo_carga_id
        
        -- Generar consumo de combustible aleatorio
        SET @consumo_combustible = ROUND((RAND() * (500.0 - 100.0)) + 100.0, 2); -- Valores entre 100 y 500 litros

        -- Insertar el registro en la tabla viajes
        INSERT INTO viajes (camion_id, conductor_id, ruta_id, fecha_salida, fecha_llegada, tipo_carga_id, consumo_combustible)
        VALUES (@camion_id, @conductor_id, @ruta_id, @fecha_salida, @fecha_llegada, @tipo_carga_id, @consumo_combustible);

        -- Incrementar el contador
        SET @i = @i + 1;
    END;
END;
GO


EXECUTE InsertarViajesAleatorios;

SELECT * FROM viajes;

-- Crear el procedimiento almacenado para insertar 200 registros aleatorios en la tabla incidentes
CREATE PROCEDURE InsertarIncidentesAleatorios
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @viaje_id INT;
    DECLARE @conductor_id INT;
    DECLARE @tipo_incidente_id INT;

    WHILE @i <= 200
    BEGIN
        -- Generar un viaje_id aleatorio (asumiendo que hay 1000 registros en viajes)
        SET @viaje_id = (SELECT FLOOR(RAND() * (1000 - 1 + 1)) + 1); -- Valores entre 1 y 1000

        -- Obtener el conductor_id del viaje seleccionado
        SET @conductor_id = (SELECT conductor_id FROM viajes WHERE id = @viaje_id);

        -- Generar un tipo_incidente aleatorio (asumiendo que hay 5 tipos de incidentes)
        SET @tipo_incidente_id = (SELECT FLOOR(RAND() * (5 - 1 + 1)) + 1); -- Valores entre 1 y 5

        -- Insertar el registro en la tabla incidentes
        INSERT INTO incidentes (viaje_id, conductor_id, tipo_incidente)
        VALUES (@viaje_id, @conductor_id, @tipo_incidente_id);

        -- Incrementar el contador
        SET @i = @i + 1;
    END;
END;
GO

EXEC InsertarIncidentesAleatorios;
GO

SELECT * FROM incidentes;

ALTER TABLE mantenimientos
DROP COLUMN tipo_mantenimiento;
GO


-- Crear el procedimiento almacenado para insertar 500 mantenimientos con referencia a tipo_mantenimiento_id
CREATE OR ALTER PROCEDURE InsertarMantenimientosAleatorios
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @camion_id INT;
    DECLARE @inicio_mantenimiento DATETIME;
    DECLARE @termino_mantenimiento DATETIME;
    DECLARE @tipo_mantenimiento_id INT;
    DECLARE @costo_mantenimiento MONEY;
    DECLARE @tiempo_sin_servicio INT; -- Cambiado a INT para representar horas

    WHILE @i <= 500
    BEGIN
        -- Generar un camion_id aleatorio
        SET @camion_id = (SELECT FLOOR(RAND() * (5 - 1 + 1)) + 1); -- Valores entre 1 y 5

        -- Generar fechas aleatorias para el inicio y término del mantenimiento
        SET @inicio_mantenimiento = DATEADD(DAY, FLOOR(RAND() * 365), '2024-01-01'); 
        SET @termino_mantenimiento = DATEADD(HOUR, FLOOR(RAND() * 72) + 1, @inicio_mantenimiento);

        -- Generar tipo_mantenimiento_id aleatorio
        SET @tipo_mantenimiento_id = (SELECT FLOOR(RAND() * (3 - 1 + 1)) + 1); -- Valores entre 1 y 3 para tipo_mantenimiento_id

        -- Generar costo del mantenimiento aleatorio
        SET @costo_mantenimiento = ROUND((RAND() * (5000.0 - 500.0)) + 500.0, 2); 

        -- Generar tiempo sin servicio aleatorio
        SET @tiempo_sin_servicio = FLOOR(RAND() * 24) + 1; -- Valores entre 1 y 24 horas

        -- Insertar el registro en la tabla mantenimientos
        INSERT INTO mantenimientos (camion_id, inicio_mantenimiento, termino_mantenimiento, tipo_mantenimiento_id, costo_mantenimiento, tiempo_sin_servicio)
        VALUES (@camion_id, @inicio_mantenimiento, @termino_mantenimiento, @tipo_mantenimiento_id, @costo_mantenimiento, CONVERT(TIME, DATEADD(HOUR, @tiempo_sin_servicio, 0)));

        -- Incrementar el contador
        SET @i = @i + 1;
    END;
END;
GO


EXEC InsertarMantenimientosAleatorios;
GO

SELECT * FROM mantenimientos;


