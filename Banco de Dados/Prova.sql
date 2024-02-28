-- Questão 1
CREATE TABLE usuario (
cd_usuario INTEGER PRIMARY KEY,
nm_usuario VARCHAR(50),
ds_email VARCHAR(50),
nr_telefone VARCHAR(15)
);

CREATE TABLE servico (
cd_servico INTEGER PRIMARY KEY,
ds_servico VARCHAR(50),
ds_sugestao VARCHAR(200)
);

CREATE TABLE ordem_servico (
nr_os INTEGER PRIMARY KEY,
cd_usuario INTEGER REFERENCES usuario (cd_usuario),
dt_registro DATE,
ds_observacao VARCHAR(200)
);

CREATE TABLE itens_ordem_servico (
nr_os INTEGER REFERENCES ordem_servico(nr_os),
cd_servico INTEGER REFERENCES servico(cd_servico),
dt_atendimento DATE,
ds_atendimento VARCHAR(100)
);

-- Questão 2
INSERT INTO usuario (cd_usuario, nm_usuario, ds_email, nr_telefone) VALUES 
(1, 'Bruna Winter', 'bruwinter@hotmail.com', 33319777),
(2, 'Sara Oliveira', 'saraoliveira@hotmail.com', 33319046),
(3, 'Eduarda Simão', 'dudavinter@gmail.com', 91331914),
(4, 'Felipe Vieira', 'felipevieira@gmail.com', 9565469),
(5, 'Rafael Santos', 'rafaelsantos@gmail.com', 9595959);

INSERT INTO servico (cd_servico, ds_servico, ds_sugestao) VALUES
(1, 'Lavação', 'Utilizar roupa adequada'),
(2, 'Dançarina', 'Contratar agência'),
(3, 'Técnico de Informática', 'Funcionamento em horário comercial'),
(4, 'Sapateiro', 'Prazo de 05 dias úteis para entrega'),
(5, 'Motorista de Aplicativo', 'Utilizar celular próprio');

INSERT INTO ordem_servico (nr_os, cd_usuario, dt_registro, ds_observacao) VALUES
(12345, 1, '2023-11-05', 'Realizada com sucesso.'),
(12346, 2, '2023-11-06', 'Em andamento.'),
(12347, 3, '2023-11-07', 'Em análise.'),
(12348, 4, '2023-11-08', 'Em andamento.'),
(12349, 5, '2023-11-09', 'Realizada com sucesso');

INSERT INTO itens_ordem_servico (nr_os, cd_servico, dt_atendimento, ds_atendimento) VALUES
(12345, 1, '2023-11-05', 'Realizada limpeza do automóvel'),
(12345, 2, '2023-11-06', 'Realizado espetáculo infantil'),
(12346, 3, '2023-11-07', 'Instalou o Windows 11'),
(12346, 4, '2023-11-08', 'Reparou sapatos de Sara'),
(12347, 5, '2023-11-09', 'Finalizou a corrida'),
(12347, 4, '2023-11-10', 'Na lista de espera para reparo');

-- Questão 3
SELECT AVG(nr_os) FROM ordem_servico;

-- Questão 4
SELECT os.nr_os, os.dt_registro, u.nm_usuario, ios.ds_atendimento 
FROM ordem_servico os JOIN usuario u 
ON os.cd_usuario = u.cd_usuario JOIN itens_ordem_servico ios 
ON os.nr_os = ios.nr_os 
WHERE dt_registro >= '2023-11-10' AND dt_registro <= '2023-11-15';

-- Questão 5
SELECT u.nm_usuario, COUNT(*) AS itens_ordem_servico
FROM usuario u JOIN ordem_servico os 
ON u.cd_usuario = os.cd_usuario GROUP BY u.nm_usuario;

-- Questão 6
SELECT os.nr_os, os.dt_registro, ios.ds_atendimento 
FROM ordem_servico os JOIN itens_ordem_servico ios 
ON os.nr_os = ios.nr_os JOIN servico s 
ON ios.cd_servico = s.cd_servico 
WHERE s.ds_servico <> 'concluído';