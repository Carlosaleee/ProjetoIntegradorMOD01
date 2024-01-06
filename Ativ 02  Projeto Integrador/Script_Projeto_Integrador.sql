CREATE DATABASE projetoIntegrador
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

USE projetoIntegrador ;

CREATE TABLE usuario (

idUsuario INT NOT NULL AUTO_INCREMENT,
login VARCHAR(50) NOT NULL,
senha VARCHAR(50) NOT NULL,
ultimoLogin DATETIME NULL DEFAULT NULL,
PRIMARY KEY (idUsuario))

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX idx_loginUsuario ON usuario(login);

CREATE TABLE cliente (
  
idCliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(11) NOT NULL,
rua VARCHAR(255) NULL DEFAULT NULL,
numero VARCHAR(255) NULL DEFAULT NULL,
balneario VARCHAR(255) NULL DEFAULT NULL,
cidade VARCHAR(45) NULL DEFAULT NULL,
PRIMARY KEY (idCliente)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE telefoneCliente (
idTelefoneCliente INT NOT NULL AUTO_INCREMENT,
telefone VARCHAR(255) NOT NULL,
clienteId INT NOT NULL ,
PRIMARY KEY (idTelefoneCliente),

CONSTRAINT telefoneCliente_ibfk_1 FOREIGN KEY (ClienteId) REFERENCES cliente (idCliente) ON DELETE CASCADE
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE  cargo (

idCargo INT NOT NULL AUTO_INCREMENT,
cargo  VARCHAR(255) NULL DEFAULT NULL,
descricao  VARCHAR(255) NULL DEFAULT NULL,
salario DECIMAL(9,2) NULL DEFAULT NULL,
PRIMARY KEY (idCargo)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE cargo ADD beneficios CHAR(1) ;
ALTER TABLE cargo ADD  assistenciaMedica CHAR(1) ;
ALTER TABLE cargo ADD valeTransporte CHAR(1) ;
ALTER TABLE cargo ADD valeAlimentacao CHAR(1) ;

CREATE TABLE funcionario (
 
idFuncionario INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
dataAdmissao DATETIME NOT NULL,
dataDemissao DATETIME NOT NULL,
numcarteiraTrabalho VARCHAR(255) NULL DEFAULT NULL,
rg VARCHAR(11) NULL DEFAULT NULL,
cpf VARCHAR(11) NULL DEFAULT NULL,
rua VARCHAR(255) NULL DEFAULT NULL,
numero INT NULL DEFAULT NULL,
bairro VARCHAR(255) NULL DEFAULT NULL,
cidade VARCHAR(255) NULL DEFAULT NULL,
cargoId  INT NULL DEFAULT NULL,
usuarioId INT NULL DEFAULT NULL,
PRIMARY KEY (idFuncionario),
 
CONSTRAINT fk_funcionario_usuario FOREIGN KEY (usuarioId) REFERENCES usuario (idUsuario) ON DELETE CASCADE,
CONSTRAINT funcionario_ibfk_1 FOREIGN KEY (cargoId) REFERENCES cargo (idcargo) ON DELETE CASCADE 
) 

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE telefoneFuncionario (
idTelefoneFuncionario INT NOT NULL AUTO_INCREMENT,
telefone VARCHAR(255) NOT NULL,
funcionarioId INT NOT NULL ,
PRIMARY KEY (idTelefoneFuncionario),

CONSTRAINT telefoneFuncionario_ibfk_3 FOREIGN KEY (funcionarioId) REFERENCES funcionario (idFuncionario) ON DELETE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE venda (
idVenda INT NOT NULL AUTO_INCREMENT,
dataVenda DATETIME NULL DEFAULT NULL,
dataEntrega DATETIME NULL DEFAULT NULL,
valorTotal DECIMAL(9,2) NULL DEFAULT NULL,
clienteId INT NOT NULL,
funcionarioId INT NOT NULL,
	
PRIMARY KEY (idVenda),

CONSTRAINT venda_ibfk_1 FOREIGN KEY (clienteId) REFERENCES cliente (idCliente) ON DELETE CASCADE,
CONSTRAINT venda_ibfk_2 FOREIGN KEY (funcionarioId) REFERENCES funcionario (idFuncionario) ON DELETE CASCADE
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE  pagamento
(
idPagamento INT NOT NULL AUTO_INCREMENT,
dataPagamento DATETIME NOT NULL,
tipoPagamento CHAR(1) NOT NULL,
numeroCartao VARCHAR(16) NOT NULL,
numeroParcelas INT NOT NULL,
vendaId INT NOT NULL, 
PRIMARY KEY (idPagamento),
CONSTRAINT pagamento_ibfk_8 FOREIGN KEY (vendaId) REFERENCES venda (idVenda) ON DELETE CASCADE
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

alter table pagamento add numeroParcelas INT;

CREATE TABLE esquadria (
idEsquadria INT NOT NULL AUTO_INCREMENT,
nomeEsquadria VARCHAR(255) NOT NULL,
descricao VARCHAR(255) NULL DEFAULT NULL,
valormetroQuadrado DECIMAL (9,2),
PRIMARY KEY (idEsquadria))

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE esquadria ADD distribuidorAluminioId INT NOT NULL;
ALTER TABLE esquadria ADD CONSTRAINT esquadria_ibfk_3 FOREIGN KEY (distribuidorAluminioId) 
REFERENCES distribuidorAluminio (iddistribuidorAluminio) ON DELETE CASCADE;


CREATE TABLE distribuidorAluminio (
idDistribuidorAluminio INT NOT NULL AUTO_INCREMENT,
nomeEmpresa VARCHAR(255) NOT NULL,
cnpj varchar(255) not null,
cidade VARCHAR(100) NULL DEFAULT NULL,
PRIMARY KEY (idDistribuidorAluminio)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE telefoneDistribuidor (
IdtelefoneDistribuidor INT NOT NULL AUTO_INCREMENT,
telefone VARCHAR(255) NOT NULL,
setor VARCHAR(255) NULL DEFAULT NULL,
responsavel VARCHAR(255) NULL DEFAULT NULL,
distribuidorAluminioId INT NOT NULL ,
PRIMARY KEY (IdtelefoneDistribuidor),

CONSTRAINT distribuidor_ibfk_3 FOREIGN KEY (distribuidorAluminioId) REFERENCES distribuidorAluminio (iddistribuidorAluminio) ON DELETE CASCADE
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE itemVenda (

nomeEsquadria VARCHAR(255) NOT NULL,
quantidade  INT NOT NULL,
valorMetroQuadrado DECIMAL(9,2) NOT NULL,
altura DECIMAL(9,2) NOT NULL,
largura DECIMAL(9,2) NOT NULL,
valorUnitario DECIMAL(9,2) NOT NULL,
subTotal DECIMAL(9,2) NOT NULL,
vendaId INT NOT NULL,
esquadriaId INT NOT NULL,
PRIMARY KEY (vendaId, esquadriaId),

CONSTRAINT itemVenda_ibfk_1 FOREIGN KEY (vendaId) REFERENCES venda (idVenda) ON DELETE CASCADE,
CONSTRAINT itemVenda_ibfk_2 FOREIGN KEY (esquadriaId) REFERENCES esquadria (idEsquadria) ON DELETE CASCADE
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
