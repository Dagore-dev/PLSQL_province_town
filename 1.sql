CREATE TABLE province
(
  id INT NOT NULL,
  province VARCHAR2(25) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE town
(
  id INT NOT NULL,
  idprovince INT NOT NULL,
  town VARCHAR2(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (idprovince) REFERENCES province(id)
);

INSERT INTO province VALUES (1, 'Álava');
INSERT INTO province VALUES (2, 'Albacete');
INSERT INTO province VALUES (3, 'Alicante');
INSERT INTO province VALUES (4, 'Almería');
INSERT INTO province VALUES (5, 'Ávila');
INSERT INTO province VALUES (6, 'Badajoz');
INSERT INTO province VALUES (7, 'Baleares');
INSERT INTO province VALUES (8, 'Barcelona');
INSERT INTO province VALUES (9, 'Burgos');
INSERT INTO province VALUES (10, 'Cáceres');
INSERT INTO province VALUES (11, 'Cádiz');
