
USE [GD1C2024]
GO

-- Inicio Configurar reglas de nombre de objetos
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET CONCAT_NULL_YIELDS_NULL ON
GO
-- Fin Configurar reglas de nombre de objetos

-- Inicio DROP FKs
--si la primera existe, existen todas

IF OBJECT_ID ('BI_GESTIONANDING.FK_BI_ENVIO_SUCURSAL', 'F') IS NOT NULL
    --ENVIO
    ALTER TABLE BI_GESTIONANDING.BI_FACT_ENVIO 
    DROP CONSTRAINT FK_BI_ENVIO_SUCURSAL, FK_BI_ENVIO_RANGO_ETARIO, FK_BI_ENVIO_UBICACION_CLIE, FK_BI_ENVIO_TIEMPO
GO

IF OBJECT_ID ('BI_GESTIONANDING.FK_BI_PAGO_UBICACION_SUCU', 'F') IS NOT NULL
    --PAGO
    ALTER TABLE BI_GESTIONANDING.BI_FACT_PAGO 
    DROP CONSTRAINT FK_BI_PAGO_UBICACION_SUCU, FK_BI_PAGO_TIEMPO, FK_BI_PAGO_RANGO_ETARIO, FK_BI_PAGO_CUOTAS, FK_BI_PAGO_MEDIO_PAGO
GO

IF OBJECT_ID ('BI_GESTIONANDING.FK_BI_VENTAS_TIEMPO', 'F') IS NOT NULL
    --VENTAS
    ALTER TABLE BI_GESTIONANDING.BI_FACT_VENTAS 
    DROP CONSTRAINT FK_BI_VENTAS_TIEMPO, FK_BI_VENTAS_UBICACION_SUCU, FK_BI_VENTAS_TURNO, FK_BI_VENTAS_TIPO_CAJA, FK_BI_VENTAS_RANGO_ETARIO
GO

IF OBJECT_ID ('BI_GESTIONANDING.FK_BI_DESCUENTO_TIEMPO', 'F') IS NOT NULL
    --DESCUENTO
    ALTER TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO 
    DROP CONSTRAINT FK_BI_DESCUENTO_TIEMPO, FK_BI_DESCUENTO_MEDIO_PAGO, FK_BI_DESCUENTO_CATE_PROD
GO

-- Fin DROP FKs

-- Inicio DROP Tables

