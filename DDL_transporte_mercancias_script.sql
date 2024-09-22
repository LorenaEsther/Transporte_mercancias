CREATE DATABASE transporte_mercancias;
GO

USE transporte_mercancias;
GO

-- Crear conductores
CREATE TABLE conductores (
id INT PRIMARY KEY IDENTITY(1,1),
numero_documento VARCHAR(8) UNIQUE NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellido_paterno VARCHAR(255) NOT NULL,
apellido_materno VARCHAR(255) NOT NULL,
licencia_conducir VARCHAR(15) UNIQUE NOT NULL,
fecha_contratacion DATE NOT NULL,
antiguedad INT NOT NULL,
numero_incidentes INT NOT NULL,
);
GO


-- Crear camiones
CREATE TABLE camiones (
id INT PRIMARY KEY IDENTITY(1,1),
placa_vehicular VARCHAR(8) UNIQUE NOT NULL,
capacidad_ton DECIMAL NOT NULL,
fecha_adquisicion DATE NOT NULL,
estado_actual VARCHAR(15) NOT NULL,
ubicacion_actual VARCHAR(15) NOT NULL,
);
GO

-- Crear rutas
CREATE TABLE rutas (
id INT PRIMARY KEY IDENTITY(1,1),
ciudad_origen VARCHAR(15) NOT NULL,
ciudad_destino VARCHAR(15) NOT NULL,
distancia_km INT NOT NULL,
tiempo_aproximado TIME NOT NULL,
condicion_ruta VARCHAR(15) NOT NULL,
);
GO

-- Crear la tabla tipo_carga
CREATE TABLE tipo_carga (
    id INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(50) NOT NULL
);
GO


-- Crear la tabla viajes con la referencia a tipo_carga
CREATE TABLE viajes (
    id INT PRIMARY KEY IDENTITY(1,1),
    camion_id INT NOT NULL,
    conductor_id INT NOT NULL,
    ruta_id INT NOT NULL,
    fecha_salida DATETIME NOT NULL,
    fecha_llegada DATETIME NOT NULL,
    tipo_carga_id INT NOT NULL,
    consumo_combustible DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (camion_id) REFERENCES camiones(id),
    FOREIGN KEY (conductor_id) REFERENCES conductores(id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (tipo_carga_id) REFERENCES tipo_carga(id)
);
GO


-- Crear mantenimientos
CREATE TABLE mantenimientos (
id INT PRIMARY KEY IDENTITY(1,1),
camion_id INT NOT NULL,
inicio_mantenimiento DATETIME NOT NULL,
termino_mantenimiento DATETIME NOT NULL,
tipo_mantenimiento VARCHAR(15) NOT NULL,
costo_mantenimiento MONEY NOT NULL,
tiempo_sin_servicio TIME NOT NULL,
FOREIGN KEY (camion_id) REFERENCES camiones(id)
);
GO

-- Crear tipo_incidentes
CREATE TABLE tipo_incidentes (
id INT PRIMARY KEY IDENTITY(1,1),
tipo VARCHAR (20) NOT NULL,
descripcion VARCHAR (100) NOT NULL
);
GO

-- Crear incidentes
CREATE TABLE incidentes (
id INT PRIMARY KEY IDENTITY(1,1),
viaje_id INT NOT NULL,
conductor_id INT NOT NULL,
tipo_incidente INT NOT NULL,
FOREIGN KEY (viaje_id) REFERENCES viajes(id),
FOREIGN KEY (conductor_id) REFERENCES conductores(id),
FOREIGN KEY (tipo_incidente) REFERENCES tipo_incidentes (id)
);
GO

-- Crear la tabla tipo_mantenimiento
CREATE TABLE tipo_mantenimiento (
    id INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(50) NOT NULL
);
GO



