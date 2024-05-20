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


-- Inicio DROP Tablas

-- Fin DROP Tablas


-- Inicio DROP Procedimientos

-- Fin DROP Procedimientos


-- Inicio crear schema de la aplicación
IF EXISTS (SELECT SCHEMA_NAME
           FROM INFORMATION_SCHEMA.SCHEMATA
           WHERE SCHEMA_NAME = 'GESTIONANDING')
    DROP SCHEMA GESTIONANDING
GO

CREATE SCHEMA GESTIONANDING
GO
-- Fin crear schema de la aplicación


-- Inicio crear tablas

CREATE TABLE GESTIONANDING.CLIENTE
(
    CLIENTE_ID               INT           IDENTITY (1, 1) PRIMARY KEY,
    CLIENTE_NOMBRE           VARCHAR(50)   NULL,
    CLIENTE_APELLIDO         VARCHAR(50)   NULL,
    CLIENTE_DNI              VARCHAR(8)    NULL,
    CLIENTE_FECHA_REGISTRO   DATE          NULL,
    CLIENTE_TELEFONO         VARCHAR(13)   NULL,
    CLIENTE_MAIL             VARCHAR(100)  NULL, 
    CLIENTE_FECHA_NACIMIENTO DATE          NULL,
    CLIENTE_DOMICILIO        INT           NOT NULL--(FK)
)
GO

CREATE TABLE GESTIONANDING.ENVIO
(
    ENVIO_NRO               INT             IDENTITY (1,1) PRIMARY KEY,
    ENVIO_TICKET            BIGINT          NOT NULL, --(FK)
    ENVIO_FECHA_PROGRAMADA  DATE            NULL,
    ENVIO_HORA_INICIO       DATETIME        NULL,
    ENVIO_HORA_FIN          DATETIME        NULL,
    ENVIO_CLIENTE           INT             NOT NULL, --(FK)
    ENVIO_COSTO             DECIMAL(10,2)   NULL,
    ENVIO_ESTADO            VARCHAR(20)     NULL,
    ENVIO_FECHA_ENTREGA     DATE            NULL
)
GO

CREATE TABLE GESTIONANDING.TARJETA
(
    TARJETA_ID          INT     IDENTITY (1, 1) PRIMARY KEY,
    TARJETA_NUMERO      CHAR(9) NULL, 
    TARJETA_VENCIMIENTO DATE    NULL
)
GO

CREATE TABLE GESTIONANDING.DETALLE_PAGO
(
    DETPAG_ID           INT         IDENTITY (1,1) PRIMARY KEY,
    DETPAG_CLIE         INT         NOT NULL, --FK
    DETPAG_TARJETA      INT         NOT NULL, --FK
    DETPAG_CUOTAS       SMALLINT    NULL
)
GO

CREATE TABLE GESTIONANDING.PAGO
(
    PAGO_ID             INT             IDENTITY (1,1) PRIMARY KEY,
    PAGO_FECHA          DATE            NULL,
    PAGO_IMPORTE        DECIMAL(10,2)   NULL,
    PAGO_MEDIO_PAGO     INT             NOT NULL, --FK
    PAGO_TICKET         BIGINT          NOT NULL, --FK
    PAGO_DETALLE        INT             NOT NULL, --FK
)
GO

CREATE TABLE GESTIONANDING.DESCUENTO_APLICADO
(
    DA_PAGO                 INT             NOT NULL, --(FK)
    DA_DESCUENTO            INT             NOT NULL, --(FK)
    DA_APLICADA_DESCUENTO   DECIMAL(10,2)   NULL,
    PRIMARY KEY (DA_PAGO, DA_DESCUENTO)
)
GO

CREATE TABLE GESTIONANDING.DESCUENTO
(
    DESCUENTO_CODIGO        INT             IDENTITY (1,1) PRIMARY KEY,
    DESCUENTO_DESCRIPCION   VARCHAR(50)     NULL,
    DESCUENTO_MEDIO_PAGO    INT             NOT NULL, --FK
    DESCUENTO_FECHA_INICIO  DATE            NULL,
    DESCUENTO_FECHA_FIN     DATE            NULL,
    DESCUENTO_PORCENTAJE    SMALLINT        NULL,
    DESCUENTO_TOPE          DECIMAL(10,2)   NULL
)
GO

CREATE TABLE GESTIONANDING.MEDIO_PAGO
(
    MP_ID               INT         PRIMARY KEY, 
    MP_TIPO             INT         NOT NULL, --FK
    MP_DESCRIPCION      VARCHAR(50) NULL   
)
GO

CREATE TABLE GESTIONANDING.TIPO_MP
(
    TIPO_MP_ID          INT             PRIMARY KEY,
    TIPO_MP_DESCRIPCION VARCHAR(50)     NULL  
)
GO

