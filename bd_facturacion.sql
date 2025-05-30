--Crea la tabla PROVINCIAS que almacena información de las provincias

CREATE TABLE PROVINCIAS (
	codpro VARCHAR2(2) NOT NULL,
	nombre VARCHAR2(30) NOT NULL,
	CONSTRAINT provincias_pk PRIMARY KEY(codpro)
);

--Crea la tabla PUEBLOS que almacena información de los pueblos

CREATE TABLE PUEBLOS (

      codpue VARCHAR2(5) NOT NULL,
	  nombre VARCHAR2(40) NOT NULL,
	  codpro VARCHAR2(2) NOT NULL,
	  CONSTRAINT pueblos_pk PRIMARY KEY(codpue),
	  CONSTRAINT pueblos_provincias_fk FOREIGN KEY(codpro) REFERENCES PROVINCIAS(codpro)
);

--Crea la tabla Clientes que almacena información de los clientes

CREATE TABLE CLIENTES (

	    codcli NUMBER(5) NOT NULL,
		nombre VARCHAR2(50) NOT NULL,
		direccion VARCHAR2(50) NOT NULL,
		codpostal VARCHAR2(6),
		codpue VARCHAR2(5) NOT NULL,
		CONSTRAINT clientes_pk PRIMARY KEY(codcli),
		CONSTRAINT clientes_pueblos_fk FOREIGN KEY(codpue) REFERENCES PUEBLOS(codpue)
);

--Crea la tabla Vendedores que almacena información de los vendedores

CREATE TABLE VENDEDORES (

	   codven NUMBER(5) NOT NULL,
	   nombre VARCHAR2(50) NOT NULL,
	   direccion VARCHAR2(50) NOT NULL,
	   codpostal VARCHAR2(6),
	   codpue VARCHAR2(5) NOT NULL,
	   codjefe NUMBER(5),
	   CONSTRAINT vendedores_pk PRIMARY KEY(codven),
	   CONSTRAINT vendedores_pueblos_fk FOREIGN KEY(codpue) REFERENCES PUEBLOS(codpue)
);

--Crea la tabla Articulos que almacena información de los articulos

CREATE TABLE ARTICULOS (

		codart VARCHAR2(8) NOT NULL,
		descrip VARCHAR2(80) NOT NULL,
		precio NUMBER(7,2) NOT NULL,
		stock NUMBER(6),
		stock_min NUMBER(2),
		CONSTRAINT articulos_pk PRIMARY KEY(codart)
);

--Crea la tabla Facturas que almacena información de las facturas

CREATE TABLE FACTURAS (

		codfac NUMBER(6) NOT NULL,
		fecha DATE NOT NULL,
		codcli NUMBER(5),
		codven NUMBER(5),
		iva NUMBER(2),
		dto NUMBER(2),
		CONSTRAINT facturas_pk PRIMARY KEY(codfac),
		CONSTRAINT facturas_clientes_fk FOREIGN KEY(codcli) REFERENCES CLIENTES(codcli),
		CONSTRAINT facturas_vendedores_fk FOREIGN KEY(codven) REFERENCES VENDEDORES(codven)
);

--Crea la tabla Lineas_Fac

CREATE TABLE LINEAS_FAC (

		codfac NUMBER(6) NOT NULL,
		linea NUMBER(2) NOT NULL,
		cant NUMBER(5) NOT NULL,
		codart VARCHAR2(8) NOT NULL,
		precio NUMBER(7,2) NOT NULL,
		dto NUMBER(2),
		CONSTRAINT lineas_fac_pk PRIMARY KEY(codfac, linea),
		CONSTRAINT lineas_fac_facturas_fk FOREIGN KEY(codfac) REFERENCES FACTURAS(codfac),
		CONSTRAINT lineas_fac_articulos_fk FOREIGN KEY(codart) REFERENCES ARTICULOS(codart)
);


--Crea registros

-- Crea registros de provincias

