INSERT INTO endereco (id_endereco, ds_municipio, ds_bairro) VALUES 
(1, 'Cidade A', 'Centro');

INSERT INTO endereco (id_endereco, ds_municipio, ds_bairro) VALUES 
(2, 'Cidade B', 'Novo Bairro');

SELECT * FROM endereco;

INSERT INTO endereco (id_endereco, ds_municipio, ds_bairro) VALUES 
(3, 'Cidade A', 'Subúrbio');

UPDATE endereco SET ds_municipio = 'Cidade A'
WHERE ds_municipio  = 'Cidade C';

SELECT * FROM endereco;

INSERT INTO cliente (id, nm_cliente, ds_cpf, bl_cooperado, dt_nascimento, cd_endereco) VALUES 
(1, 'João Silva', 12345678901, TRUE, "1985-03-10", 1),
(2, 'Maria Oliveira', 98765432101, FALSE, "1992-07-22", 2),
(3, 'Carlos Santos', 45678901234, TRUE, "1978-11-05", 3),
(4, 'Ana Rocha', 87654321098, FALSE, "1989-05-15", 2),
(5, 'Paula Souza', 23456789012, TRUE, "1995-09-30", 1);

SELECT * FROM cliente;

#A) Suponha que o cliente com id 1 mudou de endereço
# e agora mora em um novo bairro chamado "Novo Bairro".
# Atualize o endereço na tabela de clientes.
UPDATE cliente SET cd_endereco = 2
WHERE id = 1; 

#B) Remova da tabela de clientes todos os clientes que não são cooperados.
DELETE FROM cliente 
WHERE bl_cooperado = FALSE;

#C) Adicione um novo cliente chamado "Maria Silva" à tabela de clientes. 
#Maria não é cooperada
#nasceu em '1990-05-15'
# possui CPF '12345678901' 
#mora em um bairro chamado "Centro" no município de "Cidade A".

INSERT INTO cliente (id, nm_cliente, ds_cpf, bl_cooperado, dt_nascimento, cd_endereco) VALUE
(6, 'Maria Silva', '12345678901', FALSE, '1990-05-15', 1);

SELECT * FROM cliente;