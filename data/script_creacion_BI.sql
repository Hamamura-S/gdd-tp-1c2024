
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
-- Fin DROP FKs

-- Inicio DROP Procedures
-- Fin DROP Procedures

-- Inicio DROP Functions
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
    id         INTEGER IDENTITY (1, 1) PRIMARY KEY,
    provincia  VARCHAR(50),
    localidad  VARCHAR(50),
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_CUOTAS
(
    codigo     INTEGER IDENTITY (1, 1) PRIMARY KEY
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_TURNO
(
    id          INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_TIPO_CAJA
(
    id          INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_CATE_PROD
(
    id          INTEGER IDENTITY (1, 1) PRIMARY KEY,
    descripcion VARCHAR(50) 
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_RANGO_ETARIO
(
    id          NUMERIC(18, 0) IDENTITY (1, 1) PRIMARY KEY,
    descripcion VARCHAR(50)
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_MEDIO_PAGO
(
    
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_UBICACION_SUCU
(
    
)
GO

CREATE TABLE BI_GESTIONANDING.DIM_TIEMPO
(
    id           NUMERIC(18, 0) IDENTITY (1, 1) PRIMARY KEY,
    anio         NUMERIC(18, 0),
    cuatrimestre NUMERIC(18, 0),
    mes          NUMERIC(18, 0)
)
GO


CREATE TABLE BI_GESTIONANDING.BI_FACT_ENVIO
(
    
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_PAGO
(
    
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_VENTAS
(
    
)
GO

CREATE TABLE BI_GESTIONANDING.BI_FACT_DESCUENTO
(
    
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
-- Fin crear FKs

-- Inicio crear Procedures
-- Inicio crear Procedures

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