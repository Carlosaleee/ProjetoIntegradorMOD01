USE serralheriaUniao ;

-- --------------------------------------------------------------------------------------------------------------------------
-- Crie Indices Para as Colunas

CREATE INDEX idx_endereco ON cliente(endereco);
SELECT * FROM cliente WHERE endereco = 'Rua Vilaverde 1564';
EXPLAIN SELECT * FROM cliente WHERE endereco = 'Rua Vilaverde 1564';

-- --------------------------------------------------------------------------------------------------------------------------
-- Crie Indices Para as Colunas - cargo

CREATE INDEX `idx_usuario`on `usuarioId`  ;

-- --------------------------------------------------------------------------------------------------------------------------
-- Crie Indices Para as Colunas - funcionario

INDEX `cargoId` (`cargoId` ASC) VISIBLE;
  INDEX `fk_funcionario_usuario` (`usuarioId` ASC) VISIBLE;
  
  -- --------------------------------------------------------------------------------------------------------------------------
-- Crie Indices Para as Colunas - cliente

INDEX `fk_cliente_usuario` (`usuarioId` ASC) VISIBLE);

INDEX fk_cliente_usuario (usuarioId ASC) VISIBLE

-- --------------------------------------------------------------------------------------------------------------------------
-- Crie Indices Para as Colunas - venda

INDEX `clienteId` (`clienteId` ASC) VISIBLE,
  INDEX `funcionarioId` (`funcionarioId` ASC) VISIBLE,

CREATE INDEX idx_data ON dataCompra(data desc);

-- --------------------------------------------------------------------------------------------------------------------------
-- Crie Indices Para as Colunas - item venda

INDEX `vendaId` (`venda_id` ASC) VISIBLE,
  INDEX `esquadriaId` (`esquadriaId` ASC) VISIBLE,








