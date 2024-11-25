Backend

1. Endpoints Implementados: Se crearon un total de cuatro endpoints GET, que permiten extraer información desde el servidor:

GET /api/entidad: Retorna la lista completa de registros.

GET /api/entidad/{id}: Retorna los detalles de un registro específico identificado por su ID.

GET /api/entidad/filtro?param=value: Permite obtener registros filtrados según parámetros específicos.

GET /api/entidad/estadisticas: Genera información estadística sobre los registros.


Estos endpoints fueron desarrollados utilizando [framework/backend elegido, como Node.js con Express]. Todos los endpoints están protegidos con validaciones de datos y manejo adecuado de errores.


2. Servicio Backend: Se creó un servicio central que se comunica con la base de datos y abstrae la lógica de negocio, permitiendo una fácil extensión y mantenimiento. Este servicio fue diseñado para:

Gestionar la conexión con la base de datos.

Realizar consultas optimizadas.

Procesar la lógica de negocio requerida para los endpoints.



3. Base de Datos:

La base de datos utilizada fue [MySQL/PostgreSQL], y las tablas necesarias fueron configuradas con relaciones básicas.

Se implementaron migraciones para estructurar las tablas y facilitar futuras actualizaciones del esquema.





---

Frontend

1. Tecnología: El frontend fue desarrollado con JavaScript puro, sin el uso de frameworks adicionales, para mantener la solución ligera y fácil de integrar.


2. Consumo de API:

Se creó un servicio en JavaScript para consumir los datos desde el backend utilizando la API Fetch.
