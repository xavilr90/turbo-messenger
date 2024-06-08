CREATE DATABASE turbo_messenger
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE template0;

\c turbo_messenger

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    identificacion VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    ciudad VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE sucursales (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20)
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    login VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    direccion TEXT,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE mensajeros (
    id SERIAL PRIMARY KEY,
    identificacion VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE servicios (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    fecha_solicitud TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    origen TEXT,
    destino TEXT,
    ciudad VARCHAR(50),
    descripcion TEXT,
    tipo_transporte VARCHAR(50),
    numero_paquetes INTEGER,
    estado VARCHAR(50) NOT NULL DEFAULT 'solicitado'
);

CREATE TABLE estados_servicio (
    id SERIAL PRIMARY KEY,
    servicio_id INTEGER REFERENCES servicios(id),
    estado VARCHAR(50),
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    foto BYTEA
);

CREATE TABLE cliente_mensajero (
    cliente_id INTEGER REFERENCES clientes(id),
    mensajero_id INTEGER REFERENCES mensajeros(id),
    PRIMARY KEY (cliente_id, mensajero_id)
);