CREATE TABLE GESTIONANDING.TICKET
(
    TICKET_NUMERO                       BIGINT              PRIMARY KEY,
    TICKET_FECHA_HORA                   SMALLDATETIME       NULL,
    TICKET_CAJA                         SMALLINT            NOT NULL, --FK
    TICKET_EMPLEADO                     INT                 NOT NULL, --FK
    TICKET_TIPO_COMPROBANTE             CHAR(1)             NULL,
    TICKET_SUBTOTAL_PRODUCTOS           DECIMAL(10, 2)      NULL,
    TICKET_TOTAL_DESCUENTO_PROMOCIONES  DECIMAL(10, 2)      NULL,
    TICKET_TOTAL_DESCUENTO_APLICADO_MP  DECIMAL(10, 2)      NULL,
    TICKET_TOTAL_TICKET                 DECIMAL(10,2)       NULL
)
GO

CREATE TABLE GESTIONANDING.TICKET_DET
(
    TICKET_DET_PRODUCTO         BIGINT          NOT NULL, --(FK)
    TICKET_DET_TICKET           BIGINT          NOT NULL, --(FK)
    TICKET_DET_CANTIDAD         SMALLINT        NULL,
    TICKET_DET_PRECIO_UNITARIO  DECIMAL(10,2)   NULL,
    TICKET_DET_TOTAL            DECIMAL(10,2)   NULL,
    PRIMARY KEY (TICKET_DET_PRODUCTO, TICKET_DET_TICKET)
)
GO

CREATE TABLE GESTIONANDING.PROMOCION_APLICADA
(
    PA_PROMOCION            SMALLINT        NOT NULL, --(FK)
    PA_DET_PROD             INT             NOT NULL, --(FK)
    PA_DET_TICKET           INT             NOT NULL, --(FK)
    PA_APLICADA_DESCUENTO   DECIMAL(10,2)   NULL,
    PRIMARY KEY (PA_PROMOCION, PA_DET_PROD, PA_DET_TICKET)
)
GO

CREATE TABLE GESTIONANDING.PROMOCION
(
    PROMO_CODIGO        SMALLINT    PRIMARY KEY,
    PROMO_DESCRIPCION   VARCHAR(50),
    PROMO_FECHA_INICIO  DATE,
    PROMO_FECHA_FIN     DATE
)
GO

CREATE TABLE GESTIONANDING.REGLA
(
    REGLA_ID                    INT         IDENTITY (1,1)  PRIMARY KEY,
    REGLA_DESCRIPCION           VARCHAR(50),
    REGLA_PORCENTAJE_DESCUENTO  SMALLINT,
    REGLA_CANTIDAD_PRODUCTOS    SMALLINT,
    REGLA_CANTIDAD_DESCUENTO    SMALLINT,
    REGLA_CANTIDAD_MAXIMA       SMALLINT,
    REGLA_FL_MARCA              BIT,
    REGLA_FL_PRODUCTO           BIT,
    REGLA_PROMOCION             SMALLINT--(FK)
)
GO

CREATE TABLE GESTIONANDING.PROMOCION_POR_PRODUCTO
(
    PXP_PROMOCION   SMALLINT, --(FK)
    PXP_PRODUCTO    BIGINT, --(FK)
    PRIMARY KEY (PXP_PROMOCION, PXP_PRODUCTO)
)
GO

CREATE TABLE GESTIONANDING.PRODUCTO
(
    PRODUCTO_COD            BIGINT          PRIMARY KEY,
    PRODUCTO_DESCRIPCION    VARCHAR(100)    NULL,       --SIEMPRE VA A ESTAR EN NULL PORQUE NO HAY DESCRIPCION REAL
    PRODUCTO_PRECIO         DECIMAL(10,2)   NULL,
    PRODUCTO_MARCA          BIGINT          NOT NULL,   --(FK)
    PRODUCTO_SUBCATEGORIA   BIGINT          NOT NULL    --(FK)
)
GO

CREATE TABLE GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA
(
    PXS_PRODUCTO        BIGINT NOT NULL, --(FK)
    PXS_SUBCATEGORIA    BIGINT NOT NULL, --(FK)
    PRIMARY KEY (PXS_PRODUCTO, PXS_SUBCATEGORIA)
)
GO

CREATE TABLE GESTIONANDING.SUBCATEGORIA
(
    SUBCAT_ID           BIGINT      PRIMARY KEY
    SUBCAT_CATEGORIA    BIGINT      NOT NULL,   --(FK)
    SUBCAT_DESCR        VARCHAR(50) NULL
)
GO

