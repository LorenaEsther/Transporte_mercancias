# Caso Práctico: Análisis de Eficiencia en la Operación de Transporte

Contexto: Una empresa de transporte opera una flota de camiones que realiza envíos de mercancías entre diferentes ciudades del país. La empresa está interesada en analizar la eficiencia de su operación de transporte para reducir costos, optimizar el uso de la flota, y mejorar el servicio al cliente.

## Requerimientos:

## Flota de Camiones:

Cada camión tiene un identificador único, modelo, capacidad de carga (en toneladas), fecha de adquisición, estado actual (operativo, en mantenimiento, fuera de servicio), y ubicación actual.

## Conductores:

Cada conductor tiene un identificador único, nombre, licencia de conducir, antigüedad en la empresa, y número de incidentes reportados (si los hubiera).

## Rutas de Transporte:

Cada ruta tiene un identificador único, ciudad de origen, ciudad de destino, distancia en kilómetros, tiempo estimado de viaje, y condiciones de la ruta (por ejemplo, carretera asfaltada, carretera de tierra, ruta con peaje).

## Viajes:

Cada viaje realizado tiene un identificador único, camión asignado, conductor asignado, ruta seguida, fecha de inicio del viaje, fecha de finalización, carga transportada (tipo de mercancía y peso), consumo de combustible, y cualquier incidente reportado durante el viaje.

## Mantenimiento:

Cada camión tiene un historial de mantenimiento, donde se registra la fecha del mantenimiento, tipo de servicio realizado, costo del mantenimiento, y el tiempo que el camión estuvo fuera de servicio.

## Incidentes:

Cada incidente reportado durante un viaje tiene un identificador único, tipo de incidente (accidente, avería mecánica, retraso, etc.), descripción del incidente, y medidas correctivas tomadas.

Objetivo: Crear un modelo de base de datos que permita a la empresa:

Analizar la eficiencia de los viajes en términos de tiempo, consumo de combustible, y costos.
Identificar patrones en los incidentes reportados para mejorar la seguridad y reducir los tiempos de inactividad.
Segmentar las rutas de transporte según diferentes criterios, como condiciones de la ruta, distancia, y frecuencia de incidentes.
Monitorear el estado de la flota y planificar el mantenimiento preventivo para evitar interrupciones en las operaciones.
Evaluar el desempeño de los conductores y su relación con la eficiencia de los viajes.

## Entidades Principales:

- Flota de Camiones
- Conductores
- Rutas de Transporte
- Viajes
- Mantenimiento
- Incidentes
