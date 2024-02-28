CREATE TABLE categoria (
id_categoria INTEGER PRIMARY KEY,
nm_categoria VARCHAR(50),
ds_categoria VARCHAR(150)
);

CREATE TABLE produto (
id_produto INTEGER,
nm_produto VARCHAR(50),
qt_estoque INTEGER,
vl_produto DECIMAL,

cd_categoria INTEGER REFERENCES categoria (id_categoria)
);


CREATE TABLE empresa (
id_empresa INTEGER PRIMARY KEY,
nr_cnpj CHAR(18),
qt_funcionarios INTEGER
);

CREATE TABLE pessoa (
id_pessoa INTEGER PRIMARY KEY,
nm_nome VARCHAR(50),
nr_cpf CHAR(11),
bl_gerente BOOLEAN,
bl_empregado BOOLEAN
);

CREATE TABLE pessoa_empresa (
cd_pessoa INTEGER REFERENCES pessoa(id_pessoa),
cd_empresa INTEGER REFERENCES empresa(id_empresa)
);