CREATE TABLE GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA
(
    CXS_SUBCAT      BIGINT,     --(FK)
    CXS_CATEGORIA   BIGINT,     --(FK)
    PRIMARY KEY (CXS_SUBCAT, CXS_CATEGORIA)
)
GO

CREATE TABLE GESTIONANDING.CATEGORIA
(
    CAT_ID          BIGINT      PRIMARY KEY,
    CAT_DESCR       VARCHAR(50) NULL  
)
GO

CREATE TABLE GESTIONANDING.PRODUCTO_POR_MARCA
(
    PXM_MARCA           BIGINT      NOT NULL,   --FK
    PXM_PRODUCTO        BIGINT      NOT NULL    --FK
)
GO

CREATE TABLE GESTIONANDING.MARCA
(
    MARCA_COD           BIGINT      PRIMARY KEY, 
    MARCA_DESCRIPCION   VARCHAR(50) NULL  
)
GO

CREATE TABLE GESTIONANDING.CAJA
(
    CAJA_NUMERO     SMALLINT    PRIMARY KEY,
    CAJA_TIPO       SMALLINT    NOT NULL, --FK
    CAJA_SUCURSAL   INT         NOT NULL --FK
)
GO

CREATE TABLE GESTIONANDING.CAJA_TIPO
(
    CAJA_TIPO_ID            SMALLINT        IDENTITY (1,1) PRIMARY KEY,
    CAJA_TIPO_DESCRIPCION   VARCHAR(20)     NULL
)
GO

CREATE TABLE GESTIONANDING.SUCURSAL
(
    SUCURSAL_ID             INT         IDENTITY (1,1) PRIMARY KEY,
    SUCURSAL_DIRECCION      INT         NOT NULL,--FK
    SUCURSAL_SUPER          CHAR(11)    NOT NULL --FK    
)
GO

CREATE TABLE GESTIONANDING.SUPERMERCADO
(
    SUPER_CUIT                  CHAR(11)        PRIMARY KEY,
    SUPER_NOMBRE                VARCHAR(50)     NULL,
    SUPER_RAZON_SOC             VARCHAR(50)     NULL,
    SUPER_IIBB                  INT             NULL,
    SUPER_DOMICILIO             INT             NOT NULL,--FK
    SUPER_FECHA_INI_ACTIVIDAD   SMALLDATETIME   NULL,
    SUPER_CONDICION_FISCAL      INT             NOT NULL --FK
)
GO

CREATE TABLE GESTIONANDING.CONDICION_FISCAL
(
    CONFIS_ID               INT             IDENTITY (1,1) PRIMARY KEY,
    CONFIS_DESCRIPCION      VARCHAR(100)    NULL
)
GO

CREATE TABLE GESTIONANDING.DIRECCION
(
    DIRE_ID                 INT             IDENTITY (1,1) PRIMARY KEY,
    DIRE_CALLE              VARCHAR(255)    NULL,
    DIRE_ALTURA             SMALLINT        NULL,
    DIRE_LOCALIDAD          SMALLINT        NOT NULL--FK 
)
GO

CREATE TABLE GESTIONANDING.LOCALIDAD
(
    LOCALIDAD_ID            SMALLINT        IDENTITY (1,1) PRIMARY KEY, 
    LOCALIDAD_NOMBRE        VARCHAR(50)     NULL,
    LOCALIDAD_PROVINCIA     SMALLINT        NOT NULL --FK
)
GO

CREATE TABLE GESTIONANDING.PROVINCIA
(
    PROV_ID         SMALLINT                IDENTITY (1,1) PRIMARY KEY, 
    PROV_NOMBRE     VARCHAR(50)             NULL
)
GO

CREATE TABLE GESTIONANDING.EMPLEADO
(
    EMPLEADO_LEGAJO             INT             IDENTITY (1,1) PRIMARY KEY,
    EMPLEADO_SUCURSAL           INT             NOT NULL, --FK
    EMPLEADO_NOMBRE             VARCHAR(50)     NULL,
    EMPLEADO_APELLIDO           VARCHAR(50)     NULL,
    EMPLEADO_DNI                CHAR(8)         NULL,
    EMPLEADO_FECHA_REGISTRO     SMALLDATETIME   NULL,
    EMPLEADO_TELEFONO           VARCHAR(13)     NULL,
    EMPLEADO_MAIL               VARCHAR(100)    NULL,
    EMPLEADO_FECHA_NACIMIENTO   DATE            NULL
)
GO

-- Fin crear tablas


-- Inicio crear FKs

-- Fin crear FKs


-- Inicio crear Procedimientos

-- Fin crear Procedimientos


-- Inicio Invocaciones de procedimientos
--* Migración de tablas paramétricas sin dependencias

--* Migración de tablas paramétricas con dependencias

--* Migración de tablas no paramétricas

-- Fin Invocaciones de procedimientos