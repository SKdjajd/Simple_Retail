-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-04-15 15:19:27 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE Auditoria_Precios 
    ( 
     Id_auditoria    NUMBER (10)  NOT NULL , 
     aud_ID_Producto NUMBER (10)  NOT NULL , 
     nombre_producto VARCHAR2 (100) , 
     precio_anterior NUMBER , 
     precio_nuevo    NUMBER , 
     fecha_cambio    DATE 
    ) 
;

ALTER TABLE Auditoria_Precios 
    ADD CONSTRAINT Auditoria_Precios_PK PRIMARY KEY ( Id_auditoria ) ;

CREATE TABLE Categoria 
    ( 
     ID_categoria NUMBER (10)  NOT NULL , 
     Nombre       VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE Categoria 
    ADD CONSTRAINT Categoria_PK PRIMARY KEY ( ID_categoria ) ;

CREATE TABLE Ciudad 
    ( 
     ID_Ciudad        NUMBER (10)  NOT NULL , 
     Nombre           VARCHAR2 (100)  NOT NULL , 
     Region_ID_Region NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE Ciudad 
    ADD CONSTRAINT Ciudad_PK PRIMARY KEY ( ID_Ciudad ) ;

CREATE TABLE Clientes 
    ( 
     ID_CLI         NUMBER (10)  NOT NULL , 
     Nombre         VARCHAR2 (100)  NOT NULL , 
     "Apellido pat" VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE Clientes 
    ADD CONSTRAINT Clientes_PK PRIMARY KEY ( ID_CLI ) ;

CREATE TABLE Departamento 
    ( 
     ID_DPTO NUMBER (10)  NOT NULL , 
     nombre  VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE Departamento 
    ADD CONSTRAINT Departamento_PK PRIMARY KEY ( ID_DPTO ) ;

CREATE TABLE Detalle_venta 
    ( 
     ID_Detalle            NUMBER (100)  NOT NULL , 
     Ventas_ID_venta       NUMBER (10)  NOT NULL , 
     Productos_ID_Producto NUMBER (100)  NOT NULL , 
     Cantidad              NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE Detalle_venta 
    ADD CONSTRAINT Detalle_venta_PK PRIMARY KEY ( ID_Detalle ) ;

CREATE TABLE Empleados 
    ( 
     ID_empleado          NUMBER (10)  NOT NULL , 
     Nombre               VARCHAR2 (100)  NOT NULL , 
     Apellido_Pat         VARCHAR2 (100)  NOT NULL , 
     Departamento_ID_DPTO NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE Empleados 
    ADD CONSTRAINT Empleados_PK PRIMARY KEY ( ID_empleado ) ;

CREATE TABLE Productos 
    ( 
     ID_Producto            NUMBER (100)  NOT NULL , 
     Nombre                 VARCHAR2 (100)  NOT NULL , 
     Categoria_ID_categoria NUMBER (10)  NOT NULL , 
     Marca                  VARCHAR2 (100)  NOT NULL , 
     Stock_Actual           VARCHAR2 (100)  NOT NULL , 
     Precio_unitario        VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE Productos 
    ADD CONSTRAINT Productos_PK PRIMARY KEY ( ID_Producto ) ;

CREATE TABLE Region 
    ( 
     ID_Region NUMBER (10)  NOT NULL , 
     Nombre    VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE Region 
    ADD CONSTRAINT Region_PK PRIMARY KEY ( ID_Region ) ;

CREATE TABLE Ventas 
    ( 
     ID_venta              NUMBER (10)  NOT NULL , 
     Fecha_Emision         DATE  NOT NULL , 
     Ciudad_ID_Ciudad      NUMBER (10)  NOT NULL , 
     Empleados_ID_empleado NUMBER (10)  NOT NULL , 
     Clientes_ID_CLI       NUMBER (10)  NOT NULL , 
     Tipo_movim            VARCHAR2 (10) 
    ) 
;

ALTER TABLE Ventas 
    ADD CONSTRAINT Ventas_PK PRIMARY KEY ( ID_venta ) ;

ALTER TABLE Auditoria_Precios 
    ADD CONSTRAINT Auditoria_Precios_Productos_FK FOREIGN KEY 
    ( 
     aud_ID_Producto
    ) 
    REFERENCES Productos 
    ( 
     ID_Producto
    ) 
;

ALTER TABLE Ciudad 
    ADD CONSTRAINT Ciudad_Region_FK FOREIGN KEY 
    ( 
     Region_ID_Region
    ) 
    REFERENCES Region 
    ( 
     ID_Region
    ) 
;

ALTER TABLE Detalle_venta 
    ADD CONSTRAINT Detalle_venta_Productos_FK FOREIGN KEY 
    ( 
     Productos_ID_Producto
    ) 
    REFERENCES Productos 
    ( 
     ID_Producto
    ) 
;

ALTER TABLE Detalle_venta 
    ADD CONSTRAINT Detalle_venta_Ventas_FK FOREIGN KEY 
    ( 
     Ventas_ID_venta
    ) 
    REFERENCES Ventas 
    ( 
     ID_venta
    ) 
;

ALTER TABLE Empleados 
    ADD CONSTRAINT Empleados_Departamento_FK FOREIGN KEY 
    ( 
     Departamento_ID_DPTO
    ) 
    REFERENCES Departamento 
    ( 
     ID_DPTO
    ) 
;

ALTER TABLE Productos 
    ADD CONSTRAINT Productos_Categoria_FK FOREIGN KEY 
    ( 
     Categoria_ID_categoria
    ) 
    REFERENCES Categoria 
    ( 
     ID_categoria
    ) 
;

ALTER TABLE Ventas 
    ADD CONSTRAINT Ventas_Ciudad_FK FOREIGN KEY 
    ( 
     Ciudad_ID_Ciudad
    ) 
    REFERENCES Ciudad 
    ( 
     ID_Ciudad
    ) 
;

ALTER TABLE Ventas 
    ADD CONSTRAINT Ventas_Clientes_FK FOREIGN KEY 
    ( 
     Clientes_ID_CLI
    ) 
    REFERENCES Clientes 
    ( 
     ID_CLI
    ) 
;

ALTER TABLE Ventas 
    ADD CONSTRAINT Ventas_Empleados_FK FOREIGN KEY 
    ( 
     Empleados_ID_empleado
    ) 
    REFERENCES Empleados 
    ( 
     ID_empleado
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
