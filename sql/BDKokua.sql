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
contraseña varchar(1000),
correoPG varchar(100),
idTipoUsuario int(10)
);

create table administrador(
idAdmin INT AUTO_INCREMENT PRIMARY KEY,
nombreAdmin varchar(100),
correoAdmin varchar(100),
contraAdmin varchar(20),
idTipoUsuario int(10)
);

create table mensajes(
id_mens int auto_increment primary key not null,
mensaje text,
hora_men datetime,
usuario_envia nvarchar(50),
tipo_usuario int,
idPG int
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


insert into publicoG values(1, "Jero", "2341", "jero.@gmail.com",  1);
insert into publicoG values(2, "Mel","3412", "mel.@gmail.com", 1);
insert into publicoG values(3, "Jaque","4123", "jaque.@gmail.com", 1);
insert into publicoG values(4, "Nani", "1234","nani.@gmail.com", 1);


select * from publicoG;
select * from mensajes;