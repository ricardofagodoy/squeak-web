CREATE TABLE status (
	id int not null,
	tipo varchar(50) not null,
	primary key(id)
);

INSERT INTO status VALUES(1, 'Comum');
INSERT INTO status VALUES(2, 'Bloqueado');
INSERT INTO status VALUES(3, 'Administrador');


CREATE TABLE usuario (
	id int not null AUTO_INCREMENT,
	nome varchar(50) not null,
	senha varchar(50) not null,
	email varchar(100),
	sexo varchar(1),
	idade int,
	status int,
	FOREIGN KEY (status) REFERENCES status(id),
	primary key(id)
);

INSERT INTO usuario VALUES(null, 'Ricardo', '123', 'ricardofagodoy@gmail.com', 'M', 20, 3);


CREATE TABLE mensagem (
	id int not null AUTO_INCREMENT,
	texto varchar(200) not null,
	data datetime not null,
	usuario int not null,
	FOREIGN KEY (usuario) REFERENCES usuario(id),
	primary key(id)
);

INSERT INTO mensagem VALUES(null, 'Bem-vindo ao Squeak :)', '2014-12-05 12:50:00', 1);