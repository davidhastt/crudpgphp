--studiof.sql
--Según el diagrama ER tenemos que empezar creando la tabla personas

--tabla personas
CREATE TABLE personas(
id_persona SERIAL PRIMARY KEY,
nombre VARCHAR(50),
apaterno VARCHAR(50),
amaterno VARCHAR(50),
rol INT
);
--tabla productos
CREATE TABLE productos(
	id_producto SERIAL PRIMARY KEY,
	nom_producto VARCHAR(50),
	precio DECIMAL(10,2)
);
--Provedores
CREATE TABLE provedores(
id_provedor SERIAL PRIMARY KEY,
nom_provedor VARCHAR(25)
);
--Paquetes
CREATE TABLE paquetes(
id_paquete SERIAL PRIMARY KEY,
nom_paquete VARCHAR(25)
);

--Tabla eventos

CREATE TABLE eventos(
id_evento SERIAL PRIMARY KEY,
nom_evento VARCHAR(20),
tipo_evento INT,
fecha DATE,
autorizaRS BOOLEAN,
observaciones VARCHAR,
id_paquete INT NOT NULL
);
--Tabla lugares
CREATE TABLE lugares(
id_lugar SERIAL PRIMARY KEY,
nom_lugar VARCHAR(100),
tipo_lugar INT,
direccion VARCHAR(100),
id_evento INT NOT NULL,
x DECIMAL(10,2),
y DECIMAL (10,2)
);

--Tabla abonos

CREATE TABLE abonos(
id_abono SERIAL PRIMARY KEY,
id_evento INT NOT NULL,
importe DECIMAL(8,2)
);

--Tabla personas_eventos
CREATE TABLE personas_eventos(
id_p_e SERIAL PRIMARY KEY,
id_evento INT NOT NULL,
id_persona INT NOT NULL
);

--Tabla paquetes_productos

CREATE TABLE paquetes_productos(
id_pp SERIAL PRIMARY KEY,
id_producto INT NOT NULL,
id_paquete INT NOT NULL,
cantidadProducto INT
);

--Tabla productos_provedores

CREATE TABLE productos_provedores(
id_pro_pro SERIAL PRIMARY KEY,
id_producto INT NOT NULL,
id_provedor INT NOT NULL
);


--Falta poner las referencias y crear las filas de la tabla


--Crear indices dentro de los campos que fungiran como llaves foraneas
--El nombre del indice de la tabla abonos es:idx_abonos_eventos
CREATE INDEX idx_abonos_eventos ON abonos(id_evento);
--Indice de llave foranea de la tabla lugares
CREATE INDEX idx_lugares_eventos ON lugares(id_evento);
--Indices de la tabla eventos
CREATE INDEX idx_eventos_paquetes ON eventos(id_paquete);
CREATE INDEX idx_eventos_personas ON eventos(id_persona);

--Indices personas-eventos
CREATE INDEX idx_personas_eventoIdevento ON personas_eventos(id_evento);
CREATE INDEX idx_personas_eventoIdPersona ON personas_eventos(id_persona);
--paquetes-productos
CREATE INDEX idx_paquetes_productos_id_producto ON paquetes_productos(id_producto);
CREATE INDEX idx_paquetes_productos_id_paquete ON paquetes_productos(id_paquete);
--indices de la tabla productos_provedores
CREATE INDEX idx_productos_provedores_id_producto ON productos_provedores(id_producto);
CREATE INDEX idx_productos_provedores_id_provedor ON productos_provedores(id_provedor);

--CREAR LLAVES FORANEAS
--Tabla eventos
--constraint = restriccion de integridad = regla , pero para que usar reglas?? 
--para evitar inconsistencias en los datos

ALTER TABLE eventos 
ADD CONSTRAINT fk_id_paquete
FOREIGN KEY (id_paquete)
REFERENCES paquetes(id_paquete);


ALTER TABLE eventos 
ADD CONSTRAINT fk_id_persona
FOREIGN KEY (id_persona)
REFERENCES personas(id_persona);

--Tabla abonos

ALTER TABLE abonos
ADD CONSTRAINT fk_id_eventos
FOREIGN KEY (id_evento)
REFERENCES eventos(id_evento);

