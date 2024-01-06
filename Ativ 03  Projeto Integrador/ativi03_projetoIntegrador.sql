-- ----------------------------------------------------------------------------------------------------------------------------- --
--                                         P R O J E T O   I N T E G R A D O R
--                                              A T I V I D A D E  -  03
-- ----------------------------------------------------------------------------------------------------------------------------- --

USE projetoIntegrador;

-- -------------------------------------------------------------------------------------------------------------------------------
-- 1 - Ajuste questões de segurança, incluindo usuários, papéis e
-- permissões.
-- -------------------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------
-- Criar Usuario especifico para admin
-- -------------------------------------------

CREATE USER 'admin'@'localhost' IDENTIFIED BY '123456A';

GRANT ALL PRIVILEGES ON projetoIntegrador.* TO 'admin'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'admin'@'localhost';

-- -------------------------------------------
-- Criar Usuario especifico para Proprietario
-- -------------------------------------------

CREATE USER 'proprietario'@'localhost' IDENTIFIED BY '123456B';

GRANT SELECT, UPDATE, INSERT, DELETE ON projetoIntegrador.* TO 'proprietario'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'proprietario'@'localhost';

-- -------------------------------------------
-- Criar Usuario especifico para Gerente
-- -------------------------------------------

CREATE USER 'gerente'@'localhost' IDENTIFIED BY '123456C';

GRANT SELECT, UPDATE, INSERT, DELETE ON projetoIntegrador.* TO 'gerente'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'gerente'@'localhost';

-- -------------------------------------------
-- Criar Usuario especifico para Vendedor
-- -------------------------------------------

CREATE USER 'vendedor'@'localhost' IDENTIFIED BY '123456F';

GRANT SELECT, UPDATE, INSERT ON projetoIntegrador.* TO 'vendedor'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'vendedor'@'localhost';

-- -------------------------------------------
-- Criar Usuario especifico para Serralheiro
-- -------------------------------------------

CREATE USER 'serralheiro'@'localhost' IDENTIFIED BY '123456D';

GRANT SELECT ON projetoIntegrador.esquadria TO 'serralheiro'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'serralheiro'@'localhost';

-- -------------------------------------------
-- Criar Usuario especifico para Meio Oficial
-- -------------------------------------------

CREATE USER 'meioOficial'@'localhost' IDENTIFIED BY '123456DE';

GRANT SELECT ON projetoIntegrador.esquadria TO 'meioOficial'@'localhost';

FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

SHOW GRANTS FOR 'meioOficial'@'localhost';

-- ------------------------------------------------------------------------------------------------------------------------------
-- Criptografia das Senhas de Usuarios
-- ------------------------------------------------------------------------------------------------------------------------------
   
   UPDATE `projetoIntegrador`.`usuario` SET `senha` = MD5('123456A') WHERE (`idUsuario` = '1');
   UPDATE `projetoIntegrador`.`usuario` SET `senha` = MD5('123456B') WHERE (`idUsuario` = '2');
   UPDATE `projetoIntegrador`.`usuario` SET `senha` = MD5('123456C') WHERE (`idUsuario` = '3');
   UPDATE `projetoIntegrador`.`usuario` SET `senha` = MD5('123456D') WHERE (`idUsuario` = '4');
   UPDATE `projetoIntegrador`.`usuario` SET `senha` = MD5('123456E') WHERE (`idUsuario` = '5');
   UPDATE `projetoIntegrador`.`usuario` SET `senha` = MD5('123456F') WHERE (`idUsuario` = '6');


-- -----------------------------------------------------------------------------------------------------------------------------
-- 2 - Crie visões no banco de dados para consultas mais frequentes.
-- -----------------------------------------------------------------------------------------------------------------------------

CREATE VIEW enderecoFuncionario AS

SELECT nome, rua, numero, bairro, cidade
FROM funcionario
WHERE nome ='Carlos Alexandre da Silva';

SELECT * FROM enderecoFuncionario;

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW viewtelefoneFuncionario AS

SELECT f.nome, t.telefone
FROM funcionario AS f INNER JOIN telefoneFuncionario AS t
WHERE idFuncionario = idTelefoneFuncionario;

SELECT * FROM viewtelefoneFuncionario;

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW dadosCliente AS

SELECT c.nome as nomeCliente, c.rua, c.numero, c.balneario, c.cidade, t.telefone AS telefoneCliente
FROM cliente as c INNER JOIN telefoneCliente as t
WHERE idCliente = IdTelefoneCliente ORDER BY c.nome asc;

SELECT * FROM dadosCliente;
SELECT * FROM cliente;
SELECT * FROM telefoneCliente;

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW dadosDistribuidores AS

