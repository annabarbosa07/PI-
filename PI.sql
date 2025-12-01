DROP DATABASE if exists Pi;
Create DATABASE Pi;
use Pi;

CREATE TABLE ADMINISTRADOR (
    id_administrador INT AUTO_INCREMENT, 
    nome VARCHAR(255),
    email VARCHAR(255),
    cpf VARCHAR(14),
    PRIMARY KEY (id_administrador)
) ENGINE=InnoDB;

CREATE TABLE USUARIO (
    id_usuario INT AUTO_INCREMENT, 
    cpf VARCHAR(14),
    nome VARCHAR(255),
    PRIMARY KEY (id_usuario)
) ENGINE=InnoDB;

CREATE TABLE gerencia (
    
    fk_USUARIO_id_usuario INT, 
    fk_ADMINISTRADOR_id_administrador INT,
    
    PRIMARY KEY (fk_USUARIO_id_usuario, fk_ADMINISTRADOR_id_administrador),
    FOREIGN KEY (fk_USUARIO_id_usuario) 
        REFERENCES USUARIO (id_usuario)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
        
    FOREIGN KEY (fk_ADMINISTRADOR_id_administrador) 
        REFERENCES ADMINISTRADOR (id_administrador)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE LOGIN (
    id_login INT AUTO_INCREMENT, 
    username VARCHAR(100),
    password_hash VARCHAR(255),
    fk_USUARIO_id INT, 
		PRIMARY KEY (id_login),
	    FOREIGN KEY (fk_USUARIO_id) 
        REFERENCES USUARIO (id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE COMPUTADOR (
    id_maquina INT AUTO_INCREMENT, 
    endereco_mac VARCHAR(17),
    PRIMARY KEY (id_maquina)
) ENGINE=InnoDB;

INSERT INTO ADMINISTRADOR (nome, email, cpf) VALUES
('Ana Clara Lima', 'ana.clara@empresa.com.br', '123.456.789-01');

INSERT INTO USUARIO (cpf, nome) VALUES
('987.654.321-09', 'Bruno Silva Rocha');

INSERT INTO LOGIN (username, password_hash, fk_USUARIO_id) VALUES
('bruno.s', '1a2b3c4d5e6f7g8h9i0j', 1);

INSERT INTO COMPUTADOR (endereco_mac) VALUES
('0A:1B:2C:3D:4E:5F');

SELECT * FROM ADMINISTRADOR;
SELECT * FROM USUARIO;
SELECT * FROM COMPUTADOR;
SELECT * FROM gerencia;

SELECT nome, email FROM ADMINISTRADOR
WHERE cpf = '123.456.789-01';

SELECT id_maquina FROM COMPUTADOR
WHERE endereco_mac = '0A:1B:2C:3D:4E:5F';

SELECT
    L.username,
    U.nome AS Nome_Completo_Usuario,
    U.cpf
FROM
    LOGIN AS L
INNER JOIN
    USUARIO AS U ON L.fk_USUARIO_id = U.id_usuario
WHERE
    L.username = 'bruno.s';

SELECT
    A.nome AS Nome_Administrador,
    U.nome AS Nome_Usuario,
    U.cpf AS CPF_Usuario
FROM
    gerencia AS G -- Tabela de ligação
INNER JOIN
    ADMINISTRADOR AS A ON G.fk_ADMINISTRADOR_id_a = A.id_administrador
INNER JOIN
    USUARIO AS U ON G.fk_USUARIO_id_usuario = U.id_usuario;
    
    
