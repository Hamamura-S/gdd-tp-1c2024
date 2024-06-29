
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
    DROP CONSTRAINT FK_BI_DESCUENTO_TIEMPO, FK_BI_DESCUENTO_CATE_PROD
GO

-- Fin DROP FKs

-- Inicio DROP Tables

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

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_TIEMPO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_TIEMPO
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_UBICACION_SUCU', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_UBICACION_SUCU
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_MEDIO_PAGO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_MEDIO_PAGO
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_RANGO_ETARIO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_RANGO_ETARIO
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_CATE_PROD', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_CATE_PROD
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_TIPO_CAJA', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_TIPO_CAJA
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_TURNO', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_TURNO
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_CUOTAS', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_CUOTAS
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_UBICACION_CLIE', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_UBICACION_CLIE
GO

IF OBJECT_ID('BI_GESTIONANDING.BI_DIM_SUCURSAL', 'U') IS NOT NULL
    DROP TABLE BI_GESTIONANDING.BI_DIM_SUCURSAL
GO

-- Fin DROP Tables

-- Inicio DROP Procedures
IF OBJECT_ID('BI_GESTIONANDING.MIGRAR_BI_FACT_ENVIO') IS NOT NULL
    DROP PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_ENVIO
GO

IF OBJECT_ID('BI_GESTIONANDING.MIGRAR_BI_FACT_PAGO') IS NOT NULL
    DROP PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_PAGO
GO

IF OBJECT_ID('BI_GESTIONANDING.MIGRAR_BI_FACT_DESCUENTO') IS NOT NULL
    DROP PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_DESCUENTO
GO

IF OBJECT_ID('BI_GESTIONANDING.MIGRAR_BI_FACT_VENTAS') IS NOT NULL
    DROP PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_VENTAS
GO
-- Fin DROP Procedures

-- Inicio DROP Functions

IF OBJECT_ID('BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE', 'FN') IS NOT NULL
    DROP FUNCTION BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE
GO

IF OBJECT_ID('BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO', 'FN') IS NOT NULL
    DROP FUNCTION BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO
GO

IF OBJECT_ID('BI_GESTIONANDING.FX_OBTENER_TURNO', 'FN') IS NOT NULL
    DROP FUNCTION BI_GESTIONANDING.FX_OBTENER_TURNO
GO

-- Fin DROP Functions

-- Inicio DROP Views