SELECT d.nomeEmpresa, d.cnpj, t.telefone, t.setor, t.responsavel, d.cidade
FROM distribuidorAluminio AS d INNER JOIN telefoneDistribuidor AS t
WHERE idDistribuidorAluminio = idtelefoneDistribuidor ;

SELECT * FROM dadosDistribuidores;

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW precoEsquadrias AS

SELECT a.nomeEsquadria as esquadriaAluminio, a.valormetroQuadrado
FROM esquadria as a 
WHERE   idEsquadria ;

SELECT * FROM precoEsquadrias;
-- -------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW cliente_venda AS

SELECT c.nome as nomeCliente, v.dataVenda, v.dataEntrega, v.valorTotal
FROM cliente as c INNER JOIN venda as v 
WHERE  idCliente = idVenda;

SELECT * FROM cliente_venda;

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW distribuidor_Esquadria AS
SELECT e.nomeEsquadria, e.valormetroQuadrado, d.nomeEmpresa
FROM esquadria as e join distribuidorAluminio as d
WHERE idDistribuidorAluminio = distribuidorAluminioId ;

SELECT * FROM distribuidor_Esquadria;

-- -------------------------------------------------------------------------------------------------------------------------------

-- 3 - Crie ao menos uma stored function, um stored procedure ou um
-- trigger para o banco de dados, selecionando uma funcionalidade
-- que seja adequada para tanto.

-- -------------------------------------------------------------------------------------------------------------------------------
-- Esta stored function receba id de funcionário, data inicial e data final e retorne a venda total  no período indicado. 
-- -------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE FUNCTION vendaTotal
( funcionarioId INT, dataInicial DATE, dataFinal DATE ) 
RETURNS DECIMAL (10.2) DETERMINISTIC 

BEGIN
DECLARE totalVendas DECIMAL (10,2);
SELECT(SELECT sum( valorTotal ) FROM venda) INTO totalVendas  
FROM venda AS v
JOIN funcionario AS f ON v.idVenda = f.cargoId 
JOIN usuario AS u ON f.usuarioId = u.idUsuario
WHERE v.idVenda = funcionarioId AND u.ultimoLogin BETWEEN dataInicial and dataFinal;

RETURN (totalVendas);

END $$
DELIMITER ;

SELECT vendaTotal (2,'2022-01-01', '2023-12-31');

DROP FUNCTION vendaTotal ;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Esta Stored Fuction recebe a Data atual, e retorna o tempo de serviço de cada funcionario.
-- --------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE FUNCTION tempoServico (dataInicio datetime) 
RETURNS int 
DETERMINISTIC
BEGIN
    DECLARE dataAtual DATE;
    Select current_date()into dataAtual;
    RETURN year(dataAtual)-year(dataInicio);
END //
DELIMITER ;

SELECT idFuncionario, nome, dataAdmissao, tempoServico(dataAdmissao) as 'tempo de serviço' FROM funcionario;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Esta Stored Procedure recebe o valor de IdEsquadria e retorna os dados do Produto assim como o nome do distribuidor.
-- --------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE   PROCEDURE pesquisarEsquadria ( IN IdProcuraEsquadria INT )    
    BEGIN
	SELECT e.nomeEsquadria, e.descricao, e.valormetroQuadrado, d.nomeEmpresa
	FROM esquadria as e INNER JOIN distribuidorAluminio as d
	WHERE idEsquadria = IdProcuraEsquadria and distribuidorAluminioId = IdDistribuidorAluminio;
    END//
DELIMITER ;

CALL pesquisarEsquadria(15);

DROP PROCEDURE pesquisarEsquadria ;
SELECT * FROM esquadria;

-- ----------------------------------------------------------------------------------------------------------------------
-- Triguer desenvolvida para ao incluir um novo usuário, aplicar automaticamente MD5() à coluna “senha” da Tabela Usuario.
-- ----------------------------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER md5Usuario BEFORE INSERT ON  usuario FOR EACH ROW

BEGIN
	SET new.senha = md5(new.senha);
END $$
DELIMITER ;

INSERT INTO usuario (idUsuario, login, senha, ultimoLogin) VALUES
(7,'vendedor02', '121212', '2023-01-02 08:00:00');

SELECT * FROM usuario;

-- --------------------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------------------
  
-- 4 - Crie ao menos um índice composto para uma das tabelas.

-- --------------------------------------------------------------------------------------------------------------------------------
-- RESPOSTA

CREATE INDEX idx_loginUsuario ON usuario(login);

SELECT * FROM usuario WHERE login = 'proprietario';
EXPLAIN SELECT * FROM usuario WHERE login = 'proprietario';

