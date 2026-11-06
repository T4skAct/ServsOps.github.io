CREATE DATABASE IF NOT EXISTS servsops_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE servsops_db;

CREATE TABLE IF NOT EXISTS solicitudes (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL,
  departamento ENUM('VENTAS-WEB', 'VENTAS-HARDWARE', 'HOUSING', 'SOPORTE') NOT NULL DEFAULT 'VENTAS-CLOUD',
  asunto VARCHAR(200) NOT NULL,
  mensaje TEXT NOT NULL,
  leido TINYINT(1) NOT NULL DEFAULT 0,
  ip_origen VARCHAR(45) DEFAULT NULL,
  fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_departamento (departamento),
  INDEX idx_leido (leido),
  INDEX idx_fecha (fecha_creacion)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS operadores (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  usuario VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

INSERT INTO solicitudes (nombre, email, departamento, asunto, mensaje, leido) VALUES
('Grupo Logístico Atlántico SL', 'sistemas@logistica-atlantico.es', 'VENTAS-HARDWARE', 'Solicitud de oferta: Nexus 2U Titan Dual EPYC', 'Buenos días,\n\nNecesitamos cotización formal para 2 unidades del Nexus 2U Titan Dual EPYC con ampliación a 512 GB DDR5 ECC.\n\nPreferimos entrega física en nuestro CPD de Madrid.', 0),
('FinTech Iberia', 'devops@fintechiberia.io', 'VENTAS-CLOUD', 'Despliegue de nodo: Bare-Metal EPYC', 'Hola equipo,\n\nQueremos aprovisionar un nodo Bare-Metal EPYC con Debian 12 limpio y anunciar nuestro propio rango /24 por BGP.', 1);