--Personas_eventos
ALTER TABLE personas_eventos
ADD CONSTRAINT fk_id_evento
FOREIGN KEY (id_evento)
REFERENCES eventos(id_evento);

ALTER TABLE personas_eventos
ADD CONSTRAINT fk_id_persona
FOREIGN KEY (id_persona)
REFERENCES personas(id_persona);

--paquetes_productos

ALTER TABLE paquetes_productos
ADD CONSTRAINT fk_id_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);


ALTER TABLE paquetes_productos
ADD CONSTRAINT fk_id_paquete
FOREIGN KEY (id_paquete)
REFERENCES paquetes(id_paquete);

--proudctos_provedores

ALTER TABLE productos_provedores
ADD CONSTRAINT fk_id_producto
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);

ALTER TABLE productos_provedores
ADD CONSTRAINT fk_id_provedor
FOREIGN KEY (id_provedor)
REFERENCES provedores(id_provedor);

--lugares

ALTER TABLE lugares
ADD CONSTRAINT fk_id_evento
FOREIGN KEY (id_evento)
REFERENCES eventos(id_evento);


--------------INSERTS---------------------

-- Inserts de la tabla personas
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('David Germán', 'Gomez', 'Millan',0);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Mario Ivan', 'Martinez', 'Gutierrez',1);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Santiago','Vilchis','Solano',1);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Axel Aaron','Rojas','Paredes',2);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Emmanuel','Treviño','Cortez',2);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Miguel Angel','Romero','Moreno',3);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Cintia','Castillo','Garcia',4);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Erick','Estrada','Diaz',3);
INSERT INTO personas(nombre, apaterno, amaterno, rol) VALUES ('Erandi Danae','Martinez','Arista',4);

--inserts de la tabla productos
INSERT INTO productos(nom_producto, precio) VALUES('Marco N1 con ampliacion y textura',1300);
INSERT INTO productos(nom_producto, precio) VALUES('Foto tamaño 10x15cm',10);
INSERT INTO productos(nom_producto, precio) VALUES('Impresion tamaño doble carta',80);
INSERT INTO productos(nom_producto, precio) VALUES('Taza personalizada',100);
INSERT INTO productos(nom_producto, precio) VALUES('Album con portada personalizada 100 fotos 10x15cm',600);
INSERT INTO productos(nom_producto, precio) VALUES('USB',150);
INSERT INTO productos(nom_producto, precio) VALUES('Edicion de video',1500);
INSERT INTO productos(nom_producto, precio) VALUES('Galeria fotográfica',300);
INSERT INTO productos(nom_producto, precio) VALUES('Marco NA 40x50 cm con textura',1700);
INSERT INTO productos(nom_producto, precio) VALUES('Foto tamaño 13x18cm',15);
INSERT INTO productos(nom_producto, precio) VALUES('Album con portada personalizada 200 fotos 13x18cm',700);
INSERT INTO productos(nom_producto, precio) VALUES('Estuche para usb',800);
INSERT INTO productos(nom_producto, precio) VALUES('Marco tamaño carta',500);
INSERT INTO productos(nom_producto, precio) VALUES('Calendario',80);
INSERT INTO productos(nom_producto, precio) VALUES('Marco dorado con textura 40x50cm',2000);
INSERT INTO productos(nom_producto, precio) VALUES('Fotobook',3500);

--provedores
INSERT INTO provedores(nom_provedor) VALUES('SuritiFotos');
INSERT INTO provedores(nom_provedor) VALUES('Imprenta1000');

--inserts de la  tabla paquetes
INSERT INTO paquetes(nom_paquete) VALUES ('Bronce');
INSERT INTO paquetes(nom_paquete) VALUES ('Plata');
INSERT INTO paquetes(nom_paquete) VALUES ('Oro');

