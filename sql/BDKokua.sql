drop database kokua;
create database kokua;

use kokua;

create table imagenes(
idImagen INT AUTO_INCREMENT PRIMARY KEY,
nombreImagen varchar(20),
imagen LONGBLOB
);

create table lecciones(
idLeccion INT AUTO_INCREMENT PRIMARY KEY,
nombreLeccion varchar(60),
contenidoLeccion text
);

create table progreso(
idProgreso INT AUTO_INCREMENT PRIMARY KEY,
progreso text
);

create table lecturas(
idLecturas INT AUTO_INCREMENT PRIMARY KEY,
nombreLectura varchar(60),
contenidoLectura text
);

create table publicoG(
idPG INT AUTO_INCREMENT PRIMARY KEY,
nombrePG varchar(100),
contraseña varchar(20),
correoPG varchar(100)
);

create table administrador(
idAdmin INT AUTO_INCREMENT PRIMARY KEY,
nombreAdmin varchar(100),
correoAdmin varchar(100),
contraAdmin varchar(20)
);

create table leccionesPG(
idLeccionesPG INT AUTO_INCREMENT PRIMARY KEY,
idPG int,
idLeccion int,
FOREIGN KEY (idPG) REFERENCES publicoG(idPG),
FOREIGN KEY (idLeccion) REFERENCES lecciones(idLeccion)
);

create table lecturasPG(
idLecturasPG INT AUTO_INCREMENT PRIMARY KEY,
idPG int,
idLecturas int,
FOREIGN KEY (idPG) REFERENCES publicoG(idPG),
FOREIGN KEY (idLecturas) REFERENCES lecturas(idLecturas)
);

create table AdminPG(
idAdminPG INT AUTO_INCREMENT PRIMARY KEY,
idPG int,
idAdmin int,
FOREIGN KEY (idPG) REFERENCES publicoG(idPG),
FOREIGN KEY (idAdmin) REFERENCES administrador(idAdmin)
);

select * from publicoG;