-- --------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_nomeCliente ON cliente(nome);
EXPLAIN SELECT * FROM cliente WHERE nome = 'Gabriel Medina';

CREATE INDEX idx_cpfCliente ON cliente(cpf);
EXPLAIN SELECT * FROM cliente WHERE cpf = '22724372069';


-- --------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_telefoneCliente ON telefoneCliente(telefone);
EXPLAIN SELECT * FROM telefoneCliente WHERE telefone = '11 98402 3155';

-- --------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_nomeFuncionario ON funcionario(nome);
EXPLAIN SELECT * FROM funcionario WHERE nome = 'Edson Gularte da Silva';

CREATE INDEX idx_dataAdmissao ON funcionario(dataAdmissao);
EXPLAIN SELECT * FROM funcionario WHERE dataAdmissao = '2001-01-01 08:00:00';

CREATE INDEX idx_dataDemissao ON funcionario(dataDemissao);
EXPLAIN SELECT * FROM funcionario WHERE dataDemissao = '2001-01-01 08:00:00';

CREATE INDEX idx_Idcargo ON funcionario(cargoid desc );
EXPLAIN SELECT * FROM funcionario WHERE cargoId = '6';

-- --------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_telefoneFuncionario ON telefoneFuncionario (telefone);
EXPLAIN SELECT * FROM telefoneFuncionario WHERE telefone = '13 99876 1234';

-- --------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_nomeEsquadria ON itemVenda (nomeEsquadria);
EXPLAIN SELECT * FROM itemVenda WHERE nomeEsquadria = 'Porta de Tela';

CREATE INDEX idx_vendaId ON itemVenda (vendaId);
EXPLAIN SELECT * FROM itemVenda WHERE vendaId = '4';

-- --------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_nomeEsquadria ON esquadria (nomeEsquadria);
EXPLAIN SELECT * FROM esquadria WHERE nomeEsquadria = 'Grades de Proteção';

CREATE INDEX idx_distribuidorAluminio ON esquadria (distribuidorAluminioId);
EXPLAIN SELECT * FROM esquadria WHERE distribuidorAluminioId = '3' ;

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_dataVenda ON venda (dataVenda);
EXPLAIN SELECT * FROM venda WHERE dataVenda = '2022-05-18 09:00:00';

CREATE INDEX idx_dataEntrega ON venda (dataEntrega);
EXPLAIN SELECT * FROM venda WHERE dataEntrega = '2022-06-10 12:30:00';

-- -------------------------------------------------------------------------------------------------------------------------------

CREATE INDEX idx_distribuidorAluminio ON distribuidorAluminio (nomeEmpresa);
EXPLAIN SELECT * FROM distribuidorAluminio WHERE nomeEmpresa = 'Ideal Aluminio';

CREATE INDEX idx_telefoneDistribuidor ON telefoneDistribuidor (nomeEmpresa);
 SELECT * FROM telefoneDistribuidor WHERE telefone = '13 93364 8156';

-- -------------------------------------------------------------------------------------------------------------------------------

-- 5 -  Descreva textualmente uma rotina de administração de banco de
-- dados, prevendo backups, restore e checagem de integridade periódica.

-- ----------------------------------------------------------------------------------------------------------------------------
-- RESPOSTA :

/*

Para administrar o banco de dados e prever backups, restores e checagem de integridade periódica, sugiro a seguinte rotina:

Agendar backups periódicos do banco de dados, utilizando um software adequado para a tarefa, como o SQLBackupAndFTP. Os backups devem 
ser armazenados em um local seguro, como por exemplo um disco externo, email ou nuvem. Realizar restores de backups regularmente, para garantir que 
o processo de backup esteja funcionando corretamente e para ter uma cópia segura dos dados do banco de dados em caso de falha.
Verificar a integridade do banco de dados periodicamente, utilizando ferramentas como o MySQL Check, que verifica a consistência 
e integridade das tabelas do banco de dados e realiza correções em caso de problemas. Criar índices adequados para as tabelas do 
banco de dados, para melhorar o desempenho das consultas.

Criar stored functions e Procedures para automatizar tarefas do banco de dados. Criar uma triguer para criptografas as senhas de usuarios, 
assim que cadastradas. Isso pode ajudar a simplificar a lógica de negócios e reduzir o tempo de desenvolvimento de aplicações. 
Essa rotina  pode ser executada de forma manual ou automatizada, utilizando ferramentas como o MySQL Workbench ou agendadores de tarefas do 
sistema operacional. É importante que a rotina seja realizada com frequência suficiente para garantir a integridade dos dados e 
minimizar o tempo de indisponibilidade do banco de dados em caso de falhas.

*\