INSERT INTO PROVINCIAS(codpro, nombre) VALUES('01', 'Buenos Aires');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('02', 'Catamarca');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('03', 'Chaco');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('04', 'Chubut');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('05', 'Córdoba');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('06', 'Corrientes');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('07', 'Entre Ríos');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('08', 'Formosa');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('09', 'Jujuy');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('10', 'La Pampa');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('11', 'La Rioja');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('12', 'Mendoza');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('13', 'Misiones');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('14', 'Neuquén');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('15', 'Río Negro');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('16', 'Salta');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('17', 'San Juan');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('18', 'San Luis');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('19', 'Santa Cruz');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('20', 'Santa Fe');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('21', 'Santiago del Estero');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('22', 'Tierra del Fuego');
INSERT INTO PROVINCIAS(codpro, nombre) VALUES('23', 'Tucumán');

-- Crea registros de los pueblos

INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12001', 'Luján de Cuyo', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12002', 'Capital', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12003', 'Maipú', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12004', 'San Rafael', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12005', 'Guaymallén', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12006', 'Godoy Cruz', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12007', 'San Martín', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12008', 'Las Heras', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12009', 'Tunuyán', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12010', 'Rivadavia', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12011', 'Junín', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12012', 'Alvear', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12013', 'San Carlos', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12014', 'Tupungato', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12015', 'Lavalle', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12016', 'Malargüe', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12017', 'La Paz', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('12018', 'Santa Rosa', '12');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01002', 'Arrecifes', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01045', 'Avellaneda', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01222', 'Balcarce', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01012', 'Berazategui', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01425', 'Bolívar', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01323', 'Campana', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01563', 'Castelli', '01');
INSERT INTO PUEBLOS (codpue, nombre, codpro) VALUES('01744', 'Chacabuco', '01');



--Crea registros de CLIENTES

INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(101, 'Aguirre Castro Johana', 'C Piedrabuena 808', 5507, '12001');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(102, 'Castro Dora J', 'Chaco 1433', 5507, '12001');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(103, 'Millan Victor A', 'Larrea Este 1258',5507,'12001');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(104, 'Navarro Vargas Julio','San Martin 2400',5507,'12001');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(105, 'Vargas Alberto','Primera Junta 256', 5507, '12001');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(106, 'Simone Antonino','Dr Brandi 167',5515,'12003');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(107, 'Catania Nancy','B°P Del Cuyo',5515,'12003');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(108, 'Lima Carlos','Cazenave 79',5515,'12003');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(109, 'Carrasco Transito','Rivas 3489',5515,'12003');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(110, 'Gomez Alejandra','Independencia 367 FOND',5515,'12003');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(111, 'Gonzales Nilda','P De Los Patos 2761',5515,'12003');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(112, 'Pereyra Concepcion','B°L Violetas I',5533,'12015');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(113, 'Perez Elina','Guanacache 253 PB FTE',5533,'12015');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(114, 'Perez Gaston','Belgrano 148',5533,'12015');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(115, 'David Perez Claudio','A Volta 867',5501,'12006');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(116, 'Fossas Perez Rodolfo','Cab Abierto 424 PB UF1',5501,'12006');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(117, 'Gimenez Perez B','M Mendocinos 1285',5501,'12006');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(118, 'Vanney Vasquez Lorena','Luzuriaga 725 1 12',5501,'12006');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(119, 'Vasquez Ramon','Necochea 2261 9 1',5501,'12006');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(120, 'Betancourt Cortez Doris','H Ferraris 2157',5501,'12006');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(121, 'Cortez Alberto','J M Godoy 1263',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(122, 'Cortez Ana','Olascoaga 2702',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(123, 'Olea Aurora','H Yrigoyen 734',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(124, 'Araujo Franco','A Del Valle 574 PB 3',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(125,'Camasa Franco','J Galagurri 608',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(126,'Chirizzi Franco','San Rafael 250 3 8',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(127,'Costa Botto Franco','Bolivia 3411',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(128,'Di Paolo Riva','Sarmiento 1963',5539,'12008');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(129,'Digiano Javier','Arenales 187',6550,'01425');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(130,'Antognazza Marta','Zapiola 222',6550,'01425');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(131,'Bazan Marta','A Funes 783',6550,'01425');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(132,'Alcain Carlos','J C Boer 525',6550,'01425');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(133,'Abizanda Carlos','Homero 1012',1439,'01045');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(134,'Aguergaray Carlos','Av B Mitre 750 2',1439,'01045');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(135,'Alba Carlos','Av J La Salle 1768',1439,'01045');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(136,'Acedo Mirta','Av Centenario 1725',7620,'01222');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(137,'D Elia Mirta','Calle 40 1133',7620,'01222');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(138,'Ardans Pablo','Calle 26 691',7620,'01222');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(139,'Bornatici Pablo','B°Avenida 2',7620,'01222');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(140,'Bustamante Pablo','Calle 31 384 FDO',7620,'01222');
INSERT INTO CLIENTES(codcli, nombre, direccion, codpostal, codpue) VALUES(141,'Paez Facundo','Hudson 786',7620,'12003');

-- Crea registros de VENDEDORES

INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (1,'Agapito Pablo','Ant Argentina 681','5500','12002',NULL);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (2,'Abarzua Carlos','Paso D L Andes 1928 PB CASA','5500','12002',1);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (3,'Bahamonde Pedro','F Alcorta 636','5500','12002',1);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (4,'Amato Carla','Los Ceibos 516','5539','12008',2);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (5,'Arias Carla','Sucre 2312 PB 1','5539','12008',2);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (6,'Stagnoli Lautaro','Los Horcones 2871','5539','12008',2);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (7,'Diaz Diego','Alvear 495','5539','12008',3);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (8,'Martinq Diego','San Luis 953','5539','12008',3);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (9,'Carrera Sebastian','M Tejeda 1940','5539','12008',3);
INSERT INTO VENDEDORES(codven,nombre,direccion,codpostal,codpue,codjefe) VALUES (10,'Gottardo Sebastian','Saavedra 272 4','5539','12008',3);


-- Crea registros de ARTICULOS
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0001','cuadernos laprida x50 hojas',139.0,50,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0002','cuadernos avon A4 x 80 hojas',120.0,100,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0003','gomas evas',40.0,20,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0004','cartulinas',16.0,30,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0005','creppe',22.0,50,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0006','afiche',24.0,200,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0007','papel para forrar liso o lunares',37.0,20,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0008','cintas sticko',38.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0009','voligomas',55.0,30,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0010','gomas maped',25.0,50,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0011','tijeras escolares',65.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0012','caja de lapices de colores faber',68.0,30,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0013','caja de fibras largas faber x 10',57.0,30,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0014','tijera maped punta redonda',26.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0015','caja de plastipinturitas jovi x 12',37.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0016','caja de plastilinas maped x 10',32.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0017','marcadores pelikan punta redonda al agua V/colores.',23.0,30,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0018','caja de tizas de colores alborada x 10',25.0,50,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0019','caja de tizas blancas x 10 alborada',18.0,100,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0020','voligomas chicas',13.0,30,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0021','plasticolas de color',21.0,30,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0022','plasticola glitter',27.0,20,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0023','brillantinas',3.0,50,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0024','sobres de papel glace común',2.0,100,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0025','sobres de papel glace metalizado',3.0,100,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0026','potes de tempera model',44.0,50,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0027','block luma color oficio (vienen x 100 hojas color surtidas)',79.5,20,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0028','paquete de palitos de helados naturales',17.0,100,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0029','paquete de palitos de helados de colores',73.0,100,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0030','Cuadernos t/ Dura 4Shjs laprida rayado',45.0,25,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0031','block fantasia el nene animal print',99.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0032','block luma n5 negro',25.0,50,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0033','block color n5 luma',35.0,50,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0034','block color n6 luma',70.0,50,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0035','plasticolas 90grs',31.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0036','caja de 12 lapices trabi',50.0,10,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0037','sobre Papel glace metalizado',3.0,200,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0038','fibrones al agua',18.0,20,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0039','pote de masa color',45.0,50,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0040','plasticola color marca sta',7.0,20,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0045','goma eva con glitter',45.0,20,2);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0048','pote de masa',45.0,15,5);
INSERT INTO ARTICULOS(codart,descrip,precio,stock,stock_min) VALUES ('AR0049','pote de ceramica',50.0,0,5);


-- Crea registros de FACTURAS


INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto)VALUES(1,TO_DATE('26-Apr-2021','DD-MM-YYYY'),128,4,NULL,0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(2, TO_DATE('02-Aug-2021','DD-MM-YYYY'), 104,4,NULL,0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(3, TO_DATE('19-Oct-2021','DD-MM-YYYY'), 140, 6,18,25);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(4, TO_DATE('04-Nov-2021','DD-MM-YYYY'), 115, 9, 18, 25);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(5, TO_DATE('15-Nov-2021','DD-MM-YYYY'), 120, 9, 21, 20);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(6, TO_DATE('05-Dec-2021','DD-MM-YYYY'), 119, 6, 21, 20);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(7, TO_DATE('03-Feb-2022','DD-MM-YYYY'), 106, 6, 21, 0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(8, TO_DATE('27-Feb-2022','DD-MM-YYYY'), 108, 5, 18, 0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(9, TO_DATE('05-May-2022','DD-MM-YYYY'), 124, 10, 21, 0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(10, TO_DATE('10-Jun-2022','DD-MM-YYYY'), 138, 7,NULL,30);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(11, TO_DATE('15-Aug-2022','DD-MM-YYYY'), 113, 8, 21, 10);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(12, TO_DATE('22-Aug-2022','DD-MM-YYYY'), 115, 7, 16, 0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(13, TO_DATE('03-Feb-2023','DD-MM-YYYY'), 111, 4, 8, 0);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(14, TO_DATE('15-Feb-2023','DD-MM-YYYY'), 129, 10, 16, 10);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(15, TO_DATE('09-Mar-2023','DD-MM-YYYY'), 118, 5, 21, 10);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(16, TO_DATE('20-Mar-2023','DD-MM-YYYY'), 119, 6, 21, 15);
INSERT INTO FACTURAS(codfac, fecha, codcli, codven, iva, dto) VALUES(17, TO_DATE('10-Apr-2023','DD-MM-YYYY'), 117, 8,NULL, 15);

--Crea registros de LINEAS_FAC

INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00001,1,1,'AR0001',139.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00001,2,2,'AR0002',120.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00001,3,3,'AR0030',45.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00002,1,1,'AR0031',99.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00002,2,2,'AR0032',25.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00002,3,2,'AR0033',35.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00002,4,2,'AR0034',70.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00002,5,3,'AR0027',79.5,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00003,1,15,'AR0040',7.0,15);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00003,2,5,'AR0035',31.0,10);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00004,1,5,'AR0004',16.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00004,2,5,'AR0006',24.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00004,3,2,'AR0022',27.0,5);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00004,4,3,'AR0023',3.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00004,5,10,'AR0028',17.0,10);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00004,6,10,'AR0029',73.0,10);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00005,1,3,'AR0012',68.0,20);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00005,2,3,'AR0013',57.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00006,1,5,'AR0003',40.0,20);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00006,2,5,'AR0045',45.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00007,1,10,'AR0009',55.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00007,2,10,'AR0011',65.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00007,3,10,'AR0024',2.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00007,4,10,'AR0037',3.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00008,1,25,'AR0004',16.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00008,2,25,'AR0014',26.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00008,3,10,'AR0016',32.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00009,1,1,'AR0018',25.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00009,2,2,'AR0004',16.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00009,3,1,'AR0019',18.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00009,4,3,'AR0033',35.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00010,1,4,'AR0002',120.0,25);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00010,2,4,'AR0009',55.0,5);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00010,3,4,'AR0010',25.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00011,1,5,'AR0021',21.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00011,2,2,'AR0022',27.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00011,3,5,'AR0023',3.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00011,4,2,'AR0027',79.5,10);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00012,1,1,'AR0032',25.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00012,2,1,'AR0033',35.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00012,3,1,'AR0034',70.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00013,1,1,'AR0013',57.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00013,2,3,'AR0024',2.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00013,3,3,'AR0025',3.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00013,4,1,'AR0035',31.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00014,1,2,'AR0012',68.0,10);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00014,2,2,'AR0013',57.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00014,3,3,'AR0017',23.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00015,1,5,'AR0039',45.0,5);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00015,2,5,'AR0048',45.0,5);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00016,1,5,'AR0004',16.0,10);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00016,2,3,'AR0005',22.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00016,3,10,'AR0006',24.0,5);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00017,1,10,'AR0018',25.0,0);
INSERT INTO LINEAS_FAC(codfac, linea, cant, codart, precio, dto) VALUES(00017,2,10,'AR0019',18.0,15);