--crear drop de todas las tablas
IF OBJECT_ID('BI_GESTIONANDING.BI_FACT_DESCUENTO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_FACT_VENTAS', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_FACT_VENTAS
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_FACT_PAGO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_FACT_PAGO
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_FACT_ENVIO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_FACT_ENVIO
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_TIEMPO
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_UBICACION_SUCU', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_UBICACION_SUCU
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_MEDIO_PAGO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_MEDIO_PAGO
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_RANGO_ETARIO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_RANGO_ETARIO
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_CATE_PROD', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_CATE_PROD
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_TIPO_CAJA', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_TIPO_CAJA
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_TURNO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_TURNO
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_CUOTAS', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_CUOTAS
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_UBICACION_CLIE', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_UBICACION_CLIE
GO

IF OBJECT_ID('BI_GESTIONANDING.DIM_SUCURSAL', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.DIM_SUCURSAL
GO

-- Fin DROP Tables

-- Inicio DROP Procedures
-- Fin DROP Procedures

-- Inicio DROP Functions

IF OBJECT_ID('BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE', 'FN') IS NOT NULL
    DROP FUNCTION BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE
GO

-- Fin DROP Functions

-- Inicio DROP Procedures
-- Fin DROP Procedures

-- Inicio DROP View
-- Fin DROP Views

-- Inicio crear schema de la aplicación
IF EXISTS (SELECT SCHEMA_NAME
           FROM INFORMATION_SCHEMA.SCHEMATA
           WHERE SCHEMA_NAME = 'BI_GESTIONANDING')
    DROP SCHEMA BI_GESTIONANDING
GO

CREATE SCHEMA BI_GESTIONANDING
GO
-- Fin crear schema de la aplicación

-- Inicio crear tablas
CREATE TABLE BI_GESTIONANDING.DIM_SUCURSAL
(
    sucursal_id     INTEGER IDENTITY (1, 1) PRIMARY KEY,
    nombre          VARCHAR(30)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_UBICACION_CLIE
(
    ubicacion_clie_id       INTEGER IDENTITY (1, 1) PRIMARY KEY,
    provincia               VARCHAR(50),
    localidad               VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_CUOTAS
(
    cuotas_id     INTEGER PRIMARY KEY
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_TURNO
(
    turno_id          INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion       VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_TIPO_CAJA
(
    tipo_caja_id    INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion     VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_CATE_PROD
(
    cate_prod_id        INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion         VARCHAR(50) 
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_RANGO_ETARIO
(
    rango_etario_id     INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion         VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_MEDIO_PAGO
(
    medio_pago_id       INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion         VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_UBICACION_SUCU
(
    ubicacion_sucu_id   INTEGER IDENTITY (1, 1) PRIMARY KEY,
    provincia           VARCHAR(50),
    localidad           VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_TIEMPO
(
    tiempo_id           INTEGER IDENTITY (1, 1) PRIMARY KEY,
    anio                INTEGER,
    cuatrimestre        INTEGER,
    mes                 INTEGER
)
GO


CREATE TABLE BI_GESTIONANDING.BI_FACT_ENVIO
(
    envio_sucursal          INTEGER NOT NULL,
    envio_rango_etario      INTEGER NOT NULL,
    envio_ubi_clie          INTEGER NOT NULL,
    envio_tiempo            INTEGER NOT NULL,
    cant_envios             INTEGER,
    cant_envios_en_horario  INTEGER,
    sum_costo_de_envio      DECIMAL(12, 2),
    PRIMARY KEY (envio_sucursal, envio_rango_etario, envio_ubi_clie, envio_tiempo)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_PAGO
(
    pago_ubi_sucu           INTEGER NOT NULL,
    pago_tiempo             INTEGER NOT NULL,
    pago_rango_etario       INTEGER NOT NULL,
    pago_cuotas             INTEGER NOT NULL,
    pago_medio_pago         INTEGER NOT NULL,
    sum_importe             DECIMAL(12, 2),
    PRIMARY KEY (pago_ubi_sucu, pago_tiempo, pago_rango_etario, pago_cuotas, pago_medio_pago)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_VENTAS
(
    venta_tiempo            INTEGER NOT NULL,
    venta_ubi_sucu          INTEGER NOT NULL,
    venta_turno             INTEGER NOT NULL,
    venta_tipo_caja         INTEGER NOT NULL,
    venta_rango_etario      INTEGER NOT NULL,
    cant_ventas             INTEGER,
    sum_articulo            INTEGER,
    sum_total_ticket        DECIMAL(12, 2),
    PRIMARY KEY (venta_tiempo, venta_ubi_sucu, venta_turno, venta_tipo_caja, venta_rango_etario)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO
(
    desc_tiempo             INTEGER NOT NULL,
    desc_medio_pago         INTEGER NOT NULL,
    desc_categoria          INTEGER NOT NULL,
    sum_total_ticket        DECIMAL(12, 2),
    sum_promo_producto      DECIMAL(12, 2),
    sum_descuento_mp        DECIMAL(12, 2),
    PRIMARY KEY (desc_tiempo, desc_medio_pago, desc_categoria)
)
GO

-- Fin crear tablas

-- Inicio crear Functions

CREATE FUNCTION BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(@fecha DATETIME)
    RETURNS NUMERIC(18, 0)
AS
BEGIN
    RETURN CEILING(MONTH(@fecha) / 4.0);
END
GO
-- Fin crear Functions

-- Inicio crear FKs

ALTER TABLE BI_GESTIONANDING.BI_FACT_ENVIO 
    ADD CONSTRAINT FK_BI_ENVIO_SUCURSAL FOREIGN KEY (envio_sucursal) REFERENCES BI_GESTIONANDING.DIM_SUCURSAL(sucursal_id),
        CONSTRAINT FK_BI_ENVIO_RANGO_ETARIO FOREIGN KEY (envio_rango_etario) REFERENCES BI_GESTIONANDING.DIM_RANGO_ETARIO(rango_etario_id),
        CONSTRAINT FK_BI_ENVIO_UBICACION_CLIE FOREIGN KEY (envio_ubi_clie) REFERENCES BI_GESTIONANDING.DIM_UBICACION_CLIE(ubicacion_clie_id),
        CONSTRAINT FK_BI_ENVIO_TIEMPO FOREIGN KEY (envio_tiempo) REFERENCES BI_GESTIONANDING.DIM_TIEMPO(tiempo_id)
GO

ALTER TABLE BI_GESTIONANDING.BI_FACT_PAGO 
    ADD CONSTRAINT FK_BI_PAGO_UBICACION_SUCU FOREIGN KEY (pago_ubi_sucu) REFERENCES BI_GESTIONANDING.DIM_UBICACION_SUCU(ubicacion_sucu_id),
        CONSTRAINT FK_BI_PAGO_TIEMPO FOREIGN KEY (pago_tiempo) REFERENCES BI_GESTIONANDING.DIM_TIEMPO(tiempo_id),
        CONSTRAINT FK_BI_PAGO_RANGO_ETARIO FOREIGN KEY (pago_rango_etario) REFERENCES BI_GESTIONANDING.DIM_RANGO_ETARIO(rango_etario_id),
        CONSTRAINT FK_BI_PAGO_CUOTAS FOREIGN KEY (pago_cuotas) REFERENCES BI_GESTIONANDING.DIM_CUOTAS(cuotas_id),
        CONSTRAINT FK_BI_PAGO_MEDIO_PAGO FOREIGN KEY (pago_medio_pago) REFERENCES BI_GESTIONANDING.DIM_MEDIO_PAGO(medio_pago_id)
GO

ALTER TABLE BI_GESTIONANDING.BI_FACT_VENTAS 
    ADD CONSTRAINT FK_BI_VENTAS_TIEMPO FOREIGN KEY (venta_tiempo) REFERENCES BI_GESTIONANDING.DIM_TIEMPO(tiempo_id),
        CONSTRAINT FK_BI_VENTAS_UBICACION_SUCU FOREIGN KEY (venta_ubi_sucu) REFERENCES BI_GESTIONANDING.DIM_UBICACION_SUCU(ubicacion_sucu_id),
        CONSTRAINT FK_BI_VENTAS_TURNO FOREIGN KEY (venta_turno) REFERENCES BI_GESTIONANDING.DIM_TURNO(turno_id),
        CONSTRAINT FK_BI_VENTAS_TIPO_CAJA FOREIGN KEY (venta_tipo_caja) REFERENCES BI_GESTIONANDING.DIM_TIPO_CAJA(tipo_caja_id),
        CONSTRAINT FK_BI_VENTAS_RANGO_ETARIO FOREIGN KEY (venta_rango_etario) REFERENCES BI_GESTIONANDING.DIM_RANGO_ETARIO(rango_etario_id)
GO

ALTER TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO 
    ADD CONSTRAINT FK_BI_DESCUENTO_TIEMPO FOREIGN KEY (desc_tiempo) REFERENCES BI_GESTIONANDING.DIM_TIEMPO(tiempo_id),
        CONSTRAINT FK_BI_DESCUENTO_MEDIO_PAGO FOREIGN KEY (desc_medio_pago) REFERENCES BI_GESTIONANDING.DIM_MEDIO_PAGO(medio_pago_id),
        CONSTRAINT FK_BI_DESCUENTO_CATE_PROD FOREIGN KEY (desc_categoria) REFERENCES BI_GESTIONANDING.DIM_CATE_PROD(cate_prod_id)
GO

-- Fin crear FKs

-- Inicio crear Procedures

-- migrar DIM_SUCURSAL
INSERT INTO BI_GESTIONANDING.DIM_SUCURSAL (nombre)
    SELECT distinct SUCURSAL_NOMBRE
    FROM GESTIONANDING.SUCURSAL
GO

-- migrar DIM_UBICACION_CLIE
INSERT INTO BI_GESTIONANDING.DIM_UBICACION_CLIE (provincia, localidad)
    SELECT distinct DIRE_DOMICILIO, DIRE_LOCALIDAD
    FROM GESTIONANDING.CLIENTE
    JOIN GESTIONANDING.DIRECCION ON DIRE_ID = CLIENTE_DIRECCION
GO

-- migrar DIM_CUOTAS
INSERT INTO BI_GESTIONANDING.DIM_CUOTAS (cuotas_id)
    SELECT distinct DETPAG_CUOTAS
    FROM GESTIONANDING.DETALLE_PAGO
GO

-- migrar DIM_TURNO
INSERT INTO BI_GESTIONANDING.DIM_TURNO (descripcion)
    VALUES
        ('08:00 - 12:00'),
        ('12:00 - 16:00'),
        ('16:00 - 20:00')
GO

-- migrar DIM_TIPO_CAJA
INSERT INTO BI_GESTIONANDING.DIM_TIPO_CAJA (descripcion)
    SELECT CAJA_TIPO_DESCRIPCION
    FROM GESTIONANDING.CAJA_TIPO
GO

-- migrar DIM_CATE_PROD
INSERT INTO BI_GESTIONANDING.DIM_CATE_PROD (descripcion)
    SELECT distinct CAT_DESCR
    FROM GESTIONANDING.CATEGORIA
GO

-- migrar DIM_RANGO_ETARIO
INSERT INTO BI_GESTIONANDING.DIM_RANGO_ETARIO (descripcion)
    VALUES
        ('<25'),
        ('25-35'),
        ('35-50'),
        ('>50')
GO

-- migrar DIM_MEDIO_PAGO
INSERT INTO BI_GESTIONANDING.DIM_MEDIO_PAGO (descripcion)
    SELECT distinct MP_DESCRIPCION
    FROM GESTIONANDING.MEDIO_PAGO
GO

-- migrar DIM_UBICACION_SUCU
INSERT INTO BI_GESTIONANDING.DIM_UBICACION_SUCU (provincia, localidad)
    SELECT distinct DIRE_DOMICILIO, DIRE_LOCALIDAD
    FROM GESTIONANDING.SUCURSAL
    JOIN GESTIONANDING.DIRECCION ON DIRE_ID = SUCURSAL_DIRECCION
GO

-- migrar DIM_TIEMPO
--todas las facturas son del 2024 en adelante.
INSERT INTO BI_GESTIONANDING.DIM_TIEMPO (anio, cuatrimestre, mes)
VALUES (2024, 01, 01),
       (2024, 01, 02),
       (2024, 01, 03),
       (2024, 01, 04),
       (2024, 02, 05),
       (2024, 02, 06),
       (2024, 02, 07),
       (2024, 02, 08),
       (2024, 03, 09),
       (2024, 03, 10),
       (2024, 03, 11),
       (2024, 03, 12),
       (2025, 01, 01),
       (2025, 01, 02),
       (2025, 01, 03),
       (2025, 01, 04),
       (2025, 02, 05),
       (2025, 02, 06),
       (2025, 02, 07),
       (2025, 02, 08),
       (2025, 03, 09),
       (2025, 03, 10),
       (2025, 03, 11),
       (2025, 03, 12),
       (2026, 01, 01),
       (2026, 01, 02),
       (2026, 01, 03),
       (2026, 01, 04),
       (2026, 02, 05),
       (2026, 02, 06),
       (2026, 02, 07),
       (2026, 02, 08),
       (2026, 03, 09),
       (2026, 03, 10),
       (2026, 03, 11),
       (2026, 03, 12),
       (2027, 01, 01),
       (2027, 01, 02),
       (2027, 01, 03),
       (2027, 01, 04),
       (2027, 02, 05),
       (2027, 02, 06),
       (2027, 02, 07),
       (2027, 02, 08),
       (2027, 03, 09),
       (2027, 03, 10),
       (2027, 03, 11),
       (2027, 03, 12),
       (2028, 01, 01),
       (2028, 01, 02),
       (2028, 01, 03),
       (2028, 01, 04),
       (2028, 02, 05),
       (2028, 02, 06),
       (2028, 02, 07),
       (2028, 02, 08),
       (2028, 03, 09),
       (2028, 03, 10),
       (2028, 03, 11),
       (2028, 03, 12),
       (2029, 01, 01),
       (2029, 01, 02),
       (2029, 01, 03),
       (2029, 01, 04),
       (2029, 02, 05),
       (2029, 02, 06),
       (2029, 02, 07),
       (2029, 02, 08),
       (2029, 03, 09),
       (2029, 03, 10),
       (2029, 03, 11),
       (2029, 03, 12),
       (2030, 01, 01),
       (2030, 01, 02)
GO

CREATE PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_ENVIO
AS
BEGIN
    INSERT INTO BI_GESTIONANDING.BI_FACT_ENVIO (
        envio_sucursal, 
        envio_rango_etario, 
        envio_ubi_clie, 
        envio_tiempo, 
        cant_envios, 
        cant_envios_en_horario, 
        sum_costo_de_envio
        )
        SELECT 
        FROM 
END
GO

-- Fin crear Procedures

-- Ejecucion de Procedures

-- Fin ejecucion de Procedures

BEGIN TRANSACTION
GO

-- Creacion de Views
/***************
    VISTA 01
****************/

/***************
    VISTA 02
****************/

/***************
    VISTA 03
****************/

/***************
    VISTA 04
****************/

/***************
    VISTA 05
****************/

/***************
    VISTA 06
****************/

/***************
    VISTA 07
****************/

/***************
    VISTA 08
****************/

/***************
    VISTA 09
****************/

/***************
    VISTA 10
****************/

/***************
    VISTA 11
****************/

/***************
    VISTA 12
****************/

-- Fin crear Views

COMMIT
GO