--eventos
INSERT INTO eventos (nom_evento, tipo_evento, fecha, autorizaRS, observaciones, id_paquete) VALUES ('XV años de rubi',2,'15/02/2015',TRUE,'Habra banda, chiva, mariachi',3);
INSERT INTO eventos (nom_evento, tipo_evento, fecha, autorizaRS, observaciones, id_paquete) VALUES ('Luisa Y José',1,'20/06/2026',FALSE,'Boda cristiana',2);
INSERT INTO eventos (nom_evento, tipo_evento, fecha, autorizaRS, observaciones, id_paquete) VALUES ('Bautizo Jimena',6,'20/09/2026',TRUE,'Grabar el bolo',1);
INSERT INTO eventos (nom_evento, tipo_evento, fecha, autorizaRS, observaciones, id_paquete) VALUES ('Boda de plata',4,'18/09/2026',TRUE,'Grabar los agradecimientos de los padrinos',3);
INSERT INTO eventos (nom_evento, tipo_evento, fecha, autorizaRS, observaciones, id_paquete) VALUES ('Baby Shower',7,'8/10/2026',TRUE,'Grabar concursos',1);


--lugares
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Casa de la quinceañera',3,'Av. Hidalgo 3005',1,-99.6385506882672,19.2898924151024);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Casa de la novia',2,'El Seminario Primera Secc, 50170 Toluca de Lerdo, Méx.',2,-99.670148,19.274412);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Casa del novio',1,'Morelos Segunda Secc, 50120 Toluca de Lerdo, Méx.',2,-99.663418,19.276712);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Iglesia',5,'Américas Cárdenas, 50130 Toluca de Lerdo',2,-99.6463500725662,19.2793064611143);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Salon de fiestas Maria Cristina',7,'Fray. J. de S. Alberto 206-204',2,-99.675121,19.289997);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Iglesia',5,'Américas Cárdenas, 50130 Toluca de Lerdo',3,-99.6463500725662,19.2793064611143);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Jarin de eventos Los Olmos',7,'Av. Sebastián Lerdo de Tejada 912, Electricistas Locales, 50040 Toluca de Lerdo, Méx.',3,-99.6752438771873,19.2891170242734);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Parroquia Universitaria',5,'Av. Paseo Tollocan 1615-Interior 1, Nueva Oxtotitlán, 50110 Toluca de Lerdo, Méx.',4,-99.6810135710705,19.2846598097497);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('El patio de martha Toluca',7,'Av Sta Elena Manzana 004, Rincón de San Lorenzo, 50017 San Lorenzo Tepaltitlán, Méx.',4,-99.6150755881405,19.3079437618801);
INSERT INTO lugares(nom_lugar, tipo_lugar, direccion, id_evento,x,y) VALUES ('Mirema Kids & Banquetes',7,'C. Francisco Villa 208, La Magdalena, 50010 Santa Cruz Atzcapotzaltongo, Méx.',5,-99.6429947999139,19.3179899009186);

--abonos
INSERT INTO abonos(id_evento, importe) VALUES(1,500);
INSERT INTO abonos(id_evento, importe) VALUES(2,1500);
INSERT INTO abonos(id_evento, importe) VALUES(3,1200);
INSERT INTO abonos(id_evento, importe) VALUES(4,3000);
INSERT INTO abonos(id_evento, importe) VALUES(5,1800);


--inserts de la tabla productos_provedores
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (1,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (2,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (3,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (4,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (5,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (6,2);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (7,2);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (8,2);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (9,2);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (10,2);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (11,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (12,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (13,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (14,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (15,1);
INSERT INTO productos_provedores (id_producto,id_provedor) VALUES (16,2);

--inserts de la tabla paquetes productos
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (1,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (3,1,100);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (5,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (2,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (4,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (6,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (7,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (8,1,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (9,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (10,2,200);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (3,2,4);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (11,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (12,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (7,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (14,2,2);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (13,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (8,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (4,2,2);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (6,2,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (15,3,2);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (3,3,6);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (16,3,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (12,3,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (7,3,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (6,3,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (13,3,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (14,3,2);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (8,3,1);
INSERT INTO paquetes_productos(id_producto, id_paquete, cantidadProducto) VALUES (4,3,4);

--personas eventos
INSERT INTO personas_eventos(id_evento, id_persona) VALUES(1,6);
INSERT INTO personas_eventos(id_evento, id_persona) VALUES(2,7);
INSERT INTO personas_eventos(id_evento, id_persona) VALUES(3,8);
INSERT INTO personas_eventos(id_evento, id_persona) VALUES(4,9);
INSERT INTO personas_eventos(id_evento, id_persona) VALUES(5,6);