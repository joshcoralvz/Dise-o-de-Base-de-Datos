--para trabajar con llaves foraneas
PRAGMA foreign_keys = ON;

--tabla
CREATE TABLE IF NOT EXISTS pastel(
    id_pastel INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    precio TEXT
);

--tabla cliente
CREATE TABLE IF NOT EXISTS cliente(
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    comprapastel INTEGER NOT NULL,
    fechacompra TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS pastel_cliente(
    --llaves foraneaaas
    pastel_id INTEGER NOT NULL, 
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY (pastel_id) REFERENCES pastel(id_pastel),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
    PRIMARY KEY (pastel_id, cliente_id)
);

--insertar pasteeeel
INSERT INTO pastel(nombre, descripcion, precio)
VALUES('Pastel de chocolate', 'Pastel humedo', '850');
--------------------
INSERT INTO pastel(nombre, descripcion, precio)
VALUES('Pastel de zanahoria', 'Pastel con creamcheese', '990');

--insertado clientes
INSERT INTO cliente(nombre, apellido, comprapastel, fechacompra)
VALUES('Joshua', 'cornelio', 'Zanahoria', '2026-10-13');

INSERT INTO cliente(
    nombre, apellido, comprapastel, fechacompra)
VALUES(
    'Pavel', 'tavarez', 'Chocolate', '2026-10-15'
);

INSERT INTO pastel_cliente(pastel_id, cliente_id)
VALUES(1, 1),(2, 2),(2, 1);

--consulta, relacion entre tablas
SELECT 
    cliente.nombre AS nombre_cliente,
    cliente.apellido,
    pastel.nombre AS nombre_pastel,
    pastel.descripcion,
    pastel.precio,
    cliente.fechacompra
FROM pastel_cliente
INNER JOIN cliente ON pastel_cliente.cliente_id = cliente.id_cliente
INNER JOIN pastel ON pastel_cliente.pastel_id = pastel.id_pastel;