IF OBJECT_ID('BI_GESTIONANDING.TICKET_PROMEDIO_MENSUAL', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.TICKET_PROMEDIO_MENSUAL
GO

IF OBJECT_ID('BI_GESTIONANDING.CANTIDAD_UNIDADES_PROMEDIO', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.CANTIDAD_UNIDADES_PROMEDIO
GO

IF OBJECT_ID('BI_GESTIONANDING.PORCENTAJE_ANUAL_VENTAS', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.PORCENTAJE_ANUAL_VENTAS
GO

IF OBJECT_ID('BI_GESTIONANDING.VENTAS_REGISTRADAS_POR_TURNO', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.VENTAS_REGISTRADAS_POR_TURNO
GO

IF OBJECT_ID('BI_GESTIONANDING.PORCENTAJE_DE_DESCUENTO', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.PORCENTAJE_DE_DESCUENTO
GO

IF OBJECT_ID('BI_GESTIONANDING.TRES_CATEGORIAS_CON_MAYOR_DESCUENTO', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.TRES_CATEGORIAS_CON_MAYOR_DESCUENTO
GO

IF OBJECT_ID('BI_GESTIONANDING.CINCO_LOCALIDADES_CON_MAYOR_COSTO_ENVIO', 'V') IS NOT NULL
    DROP VIEW BI_GESTIONANDING.CINCO_LOCALIDADES_CON_MAYOR_COSTO_ENVIO
GO



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
CREATE TABLE BI_GESTIONANDING.BI_DIM_SUCURSAL
(
    sucursal_id     INTEGER PRIMARY KEY,
    nombre          VARCHAR(30)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_UBICACION_CLIE
(
    ubicacion_clie_id          INTEGER IDENTITY (1, 1) PRIMARY KEY,
    provincia_cd               SMALLINT,
    provincia_tx               VARCHAR(50),
    localidad_cd               SMALLINT,
    localidad_tx               VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_CUOTAS
(
    cuotas_id     INTEGER PRIMARY KEY
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_TURNO
(
    turno_id          INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion       VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_TIPO_CAJA
(
    tipo_caja_id    INTEGER PRIMARY KEY,
    descripcion     VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_CATE_PROD
(
    cate_prod_id        INTEGER PRIMARY KEY,
    descripcion         VARCHAR(50) 
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_RANGO_ETARIO
(
    rango_etario_id     INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion         VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_MEDIO_PAGO
(
    medio_pago_id       INTEGER PRIMARY KEY,
    descripcion         VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_UBICACION_SUCU
(
    ubicacion_sucu_id      INTEGER IDENTITY (1, 1) PRIMARY KEY,
    provincia_cd           SMALLINT,
    provincia_tx           VARCHAR(50),
    localidad_cd           SMALLINT,
    localidad_tx           VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_DIM_TIEMPO
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
    sum_descuentos          DECIMAL(12, 2),
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
    sum_subtotal_productos  DECIMAL(12, 2),
    sum_promociones         DECIMAL(12, 2),
    sum_descuentos          DECIMAL(12, 2),
    PRIMARY KEY (venta_tiempo, venta_ubi_sucu, venta_turno, venta_tipo_caja, venta_rango_etario)
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO
(
    desc_tiempo             INTEGER NOT NULL,
    desc_categoria          INTEGER NOT NULL,
    sum_promo_producto      DECIMAL(12, 2),
    PRIMARY KEY (desc_tiempo, desc_categoria)
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

CREATE FUNCTION BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO(@edad NUMERIC(18, 0))
    RETURNS NUMERIC(18, 0)
BEGIN
    IF @edad IS NULL RETURN 5
    DECLARE @rangoId NUMERIC(18, 0)
    IF @edad < 25
        SET @rangoId = 1
    IF @edad BETWEEN 25 AND 34
        SET @rangoId = 2
    IF @edad BETWEEN 35 AND 49
        SET @rangoId = 3
    IF @edad >= 50
        SET @rangoId = 4
    RETURN @rangoId
END
GO

CREATE FUNCTION BI_GESTIONANDING.FX_OBTENER_TURNO(@hora DATETIME)
    RETURNS NUMERIC(18, 0)
AS
BEGIN
    DECLARE @turnoId NUMERIC(18, 0)
    DECLARE @horaOnly TIME = CAST(@hora AS TIME)
    -- Asignar valores a turnoId basado en la hora
    IF @horaOnly BETWEEN '08:00:00' AND '11:59:59'
        SET @turnoId = 1
    ELSE IF @horaOnly BETWEEN '12:00:00' AND '15:59:59'
        SET @turnoId = 2
    ELSE IF @horaOnly BETWEEN '16:00:00' AND '20:00:00'
        SET @turnoId = 3
    ELSE IF @horaOnly < '07:59:59' OR @horaOnly > '20:00:00'
        SET @turnoId = 4
    ELSE
        SET @turnoId = 5
    RETURN @turnoId
END
GO


-- Fin crear Functions

-- Inicio crear FKs

ALTER TABLE BI_GESTIONANDING.BI_FACT_ENVIO 
    ADD CONSTRAINT FK_BI_ENVIO_SUCURSAL FOREIGN KEY (envio_sucursal) REFERENCES BI_GESTIONANDING.BI_DIM_SUCURSAL(sucursal_id),
        CONSTRAINT FK_BI_ENVIO_RANGO_ETARIO FOREIGN KEY (envio_rango_etario) REFERENCES BI_GESTIONANDING.BI_DIM_RANGO_ETARIO(rango_etario_id),
        CONSTRAINT FK_BI_ENVIO_UBICACION_CLIE FOREIGN KEY (envio_ubi_clie) REFERENCES BI_GESTIONANDING.BI_DIM_UBICACION_CLIE(ubicacion_clie_id),
        CONSTRAINT FK_BI_ENVIO_TIEMPO FOREIGN KEY (envio_tiempo) REFERENCES BI_GESTIONANDING.BI_DIM_TIEMPO(tiempo_id)
GO

ALTER TABLE BI_GESTIONANDING.BI_FACT_PAGO 
    ADD CONSTRAINT FK_BI_PAGO_UBICACION_SUCU FOREIGN KEY (pago_ubi_sucu) REFERENCES BI_GESTIONANDING.BI_DIM_UBICACION_SUCU(ubicacion_sucu_id),
        CONSTRAINT FK_BI_PAGO_TIEMPO FOREIGN KEY (pago_tiempo) REFERENCES BI_GESTIONANDING.BI_DIM_TIEMPO(tiempo_id),
        CONSTRAINT FK_BI_PAGO_RANGO_ETARIO FOREIGN KEY (pago_rango_etario) REFERENCES BI_GESTIONANDING.BI_DIM_RANGO_ETARIO(rango_etario_id),
        CONSTRAINT FK_BI_PAGO_CUOTAS FOREIGN KEY (pago_cuotas) REFERENCES BI_GESTIONANDING.BI_DIM_CUOTAS(cuotas_id),
        CONSTRAINT FK_BI_PAGO_MEDIO_PAGO FOREIGN KEY (pago_medio_pago) REFERENCES BI_GESTIONANDING.BI_DIM_MEDIO_PAGO(medio_pago_id)
GO

ALTER TABLE BI_GESTIONANDING.BI_FACT_VENTAS 
    ADD CONSTRAINT FK_BI_VENTAS_TIEMPO FOREIGN KEY (venta_tiempo) REFERENCES BI_GESTIONANDING.BI_DIM_TIEMPO(tiempo_id),
        CONSTRAINT FK_BI_VENTAS_UBICACION_SUCU FOREIGN KEY (venta_ubi_sucu) REFERENCES BI_GESTIONANDING.BI_DIM_UBICACION_SUCU(ubicacion_sucu_id),
        CONSTRAINT FK_BI_VENTAS_TURNO FOREIGN KEY (venta_turno) REFERENCES BI_GESTIONANDING.BI_DIM_TURNO(turno_id),
        CONSTRAINT FK_BI_VENTAS_TIPO_CAJA FOREIGN KEY (venta_tipo_caja) REFERENCES BI_GESTIONANDING.BI_DIM_TIPO_CAJA(tipo_caja_id),
        CONSTRAINT FK_BI_VENTAS_RANGO_ETARIO FOREIGN KEY (venta_rango_etario) REFERENCES BI_GESTIONANDING.BI_DIM_RANGO_ETARIO(rango_etario_id)
GO

ALTER TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO 
    ADD CONSTRAINT FK_BI_DESCUENTO_TIEMPO FOREIGN KEY (desc_tiempo) REFERENCES BI_GESTIONANDING.BI_DIM_TIEMPO(tiempo_id),
        CONSTRAINT FK_BI_DESCUENTO_CATE_PROD FOREIGN KEY (desc_categoria) REFERENCES BI_GESTIONANDING.BI_DIM_CATE_PROD(cate_prod_id)
GO

-- Fin crear FKs

-- Inicio crear Procedures

-- migrar BI_DIM_SUCURSAL
INSERT INTO BI_GESTIONANDING.BI_DIM_SUCURSAL (sucursal_id , nombre)
    SELECT sucursal_id , SUCURSAL_NOMBRE
    FROM GESTIONANDING.SUCURSAL
GO

-- migrar BI_DIM_UBICACION_CLIE
INSERT INTO BI_GESTIONANDING.BI_DIM_UBICACION_CLIE (provincia_cd, provincia_tx, localidad_cd, localidad_tx)
    SELECT distinct  PROV_ID, PROV_NOMBRE, LOCALIDAD_ID, LOCALIDAD_NOMBRE
    FROM GESTIONANDING.CLIENTE
    JOIN GESTIONANDING.DIRECCION ON DIRE_ID = CLIENTE_DIRECCION
    JOIN GESTIONANDING.LOCALIDAD ON LOCALIDAD_ID=DIRE_LOCALIDAD
    JOIN GESTIONANDING.PROVINCIA ON PROV_ID=LOCALIDAD_PROVINCIA
GO

-- migrar BI_DIM_CUOTAS
INSERT INTO BI_GESTIONANDING.BI_DIM_CUOTAS (cuotas_id)
    SELECT distinct DETPAG_CUOTAS
    FROM GESTIONANDING.DETALLE_PAGO
GO
INSERT INTO BI_GESTIONANDING.BI_DIM_CUOTAS (cuotas_id) VALUES (0)
GO

-- migrar BI_DIM_TURNO
INSERT INTO BI_GESTIONANDING.BI_DIM_TURNO (descripcion)
    VALUES
        ('08:00 - 12:00'),
        ('12:00 - 16:00'),
        ('16:00 - 20:00'),
        ('20:00 - 08:00'),
        ('N/A')
GO

-- migrar BI_DIM_TIPO_CAJA
INSERT INTO BI_GESTIONANDING.BI_DIM_TIPO_CAJA (tipo_caja_id, descripcion)
    SELECT CAJA_TIPO_ID, CAJA_TIPO_DESCRIPCION
    FROM GESTIONANDING.CAJA_TIPO
GO

-- migrar BI_DIM_CATE_PROD
INSERT INTO BI_GESTIONANDING.BI_DIM_CATE_PROD (cate_prod_id, descripcion)
    SELECT CAT_ID, CAT_DESCR
    FROM GESTIONANDING.CATEGORIA
GO

-- migrar BI_DIM_RANGO_ETARIO
INSERT INTO BI_GESTIONANDING.BI_DIM_RANGO_ETARIO (descripcion)
    VALUES
        ('<25'),
        ('25-35'),
        ('35-50'),
        ('>50'),
        ('N/A')
GO

-- migrar BI_DIM_MEDIO_PAGO
INSERT INTO BI_GESTIONANDING.BI_DIM_MEDIO_PAGO (medio_pago_id, descripcion)
    SELECT MP_ID, MP_DESCRIPCION
    FROM GESTIONANDING.MEDIO_PAGO
GO

-- migrar BI_DIM_UBICACION_SUCU
INSERT INTO BI_GESTIONANDING.BI_DIM_UBICACION_SUCU (provincia_cd, provincia_tx, localidad_cd, localidad_tx)
    SELECT distinct PROV_ID, PROV_NOMBRE, LOCALIDAD_ID, LOCALIDAD_NOMBRE
    FROM GESTIONANDING.SUCURSAL
    JOIN GESTIONANDING.DIRECCION ON DIRE_ID = SUCURSAL_DIRECCION
    JOIN GESTIONANDING.LOCALIDAD ON LOCALIDAD_ID=DIRE_LOCALIDAD
    JOIN GESTIONANDING.PROVINCIA ON PROV_ID=LOCALIDAD_PROVINCIA
GO

-- migrar BI_DIM_TIEMPO
--todas las facturas son del 2024 en adelante.
INSERT INTO BI_GESTIONANDING.BI_DIM_TIEMPO (anio, cuatrimestre, mes)
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
    -- dimensiones
        s.sucursal_id,
        dimre.rango_etario_id,
        dimuc.ubicacion_clie_id,
        dimt.tiempo_id,
    -- calculables
        COUNT(*) AS cant_envios,
        SUM(
            CASE 
                WHEN
					ENVIO_FECHA_PROGRAMADA = datetrunc(day, ENVIO_FECHA_ENTREGA) AND
                    DATEPART(HOUR, ENVIO_FECHA_ENTREGA) BETWEEN ENVIO_HORA_INICIO AND ENVIO_HORA_FIN THEN 1 
                ELSE 0 
            END
            ) AS cant_envios_en_horario,
        SUM(ENVIO_COSTO) AS sum_costo_de_envio
    FROM GESTIONANDING.ENVIO
    JOIN GESTIONANDING.CLIENTE ON CLIENTE_ID = ENVIO_CLIENTE
    JOIN GESTIONANDING.DIRECCION ON DIRE_ID = CLIENTE_DIRECCION
    JOIN GESTIONANDING.LOCALIDAD ON LOCALIDAD_ID = DIRE_LOCALIDAD
    JOIN GESTIONANDING.PROVINCIA ON PROV_ID = LOCALIDAD_PROVINCIA
    JOIN GESTIONANDING.TICKET ON TICKET_ID = ENVIO_TICKET
    JOIN GESTIONANDING.SUCURSAL s ON SUCURSAL_ID = TICKET_SUCURSAL
    JOIN BI_GESTIONANDING.BI_DIM_RANGO_ETARIO dimre ON
            BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO(
                DATEDIFF(YEAR, CLIENTE.CLIENTE_FECHA_NACIMIENTO, GETDATE())
            ) = dimre.rango_etario_id
    JOIN BI_GESTIONANDING.BI_DIM_UBICACION_CLIE dimuc ON
            LOCALIDAD_ID = dimuc.localidad_cd AND PROVINCIA.PROV_ID = dimuc.provincia_cd
    JOIN BI_GESTIONANDING.BI_DIM_TIEMPO dimt ON
            YEAR(TICKET_FECHA_HORA) = dimt.anio AND 
            BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(TICKET_FECHA_HORA) = dimt.cuatrimestre AND 
            MONTH(TICKET_FECHA_HORA) = dimt.mes
    GROUP BY 
        s.sucursal_id,
        dimre.rango_etario_id,
        dimuc.ubicacion_clie_id,
        dimt.tiempo_id
END     
GO

CREATE PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_PAGO
AS
BEGIN
    INSERT INTO BI_FACT_PAGO (pago_ubi_sucu, pago_tiempo, pago_rango_etario,
    pago_cuotas, pago_medio_pago, sum_importe, sum_descuentos)
    SELECT
        dimus.ubicacion_sucu_id,
        dimt.tiempo_id,
        dimre.rango_etario_id,
        ISNULL(DETPAG_CUOTAS,0),
        PAGO_MEDIO_PAGO,
        SUM(PAGO_IMPORTE),
        SUM(DA_APLICADA_DESCUENTO)
    FROM GESTIONANDING.PAGO
    JOIN GESTIONANDING.TICKET ON PAGO_TICKET = TICKET_ID
    JOIN GESTIONANDING.SUCURSAL ON TICKET_SUCURSAL = SUCURSAL_ID
    JOIN GESTIONANDING.DIRECCION ON SUCURSAL_DIRECCION = DIRE_ID
    JOIN GESTIONANDING.LOCALIDAD ON DIRE_LOCALIDAD = LOCALIDAD_ID
    LEFT JOIN GESTIONANDING.DETALLE_PAGO ON DETPAG_ID = PAGO_DETALLE
    LEFT JOIN GESTIONANDING.CLIENTE ON DETPAG_CLIE = CLIENTE_ID
    LEFT JOIN GESTIONANDING.DESCUENTO_APLICADO ON DA_PAGO = PAGO_ID
    JOIN BI_GESTIONANDING.BI_DIM_UBICACION_SUCU dimus
        ON LOCALIDAD_ID =dimus.localidad_cd AND LOCALIDAD_PROVINCIA =dimus.provincia_cd
    JOIN BI_GESTIONANDING.BI_DIM_TIEMPO dimt ON
            YEAR(PAGO_FECHA) = dimt.anio AND 
            BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(PAGO_FECHA) = dimt.cuatrimestre AND 
            MONTH(PAGO_FECHA) = dimt.mes
    JOIN BI_GESTIONANDING.BI_DIM_RANGO_ETARIO dimre ON
        BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO(
                    DATEDIFF(YEAR, CLIENTE.CLIENTE_FECHA_NACIMIENTO, GETDATE())
                ) = dimre.rango_etario_id
    GROUP BY 
        dimus.ubicacion_sucu_id,
        dimt.tiempo_id,
        dimre.rango_etario_id,
        ISNULL(DETPAG_CUOTAS,0),
        PAGO_MEDIO_PAGO
END
GO

CREATE PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_VENTAS
AS
BEGIN
    INSERT INTO BI_FACT_VENTAS (
    venta_tiempo,
    venta_ubi_sucu,
    venta_turno,
    venta_tipo_caja,
    venta_rango_etario,
    cant_ventas,
    sum_articulo,
    sum_total_ticket,
    sum_subtotal_productos,
    sum_promociones,
    sum_descuentos
    )
    
    SELECT
        dimt.tiempo_id,
        dimus.ubicacion_sucu_id,
        dimtu.turno_id,
        CAJA_TIPO,
        dimre.rango_etario_id,
        COUNT(*),
        (
            SELECT
                SUM(TICKET_DET_CANTIDAD) AS sum_articulo
            FROM GESTIONANDING.TICKET t
            JOIN GESTIONANDING.TICKET_DET ON TICKET_DET_TICKET = TICKET_ID
            JOIN GESTIONANDING.SUCURSAL ON TICKET_SUCURSAL = SUCURSAL_ID
            JOIN GESTIONANDING.DIRECCION ON SUCURSAL_DIRECCION = DIRE_ID
            JOIN GESTIONANDING.LOCALIDAD ON DIRE_LOCALIDAD = LOCALIDAD_ID
            JOIN GESTIONANDING.CAJA ic ON TICKET_CAJA_NUMERO = CAJA_NUMERO AND TICKET_SUCURSAL = CAJA_SUCURSAL
            JOIN GESTIONANDING.EMPLEADO ie ON TICKET_EMPLEADO = EMPLEADO_LEGAJO
            JOIN BI_GESTIONANDING.BI_DIM_TIEMPO idimt ON
                YEAR(TICKET_FECHA_HORA) = idimt.anio AND 
                BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(TICKET_FECHA_HORA) = idimt.cuatrimestre AND 
                MONTH(TICKET_FECHA_HORA) = idimt.mes
            JOIN BI_GESTIONANDING.BI_DIM_UBICACION_SUCU idimus
                ON LOCALIDAD_ID = idimus.localidad_cd AND LOCALIDAD_PROVINCIA = idimus.provincia_cd
            JOIN BI_GESTIONANDING.BI_DIM_TURNO idimtu 
                ON BI_GESTIONANDING.FX_OBTENER_TURNO(TICKET_FECHA_HORA) = idimtu.turno_id
            JOIN BI_GESTIONANDING.BI_DIM_RANGO_ETARIO idimre ON
                BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO(
                            DATEDIFF(YEAR, ie.EMPLEADO_FECHA_NACIMIENTO, GETDATE())
                        ) = idimre.rango_etario_id
            WHERE
                idimt.tiempo_id = dimt.tiempo_id
                AND idimus.ubicacion_sucu_id = dimus.ubicacion_sucu_id
                AND idimtu.turno_id = dimtu.turno_id
                AND ic.CAJA_TIPO = c.CAJA_TIPO
                AND idimre.rango_etario_id = dimre.rango_etario_id
            
        ),
        SUM(TICKET_TOTAL_TICKET),
        SUM(TICKET_SUBTOTAL_PRODUCTOS),
        SUM(TICKET_TOTAL_DESCUENTO_PROMOCIONES),
        SUM(TICKET_TOTAL_DESCUENTO_APLICADO_MP)
    FROM GESTIONANDING.TICKET t
    JOIN GESTIONANDING.SUCURSAL ON TICKET_SUCURSAL = SUCURSAL_ID
    JOIN GESTIONANDING.DIRECCION ON SUCURSAL_DIRECCION = DIRE_ID
    JOIN GESTIONANDING.LOCALIDAD ON DIRE_LOCALIDAD = LOCALIDAD_ID
    JOIN GESTIONANDING.CAJA c ON TICKET_CAJA_NUMERO = CAJA_NUMERO AND TICKET_SUCURSAL = CAJA_SUCURSAL
    JOIN GESTIONANDING.EMPLEADO ON TICKET_EMPLEADO = EMPLEADO_LEGAJO
    JOIN BI_GESTIONANDING.BI_DIM_TIEMPO dimt ON
        YEAR(TICKET_FECHA_HORA) = dimt.anio AND 
        BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(TICKET_FECHA_HORA) = dimt.cuatrimestre AND 
        MONTH(TICKET_FECHA_HORA) = dimt.mes
    JOIN BI_GESTIONANDING.BI_DIM_UBICACION_SUCU dimus
        ON LOCALIDAD_ID = dimus.localidad_cd AND LOCALIDAD_PROVINCIA = dimus.provincia_cd
    JOIN BI_GESTIONANDING.BI_DIM_TURNO dimtu ON 
        BI_GESTIONANDING.FX_OBTENER_TURNO(TICKET_FECHA_HORA) = dimtu.turno_id
    JOIN BI_GESTIONANDING.BI_DIM_RANGO_ETARIO dimre ON
        BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO(
                    DATEDIFF(YEAR, EMPLEADO_FECHA_NACIMIENTO, GETDATE())
                ) = dimre.rango_etario_id
    GROUP BY
        dimt.tiempo_id,
        dimus.ubicacion_sucu_id,
        dimtu.turno_id,
        CAJA_TIPO,
        dimre.rango_etario_id
    /*
    -- NO TIENE LAS SUMATORIAS PARA LA VISTA 5
    SELECT
        dimt.tiempo_id,
        dimus.ubicacion_sucu_id,
        dimtu.turno_id,
        CAJA_TIPO,
        dimre.rango_etario_id,
        COUNT(DISTINCT TICKET_ID),
        SUM(TICKET_DET_CANTIDAD),
        SUM(TICKET_DET_CANTIDAD*TICKET_DET_PRECIO_UNITARIO)
    FROM GESTIONANDING.TICKET t
    JOIN GESTIONANDING.TICKET_DET ON TICKET_DET_TICKET = TICKET_ID
    JOIN GESTIONANDING.SUCURSAL ON TICKET_SUCURSAL = SUCURSAL_ID
    JOIN GESTIONANDING.DIRECCION ON SUCURSAL_DIRECCION = DIRE_ID
    JOIN GESTIONANDING.LOCALIDAD ON DIRE_LOCALIDAD = LOCALIDAD_ID
    JOIN GESTIONANDING.CAJA c ON TICKET_CAJA_NUMERO = CAJA_NUMERO AND TICKET_SUCURSAL = CAJA_SUCURSAL
    JOIN GESTIONANDING.EMPLEADO ON TICKET_EMPLEADO = EMPLEADO_LEGAJO
    JOIN BI_GESTIONANDING.BI_DIM_TIEMPO dimt ON
        YEAR(TICKET_FECHA_HORA) = dimt.anio AND 
        BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(TICKET_FECHA_HORA) = dimt.cuatrimestre AND 
        MONTH(TICKET_FECHA_HORA) = dimt.mes
    JOIN BI_GESTIONANDING.BI_DIM_UBICACION_SUCU dimus
        ON LOCALIDAD_ID = dimus.localidad_cd AND LOCALIDAD_PROVINCIA = dimus.provincia_cd
    JOIN BI_GESTIONANDING.BI_DIM_TURNO dimtu ON 
        BI_GESTIONANDING.FX_OBTENER_TURNO(TICKET_FECHA_HORA) = dimtu.turno_id
    JOIN BI_GESTIONANDING.BI_DIM_RANGO_ETARIO dimre ON
        BI_GESTIONANDING.FX_CALCULAR_RANGO_ETARIO(
                    DATEDIFF(YEAR, EMPLEADO_FECHA_NACIMIENTO, GETDATE())
                ) = dimre.rango_etario_id
    GROUP BY
        dimt.tiempo_id,
        dimus.ubicacion_sucu_id,
        dimtu.turno_id,
        CAJA_TIPO,
        dimre.rango_etario_id*/
END
GO

CREATE PROCEDURE BI_GESTIONANDING.MIGRAR_BI_FACT_DESCUENTO
AS
BEGIN
    INSERT INTO BI_GESTIONANDING.BI_FACT_DESCUENTO (
    desc_tiempo,
    desc_categoria,
    sum_promo_producto
    )
    SELECT
        dimt.tiempo_id,
        cate_prod_id,
        SUM(PA_APLICADA_DESCUENTO)
    FROM GESTIONANDING.TICKET
    JOIN GESTIONANDING.TICKET_DET ON TICKET_DET_TICKET = TICKET_ID
    JOIN GESTIONANDING.PROMOCION_APLICADA ON PA_TICKET_DET = TICKET_DET_ID
    JOIN GESTIONANDING.PRODUCTO ON TICKET_DET_PRODUCTO = PRODUCTO_COD
    JOIN GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA ON PRODUCTO_COD = PXS_PRODUCTO
    JOIN GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA ON CXS_SUBCAT = PXS_SUBCATEGORIA
    JOIN BI_GESTIONANDING.BI_DIM_TIEMPO dimt ON
        YEAR(TICKET_FECHA_HORA) = dimt.anio AND 
        BI_GESTIONANDING.FX_OBTENER_CUATRIMESTRE(TICKET_FECHA_HORA) = dimt.cuatrimestre AND 
        MONTH(TICKET_FECHA_HORA) = dimt.mes
    JOIN BI_GESTIONANDING.BI_DIM_CATE_PROD ON cate_prod_id = CXS_CATEGORIA
    GROUP BY
        dimt.tiempo_id,
        cate_prod_id

END
GO

-- Fin crear Procedures

-- Ejecucion de Procedures
EXEC BI_GESTIONANDING.MIGRAR_BI_FACT_ENVIO
EXEC BI_GESTIONANDING.MIGRAR_BI_FACT_PAGO
EXEC BI_GESTIONANDING.MIGRAR_BI_FACT_VENTAS
EXEC BI_GESTIONANDING.MIGRAR_BI_FACT_DESCUENTO
-- Fin ejecucion de Procedures

BEGIN TRANSACTION
GO

-- Creacion de Views
/***************
    VISTA 01
****************/

CREATE VIEW BI_GESTIONANDING.TICKET_PROMEDIO_MENSUAL
AS
SELECT localidad_tx
	,provincia_tx
	,bdt.anio
	,bdt.mes
	,round(sum(sum_total_ticket) / sum(cant_ventas), 2) promedioVentas
FROM BI_GESTIONANDING.BI_FACT_VENTAS bfv
JOIN bi_gestionanding.bi_dim_tiempo bdt ON bfv.venta_tiempo = bdt.tiempo_id
JOIN bi_gestionanding.BI_DIM_UBICACION_SUCU bdus ON bdus.ubicacion_sucu_id = bfv.venta_ubi_sucu
GROUP BY bdt.anio
	,bdt.mes
	,provincia_tx
	,localidad_tx
GO

/***************
    VISTA 02
****************/

CREATE VIEW BI_GESTIONANDING.CANTIDAD_UNIDADES_PROMEDIO
AS
SELECT tm.anio
	,tm.cuatrimestre
	,tn.descripcion
	,sum(sum_articulo) / sum(cant_ventas) promedioUnidades
FROM BI_GESTIONANDING.BI_FACT_VENTAS v
JOIN bi_gestionanding.BI_DIM_TURNO tn ON tn.turno_id = v.venta_turno
JOIN bi_gestionanding.BI_DIM_TIEMPO tm ON tm.tiempo_id = v.venta_tiempo
GROUP BY tn.turno_id
	,tn.descripcion
	,tm.anio
	,tm.cuatrimestre
GO

/***************
    VISTA 03
****************/

CREATE VIEW BI_GESTIONANDING.PORCENTAJE_ANUAL_VENTAS
AS
SELECT t.anio
	,t.cuatrimestre
	,tc.descripcion tipoCaja
	,re.descripcion rangoEtario
	,round(cast(sum(v.cant_ventas) AS FLOAT) * 100 / (
			SELECT sum(cant_ventas)
			FROM BI_GESTIONANDING.BI_FACT_VENTAS ven
			JOIN bi_gestionanding.BI_DIM_TIEMPO tie ON tie.tiempo_id = ven.venta_tiempo
			WHERE tie.anio = t.anio
			), 2) porcentaje
FROM BI_GESTIONANDING.BI_FACT_VENTAS v
JOIN bi_gestionanding.BI_DIM_RANGO_ETARIO re ON re.rango_etario_id = v.venta_rango_etario
JOIN bi_gestionanding.BI_DIM_TIPO_CAJA tc ON tc.tipo_caja_id = v.venta_tipo_caja
JOIN BI_GESTIONANDING.BI_DIM_TIEMPO t ON t.tiempo_id = v.venta_tiempo
GROUP BY re.rango_etario_id
	,re.descripcion
	,tc.tipo_caja_id
	,tc.descripcion
	,t.anio
	,t.cuatrimestre
GO

/***************
    VISTA 04
****************/

CREATE VIEW BI_GESTIONANDING.VENTAS_REGISTRADAS_POR_TURNO
AS
SELECT t.anio
	,t.mes
	,u.provincia_tx
	,u.localidad_tx
	,tur.descripcion
	,sum(v.cant_ventas) cantidadDeVentas
FROM BI_GESTIONANDING.BI_FACT_VENTAS v
JOIN BI_GESTIONANDING.BI_DIM_UBICACION_SUCU u ON u.ubicacion_sucu_id = v.venta_ubi_sucu
JOIN BI_GESTIONANDING.BI_DIM_TIEMPO t ON t.tiempo_id = v.venta_tiempo
JOIN bi_gestionanding.BI_DIM_TURNO tur ON tur.turno_id = v.venta_turno
GROUP BY t.tiempo_id
	,t.anio
	,t.mes
	,u.ubicacion_sucu_id
	,u.provincia_cd
	,u.provincia_tx
	,u.localidad_cd
	,u.localidad_tx
	,tur.turno_id
	,tur.descripcion
GO

/***************
    VISTA 05
****************/

CREATE VIEW BI_GESTIONANDING.PORCENTAJE_DE_DESCUENTO
AS
SELECT t.anio
	,t.mes
	,(sum(sum_promociones) + sum(sum_descuentos)) * 100 / sum(sum_total_ticket) porcentajeDeDescuento
FROM BI_GESTIONANDING.BI_FACT_VENTAS v
JOIN BI_GESTIONANDING.BI_DIM_TIEMPO t ON v.venta_tiempo = t.tiempo_id
GROUP BY t.anio
	,t.mes
GO

/***************
    VISTA 06
****************/

CREATE VIEW BI_GESTIONANDING.TRES_CATEGORIAS_CON_MAYOR_DESCUENTO -- ESTA INCOMPLETA, NO SE COMO SEGUIRLA
AS
SELECT TOP 3 t.cuatrimestre
	,c.descripcion
	,sum(d.sum_promo_producto)
FROM BI_GESTIONANDING.BI_FACT_DESCUENTO d
JOIN BI_GESTIONANDING.BI_DIM_TIEMPO t ON t.tiempo_id = d.desc_tiempo
JOIN BI_GESTIONANDING.BI_DIM_CATE_PROD c ON c.cate_prod_id = d.desc_categoria
WHERE t.anio = 2024
	AND t.cuatrimestre = 1
GROUP BY t.anio
	,t.cuatrimestre
	,d.desc_categoria
	,c.descripcion
ORDER BY sum(d.sum_promo_producto) DESC
GO

/***************
    VISTA 07
****************/



/***************
    VISTA 08
****************/

/***************
    VISTA 09
****************/

CREATE VIEW BI_GESTIONANDING.CINCO_LOCALIDADES_CON_MAYOR_COSTO_ENVIO
AS
SELECT TOP 5 u.provincia_tx
	,u.localidad_tx
	,sum(e.sum_costo_de_envio) costoDeEnvio
FROM BI_GESTIONANDING.BI_FACT_ENVIO e
JOIN BI_GESTIONANDING.BI_DIM_UBICACION_CLIE u ON u.ubicacion_clie_id = e.envio_ubi_clie
GROUP BY u.ubicacion_clie_id
	,u.provincia_tx
	,u.localidad_tx
ORDER BY sum(e.sum_costo_de_envio) DESC
GO

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