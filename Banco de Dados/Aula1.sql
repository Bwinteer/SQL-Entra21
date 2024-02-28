#precisa de ponto e virgula pára separar cada comando
#separe o que é comando e o que é costumizável
CREATE TABLE pessoa (
cd_pessoa INTEGER, #colunas = atributos
nm_pessoa VARCHAR(150),
fl_estado_civil CHAR(1)
); 

CREATE TABLE sala_de_aula (
id_sala_aula INTEGER,
nm_professor VARCHAR(150), #colunas = atributos
nm_alunos INTEGER,
nm_mesas INTEGER,
nm_cadeiras INTEGER,
nm_ventiladores INTEGER,
nm_janelas INTEGER,
ds_periodo VARCHAR(50)
);

ALTER TABLE sala_de_aula ADD fl_monitor INTEGER;

ALTER TABLE sala_de_aula DROP fl_monitor;

# A tabela fica rosa caso seja válida(exista)
CREATE TABLE categoria (
id INTEGER,
nm_categoria VARCHAR(50),
ds_categoria VARCHAR(150)
);

ALTER TABLE categoria ADD coluna_exemplo INTEGER;

# Não precisa colocar o tipo na hora de deletar.
categoriaALTER TABLE categoria DROP coluna_exemplo;

CREATE TABLE cliente (
id INTEGER,
nm_cliente VARCHAR(150),
ds_cpf CHAR(11),
bl_cooperado BOOLEAN,
dt_nascimento DATE,
cd_endereco INTEGER REFERENCES endereco (id_endereco)
);


CREATE TABLE endereco (
id_endereco INTEGER PRIMARY KEY, 
ds_municipio VARCHAR(50),
ds_bairro VARCHAR(50)
);

ALTER TABLE voo MODIFY ds_destino VARCHAR(200);

CREATE TABLE voo (
nr_numero INTEGER,
qnt_passagens INTEGER,
hr_decolagem DATETIME,
hr_prevista DATETIME,
ds_destino VARCHAR(150),
preco_passagem DECIMAL
);

CREATE TABLE clienteUm (
id INTEGER,
nm_cliente VARCHAR(150),
ds_cpf CHAR(11),
bl_cooperado BOOLEAN,
dt_nascimento DATE
);

ALTER TABLE clienteUm ADD telefone CHAR(14);
ALTER TABLE clienteum ADD descrição VARCHAR(200);
ALTER TABLE clienteum ADD email VARCHAR(150);

ALTER TABLE clienteUm DROP dt_nascimento;
ALTER TABLE clienteum DROP bl_cooperado;

CREATE TABLE departamento (
# o primeiro atributo tem que ser a PK
id INTEGER PRIMARY KEY, # PRIMARY KEY - DEFINE QUE É PK
ds_departamento VARCHAR(150)
);

CREATE TABLE chefe (
id INTEGER PRIMARY KEY,
ds_nome VARCHAR(50),
# No fim, eu crio meus atributos estrangeiros
# Chamado referência - chamado a tabela - específico a coluna (id(PK))
cd_departamento INTEGER REFERENCES departamento (id)
);

CREATE TABLE categoriaDois (
id_categoriaDois INTEGER,
nm_categoriaDois VARCHAR(50),
ds_categoriaDois VARCHAR(150)
);

CREATE TABLE produto (
id_produto INTEGER
nm_produto VARCHAR(50),
qt_estoque INTEGER,
vl_produto DECIMAL,

cd_categoriaDois INTEGER REFERENCES categoriaDois (id_categoriaDois)
);

# INSERIRDADOS NA TABELA
# Insira na nome_tabela

INSERT INTO sala_de_aula (id_sala_aula,
# Dentro dos parenteses especificar quais atributos serão atributos valores
nm_professor,
nm_alunos,
nm_mesas,
nm_cadeiras,
nm_ventiladores,
nm_janelas,
ds_periodo
) VALUES (
# Informe os dados
1, 'MAJU', 20, 20, 20, 2, 2, 'NOTURNO'
);

SELECT * FROM sala_de_aula;