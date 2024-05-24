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

IF OBJECT_ID('GESTIONANDING.FK_CLIENTE_DIRECCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.CLIENTE
    DROP CONSTRAINT FK_CLIENTE_DIRECCION
GO

IF OBJECT_ID('GESTIONANDING.FK_ENVIO_TICKET', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.ENVIO
    DROP CONSTRAINT FK_ENVIO_TICKET
GO

IF OBJECT_ID('GESTIONANDING.FK_ENVIO_CLIENTE', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.ENVIO
    DROP CONSTRAINT FK_ENVIO_CLIENTE
GO

IF OBJECT_ID('GESTIONANDING.FK_DETPAG_CLIENTE', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.DETALLE_PAGO
    DROP CONSTRAINT FK_DETPAG_CLIENTE
GO

IF OBJECT_ID('GESTIONANDING.FK_DETPAG_TARJETA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.DETALLE_PAGO
    DROP CONSTRAINT FK_DETPAG_TARJETA
GO

IF OBJECT_ID('GESTIONANDING.FK_PAGO_MP', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PAGO
    DROP CONSTRAINT FK_PAGO_MP
GO

IF OBJECT_ID('GESTIONANDING.FK_PAGO_TICKET', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PAGO
    DROP CONSTRAINT FK_PAGO_TICKET
GO

IF OBJECT_ID('GESTIONANDING.FK_PAGO_DETALLE', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PAGO
    DROP CONSTRAINT FK_PAGO_DETALLE
GO

IF OBJECT_ID('GESTIONANDING.FK_DA_PAGO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.DESCUENTO_APLICADO
    DROP CONSTRAINT FK_DA_PAGO
GO

IF OBJECT_ID('GESTIONANDING.FK_DA_DESCUENTO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.DESCUENTO_APLICADO
    DROP CONSTRAINT FK_DA_DESCUENTO
GO

IF OBJECT_ID('GESTIONANDING.FK_DESCUENTO_MP', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.DESCUENTO
    DROP CONSTRAINT FK_DESCUENTO_MP
GO

IF OBJECT_ID('GESTIONANDING.FK_MP_TIPOMP', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.MEDIO_PAGO
    DROP CONSTRAINT FK_MP_TIPOMP
GO

IF OBJECT_ID('GESTIONANDING.FK_TICKET_CAJA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.TICKET
    DROP CONSTRAINT FK_TICKET_CAJA
GO

IF OBJECT_ID('GESTIONANDING.FK_TICKET_EMPLEADO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.TICKET
    DROP CONSTRAINT FK_TICKET_EMPLEADO
GO

IF OBJECT_ID('GESTIONANDING.FK_TDET_PRODUCTO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.TICKET_DET
    DROP CONSTRAINT FK_TDET_PRODUCTO
GO

IF OBJECT_ID('GESTIONANDING.FK_TDET_TICKET', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.TICKET_DET
    DROP CONSTRAINT FK_TDET_TICKET
GO

IF OBJECT_ID('GESTIONANDING.FK_PA_PROMOCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PROMOCION_APLICADA
    DROP CONSTRAINT FK_PA_PROMOCION
GO

IF OBJECT_ID('GESTIONANDING.FK_PA_TDET', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PROMOCION_APLICADA
    DROP CONSTRAINT FK_PA_TDET
GO

IF OBJECT_ID('GESTIONANDING.FK_REGLA_PROMOCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.REGLA
    DROP CONSTRAINT FK_REGLA_PROMOCION
GO

IF OBJECT_ID('GESTIONANDING.FK_PXP_PROMOCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PROMOCION_POR_PRODUCTO
    DROP CONSTRAINT FK_PXP_PROMOCION
GO

IF OBJECT_ID('GESTIONANDING.FK_PXP_PRODUCTO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PROMOCION_POR_PRODUCTO
    DROP CONSTRAINT FK_PXP_PRODUCTO
GO

IF OBJECT_ID('GESTIONANDING.FK_PXS_PRODUCTO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA
    DROP CONSTRAINT FK_PXS_PRODUCTO
GO

IF OBJECT_ID('GESTIONANDING.FK_PXS_SUBCATEGORIA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA
    DROP CONSTRAINT FK_PXS_SUBCATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.FK_CXS_SUBCATEGORIA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA
    DROP CONSTRAINT FK_CXS_SUBCATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.FK_CXS_CATEGORIA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA
    DROP CONSTRAINT FK_CXS_CATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.FK_PXM_MARCA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PRODUCTO_POR_MARCA
    DROP CONSTRAINT FK_PXM_MARCA
GO

IF OBJECT_ID('GESTIONANDING.FK_PXM_PRODUCTO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.PRODUCTO_POR_MARCA
    DROP CONSTRAINT FK_PXM_PRODUCTO
GO

IF OBJECT_ID('GESTIONANDING.FK_CAJA_CAJATIPO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.CAJA
    DROP CONSTRAINT FK_CAJA_CAJATIPO 
GO

IF OBJECT_ID('GESTIONANDING.FK_CAJA_SUCURSAL', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.CAJA
    DROP CONSTRAINT FK_CAJA_SUCURSAL 
GO

IF OBJECT_ID('GESTIONANDING.FK_SUCURSAL_DIRECCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.SUCURSAL
    DROP CONSTRAINT FK_SUCURSAL_DIRECCION 
GO

IF OBJECT_ID('GESTIONANDING.FK_SUCURSAL_SUPERMERCADO', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.SUCURSAL
    DROP CONSTRAINT FK_SUCURSAL_SUPERMERCADO 
GO

IF OBJECT_ID('GESTIONANDING.FK_SUPERMERCADO_DIRECCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.SUPERMERCADO
    DROP CONSTRAINT FK_SUPERMERCADO_DIRECCION 
GO

IF OBJECT_ID('GESTIONANDING.FK_SUPERMERCADO_CFISCAL', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.SUPERMERCADO
    DROP CONSTRAINT FK_SUPERMERCADO_CFISCAL 
GO

IF OBJECT_ID('GESTIONANDING.FK_DIRECCION', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.DIRECCION
    DROP CONSTRAINT FK_DIRECCION 
GO

IF OBJECT_ID('GESTIONANDING.FK_LOCALIDAD_PROVINCIA', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.LOCALIDAD
    DROP CONSTRAINT FK_LOCALIDAD_PROVINCIA 
GO

IF OBJECT_ID('GESTIONANDING.FK_EMPLEADO_SUCURSAL', 'F') IS NOT NULL
ALTER TABLE GESTIONANDING.EMPLEADO
    DROP CONSTRAINT FK_EMPLEADO_SUCURSAL
GO

-- Fin DROP FKs


-- Inicio DROP Tablas

IF OBJECT_ID('GESTIONANDING.CLIENTE', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.CLIENTE
GO

IF OBJECT_ID('GESTIONANDING.ENVIO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.ENVIO
GO

IF OBJECT_ID('GESTIONANDING.TARJETA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.TARJETA
GO

IF OBJECT_ID('GESTIONANDING.DETALLE_PAGO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.DETALLE_PAGO
GO

IF OBJECT_ID('GESTIONANDING.PAGO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PAGO
GO

IF OBJECT_ID('GESTIONANDING.DESCUENTO_APLICADO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.DESCUENTO_APLICADO
GO

IF OBJECT_ID('GESTIONANDING.DESCUENTO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.DESCUENTO
GO

IF OBJECT_ID('GESTIONANDING.MEDIO_PAGO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.MEDIO_PAGO
GO

IF OBJECT_ID('GESTIONANDING.TIPO_MP', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.TIPO_MP
GO

IF OBJECT_ID('GESTIONANDING.TICKET', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.TICKET
GO

IF OBJECT_ID('GESTIONANDING.TICKET_DET', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.TICKET_DET
GO

IF OBJECT_ID('GESTIONANDING.PROMOCION_APLICADA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PROMOCION_APLICADA
GO

IF OBJECT_ID('GESTIONANDING.PROMOCION', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PROMOCION
GO

IF OBJECT_ID('GESTIONANDING.REGLA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.REGLA
GO

IF OBJECT_ID('GESTIONANDING.PROMOCION_POR_PRODUCTO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PROMOCION_POR_PRODUCTO
GO

IF OBJECT_ID('GESTIONANDING.PRODUCTO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PRODUCTO
GO

IF OBJECT_ID('GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.SUBCATEGORIA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.SUBCATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.CATEGORIA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.CATEGORIA
GO

IF OBJECT_ID('GESTIONANDING.PRODUCTO_POR_MARCA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PRODUCTO_POR_MARCA
GO

IF OBJECT_ID('GESTIONANDING.MARCA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.MARCA
GO

IF OBJECT_ID('GESTIONANDING.CAJA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.CAJA
GO

IF OBJECT_ID('GESTIONANDING.CAJA_TIPO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.CAJA_TIPO
GO

IF OBJECT_ID('GESTIONANDING.SUCURSAL', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.SUCURSAL
GO

IF OBJECT_ID('GESTIONANDING.SUPERMERCADO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.SUPERMERCADO
GO

IF OBJECT_ID('GESTIONANDING.CONDICION_FISCAL', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.CONDICION_FISCAL
GO

IF OBJECT_ID('GESTIONANDING.DIRECCION', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.DIRECCION
GO

IF OBJECT_ID('GESTIONANDING.LOCALIDAD', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.LOCALIDAD
GO

IF OBJECT_ID('GESTIONANDING.PROVINCIA', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.PROVINCIA
GO

IF OBJECT_ID('GESTIONANDING.EMPLEADO', 'U') IS NOT NULL
    DROP TABLE GESTIONANDING.EMPLEADO
GO

-- Fin DROP Tablas


-- Inicio DROP Procedimientos
IF OBJECT_ID('GESTIONANDING.MIGRAR_CLIENTE') IS NOT NULL
    DROP PROCEDURE GESTIONANDING.MIGRAR_CLIENTE
GO

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

CREATE TABLE GESTIONANDING.CLIENTE -- IVAN NO TERMINADA
(
    CLIENTE_ID               INT           IDENTITY (1, 1) PRIMARY KEY,
    CLIENTE_NOMBRE           VARCHAR(50)   NULL,
    CLIENTE_APELLIDO         VARCHAR(50)   NULL,
    CLIENTE_DNI              VARCHAR(8)    NULL,
    CLIENTE_FECHA_REGISTRO   DATE          NULL,
    CLIENTE_TELEFONO         VARCHAR(13)   NULL,
    CLIENTE_MAIL             VARCHAR(100)  NULL, 
    CLIENTE_FECHA_NACIMIENTO DATE          NULL,
    CLIENTE_DIRECCION        INT           NOT NULL--(FK)
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

CREATE TABLE GESTIONANDING.TARJETA -- TOMI
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

CREATE TABLE GESTIONANDING.PROMOCION
(
    PROMO_CODIGO        SMALLINT    PRIMARY KEY,
    PROMO_DESCRIPCION   VARCHAR(50),
    PROMO_FECHA_INICIO  DATE,
    PROMO_FECHA_FIN     DATE
)
GO

CREATE TABLE GESTIONANDING.PROMOCION_APLICADA
(
    PA_PROMOCION            SMALLINT        NOT NULL, --(FK)
    PA_PROD                 BIGINT          NOT NULL, --(FK)
    PA_TICKET               BIGINT          NOT NULL, --(FK)
    PA_APLICADA_DESCUENTO   DECIMAL(10,2)   NULL,
    PRIMARY KEY (PA_PROMOCION, PA_PROD, PA_TICKET)
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
    PRODUCTO_PRECIO         DECIMAL(10,2)   NULL
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
    SUBCAT_ID           BIGINT      PRIMARY KEY,
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
    SUPER_DIRECCION             INT             NOT NULL,--FK
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

ALTER TABLE GESTIONANDING.CLIENTE
    ADD CONSTRAINT FK_CLIENTE_DIRECCION FOREIGN KEY (cliente_direccion) REFERENCES GESTIONANDING.DIRECCION (dire_id)
GO

ALTER TABLE GESTIONANDING.ENVIO
    ADD CONSTRAINT FK_ENVIO_TICKET FOREIGN KEY (envio_ticket) REFERENCES GESTIONANDING.TICKET (ticket_numero),
        CONSTRAINT FK_ENVIO_CLIENTE FOREIGN KEY (envio_cliente) REFERENCES GESTIONANDING.CLIENTE (cliente_id)
GO

ALTER TABLE GESTIONANDING.DETALLE_PAGO
    ADD CONSTRAINT FK_DETPAG_CLIENTE FOREIGN KEY (detpag_clie) REFERENCES GESTIONANDING.CLIENTE (cliente_id),
        CONSTRAINT FK_DETPAG_TARJETA FOREIGN KEY (detpag_tarjeta) REFERENCES GESTIONANDING.TARJETA (tarjeta_id)
GO

ALTER TABLE GESTIONANDING.PAGO
    ADD CONSTRAINT FK_PAGO_TICKET FOREIGN KEY (pago_ticket) REFERENCES GESTIONANDING.TICKET (ticket_numero),
        CONSTRAINT FK_PAGO_DETALLE FOREIGN KEY (pago_detalle) REFERENCES GESTIONANDING.DETALLE_PAGO (detpag_id),
        CONSTRAINT FK_PAGO_MP FOREIGN KEY (pago_medio_pago) REFERENCES GESTIONANDING.MEDIO_PAGO (mp_id)
GO

ALTER TABLE GESTIONANDING.DESCUENTO_APLICADO
    ADD CONSTRAINT FK_DA_PAGO FOREIGN KEY (da_pago) REFERENCES GESTIONANDING.PAGO (pago_id),
        CONSTRAINT FK_DA_DESCUENTO FOREIGN KEY (da_descuento) REFERENCES GESTIONANDING.DESCUENTO (descuento_codigo)
GO

ALTER TABLE GESTIONANDING.DESCUENTO
    ADD CONSTRAINT FK_DESCUENTO_MP FOREIGN KEY (descuento_medio_pago) REFERENCES GESTIONANDING.MEDIO_PAGO (mp_id)
GO

ALTER TABLE GESTIONANDING.MEDIO_PAGO
    ADD CONSTRAINT FK_MP_TIPOMP FOREIGN KEY (mp_tipo) REFERENCES GESTIONANDING.TIPO_MP (tipo_mp_id)
GO

ALTER TABLE GESTIONANDING.TICKET
    ADD CONSTRAINT FK_TICKET_CAJA FOREIGN KEY (ticket_caja) REFERENCES GESTIONANDING.CAJA (caja_numero),
        CONSTRAINT FK_TICKET_EMPLEADO FOREIGN KEY (ticket_empleado) REFERENCES GESTIONANDING.EMPLEADO (empleado_legajo)
GO

ALTER TABLE GESTIONANDING.TICKET_DET
    ADD CONSTRAINT FK_TDET_PRODUCTO FOREIGN KEY (ticket_det_producto) REFERENCES GESTIONANDING.PRODUCTO (producto_cod),
        CONSTRAINT FK_TDET_TICKET FOREIGN KEY (ticket_det_ticket) REFERENCES GESTIONANDING.TICKET (ticket_numero)
GO

ALTER TABLE GESTIONANDING.PROMOCION_APLICADA
    ADD CONSTRAINT FK_PA_PROMOCION FOREIGN KEY (pa_promocion) REFERENCES GESTIONANDING.PROMOCION (promo_codigo),
		CONSTRAINT FK_PA_TDET FOREIGN KEY (pa_prod, pa_ticket) REFERENCES GESTIONANDING.TICKET_DET (ticket_det_producto, ticket_det_ticket)
GO

ALTER TABLE GESTIONANDING.REGLA
    ADD CONSTRAINT FK_REGLA_PROMOCION FOREIGN KEY (regla_promocion) REFERENCES GESTIONANDING.PROMOCION (promo_codigo)
GO

ALTER TABLE GESTIONANDING.PROMOCION_POR_PRODUCTO
    ADD CONSTRAINT FK_PXP_PROMOCION FOREIGN KEY (pxp_promocion) REFERENCES GESTIONANDING.PROMOCION (promo_codigo),
	    CONSTRAINT FK_PXP_PRODUCTO FOREIGN KEY (pxp_producto) REFERENCES GESTIONANDING.PRODUCTO (PRODUCTO_COD)
GO

ALTER TABLE GESTIONANDING.PRODUCTO_POR_SUBCATEGORIA 
    ADD CONSTRAINT FK_PXS_PRODUCTO FOREIGN KEY (PXS_PRODUCTO) REFERENCES GESTIONANDING.PRODUCTO (PRODUCTO_COD),
        CONSTRAINT FK_PXS_SUBCATEGORIA FOREIGN KEY (PXS_SUBCATEGORIA) REFERENCES GESTIONANDING.SUBCATEGORIA (SUBCAT_ID)
GO

ALTER TABLE GESTIONANDING.CATEGORIA_POR_SUBCATEGORIA
    ADD CONSTRAINT FK_CXS_SUBCATEGORIA FOREIGN KEY (CXS_SUBCAT) REFERENCES GESTIONANDING.SUBCATEGORIA (SUBCAT_ID),
        CONSTRAINT FK_CXS_CATEGORIA FOREIGN KEY (CXS_CATEGORIA) REFERENCES GESTIONANDING.CATEGORIA (CAT_ID)
GO 

ALTER TABLE GESTIONANDING.PRODUCTO_POR_MARCA
    ADD CONSTRAINT FK_PXM_MARCA FOREIGN KEY (PXM_MARCA) REFERENCES GESTIONANDING.MARCA (MARCA_COD),
        CONSTRAINT FK_PXM_PRODUCTO FOREIGN KEY (PXM_PRODUCTO) REFERENCES GESTIONANDING.PRODUCTO (PRODUCTO_COD)
GO

ALTER TABLE GESTIONANDING.CAJA
	ADD CONSTRAINT FK_CAJA_CAJATIPO FOREIGN KEY (caja_tipo) REFERENCES GESTIONANDING.CAJA_TIPO (caja_tipo_id),
		CONSTRAINT FK_CAJA_SUCURSAL FOREIGN KEY (caja_sucursal) REFERENCES GESTIONANDING.SUCURSAL (sucursal_id)
GO

ALTER TABLE GESTIONANDING.SUCURSAL
	ADD CONSTRAINT FK_SUCURSAL_DIRECCION FOREIGN KEY (sucursal_direccion) REFERENCES GESTIONANDING.DIRECCION (dire_id),
		CONSTRAINT FK_SUCURSAL_SUPERMERCADO FOREIGN KEY (sucursal_super) REFERENCES GESTIONANDING.SUPERMERCADO (super_cuit)
GO

ALTER TABLE GESTIONANDING.SUPERMERCADO
	ADD CONSTRAINT FK_SUPERMERCADO_DIRECCION FOREIGN KEY (super_direccion) REFERENCES GESTIONANDING.DIRECCION (dire_id),
		CONSTRAINT FK_SUPERMERCADO_CFISCAL FOREIGN KEY (super_condicion_fiscal) REFERENCES GESTIONANDING.CONDICION_FISCAL (confis_id)
GO

ALTER TABLE GESTIONANDING.DIRECCION
    ADD CONSTRAINT FK_DIRECCION FOREIGN KEY (DIRE_LOCALIDAD) REFERENCES GESTIONANDING.LOCALIDAD (LOCALIDAD_ID)
GO

ALTER TABLE GESTIONANDING.LOCALIDAD
    ADD CONSTRAINT FK_LOCALIDAD_PROVINCIA FOREIGN KEY (LOCALIDAD_PROVINCIA) REFERENCES GESTIONANDING.PROVINCIA (PROV_ID)
GO


ALTER TABLE GESTIONANDING.EMPLEADO
    ADD CONSTRAINT FK_EMPLEADO_SUCURSAL FOREIGN KEY (EMPLEADO_SUCURSAL) REFERENCES GESTIONANDING.SUCURSAL (SUCURSAL_ID)
GO




-- Fin crear FKs


-- Inicio crear Procedimientos

CREATE PROCEDURE GESTIONANDING.MIGRAR_CLIENTE
AS
BEGIN
    INSERT INTO GESTIONANDING.CLIENTE(  CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_DNI, CLIENTE_FECHA_REGISTRO,
                                        CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NACIMIENTO--, CLIENTE_DIRECCION
                                        )
    SELECT DISTINCT 
    CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_DNI, CLIENTE_FECHA_REGISTRO,
    CLIENTE_TELEFONO, CLIENTE_MAIL, CLIENTE_FECHA_NACIMIENTO --FALTA DOMICILIO
    FROM gd_esquema.Maestra
    WHERE 1=1
    AND CLIENTE_NOMBRE IS NOT NULL 
    --, FALTA DOMICILIO
    ORDER BY 1
END
GO

CREATE PROCEDURE GESTIONANDING.MIGRAR_ENVIO
AS
BEGIN
    -- PK es ENVIO_NRO, autoincremental
    INSERT INTO GESTIONANDING.ENVIO (
        --ENVIO_TICKET,
        ENVIO_COSTO,
        ENVIO_FECHA_PROGRAMADA,
        ENVIO_HORA_INICIO,
        ENVIO_HORA_FIN,
        --ENVIO_CLIENTE,
        ENVIO_ESTADO,
        ENVIO_FECHA_ENTREGA
    )
    SELECT
        --FK DEL TICKET
        ENVIO_COSTO,
        ENVIO_FECHA_PROGRAMADA,
        ENVIO_HORA_INICIO,   
        ENVIO_HORA_FIN,
        --FK DEL CLIENTE
        ENVIO_ESTADO,
        ENVIO_FECHA_ENTREGA
    FROM gd_esquema.Maestra
    WHERE ENVIO_COSTO IS NOT NULL   --campo al azar
    /*
    no hay envios con campos nulos ni envios que se repitan.
    solo se repite un registro con todas las columnas null.
    */
END
GO

CREATE PROCEDURE GESTIONANDING.TICKET
AS
BEGIN
    INSERT INTO GESTIONANDING.TICKET (
        TICKET_NUMERO,     --PK                
        TICKET_FECHA_HORA,                 
        --TICKET_CAJA,                       
        --TICKET_EMPLEADO,                   
        TICKET_TIPO_COMPROBANTE,           
        TICKET_SUBTOTAL_PRODUCTOS,         
        TICKET_TOTAL_DESCUENTO_PROMOCIONES,
        TICKET_TOTAL_DESCUENTO_APLICADO_MP,
        TICKET_TOTAL_TICKET              
    )
    SELECT distinct
        TICKET_NUMERO,
        TICKET_FECHA_HORA,
        --FK DE LA CAJA
        --FK DEL EMPLEADO
        TICKET_TIPO_COMPROBANTE,
        TICKET_SUBTOTAL_PRODUCTOS,
        TICKET_TOTAL_DESCUENTO_APLICADO,
        TICKET_TOTAL_DESCUENTO_APLICADO_MP,
        TICKET_TOTAL_ENVIO,
        TICKET_TOTAL_TICKET
    FROM gd_esquema.Maestra
    /*
    17.069 tickets donde no se repite el numero. En la tabla todos
    se repiten por cada item que tenga.
    */
END
GO

-- Fin crear Procedimientos


-- Inicio Invocaciones de procedimientos
--* Migración de tablas paramétricas sin dependencias

--* Migración de tablas paramétricas con dependencias

--* Migración de tablas no paramétricas

-- Fin Invocaciones de procedimientos

