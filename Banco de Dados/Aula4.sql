# * -> representa todos os campos
SELECT * FROM categoria;

SELECT nm_categoria, ds_categoria FROM categoria;

SELECT nm_categoria, ds_categoria, nm_produto, qt_estoque, vl_produto, cd_categoria FROM categoria, produto;

SELECT id_produto FROM produto;

SELECT nm_cliente, dt_nascimento FROM cliente;

# Faça um SELECT na tabela cliente trazendo somente se for João Silva ou Carlos Santos
SELECT * FROM cliente
WHERE nm_cliente = 'João Silva' OR nm_cliente = 'Carlos Santos';

# Qual o campo que vai usar para organizar
# DESC -> Ordem Descrecente
# ASC OU OMITIDO -> Em ordem crescente
SELECT * FROM categoria ORDER BY nm_categoria DESC;
SELECT * FROM categoria ORDER BY id DESC;

#
SELECT * FROM cliente ORDER BY nm_cliente;
SELECT * FROM cliente ORDER BY nm_cliente DESC;

SELECT * FROM produto ORDER BY vl_produto;
SELECT * FROM produto ORDER BY vl_produto DESC;

#======== TABELA PRODUTO ===========

#1) Selecione todos os produtos com um preço superior a 100.
SELECT * FROM produto WHERE vl_produto > 100;

#2) Selecione o nome e a quantidade em estoque dos produtos na categoria "Eletrônicos".
SELECT nm_produto, qt_estoque FROM produto WHERE cd_categoria = 1;

#3) Selecione o nome, valor e categoria dos produtos com um valor entre 10 e 50.
SELECT nm_produto, vl_produto, cd_categoria FROM produto WHERE vl_produto > 9 AND val_produto < 50;

#4) Selecione o nome e a descrição da categoria dos produtos que possuem menos de 10 unidades em estoque.
SELECT nm_produto, cd_categoria FROM produto WHERE qt_estoque < 10;

#5) Selecione o nome e a quantidade em estoque dos produtos que pertencem à categoria "Livros" e têm um valor inferior a 30.
SELECT nm_produto, qt_estoque FROM produto WHERE cd_categoria = 3 AND vl_produto < 30;

#======== TABELA CLIENTE ===========

#1) Selecione todos os clientes cooperados.
SELECT * FROM cliente WHERE bl_cooperado = TRUE;

#2) Selecione o nome e o CPF dos clientes que nasceram depois de 1990.
SELECT nm_cliente, ds_cpf FROM cliente
WHERE dt_nascimento > '1990-01-01';

#3) Selecione o nome, CPF e endereço dos clientes que moram no "Novo Bairro".
SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente
WHERE cd_endereco = 2;

#4) Selecione o nome e a data de nascimento dos clientes ordenados por data de nascimento, do mais novo para o mais velho.
SELECT nm_cliente, dt_nascimento FROM cliente 
ORDER BY dt_nascimento DESC;

#5) Selecione o nome, CPF e município dos clientes que são cooperados e moram no "Centro".
SELECT nm_cliente, ds_cpf, cd_endereco FROM cliente WHERE bl_cooperado = TRUE AND cd_endereco = 1;

#combinando colunas com WHERE
SELECT * FROM cliente AS c, endereco AS e WHERE 
c.cd_endereco = e.id;

#combinando colunas com JOIN
SELECT * FROM cliente AS c JOIN endereco AS e 
ON c.cd_endereco = e.id;
WHERE c.bl_cooperado = TRUE;

SELECT * FROM produto AS p JOIN categoria AS c
ON p.cd_categoria = c.id

#1) Selecione o nome do cliente, o CPF e o bairro do endereço para todos os clientes que moram no município de "Cidade A".

#2) Selecione o nome do cliente, a data de nascimento e o município do endereço para todos os clientes, 
#ordenados por município em ordem alfabética.

#3) Selecione o nome do cliente, o CPF e o bairro do endereço para clientes que são cooperados e moram no bairro "Centro".

#4) Selecione o nome do cliente, a data de nascimento, o município e o bairro do endereço para clientes 
#que nasceram depois de 1990, ordenados por data de nascimento.

#5) Selecione o nome do cliente, o CPF e o município do endereço para clientes que não são cooperados, 
#ordenados por município e nome do cliente.

SELECT c.nm_cliente, c.ds_cpf, e.bairro FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
WHERE e.ds_municipio = 'Cidade A';

SELECT c.nm_cliente, c.dt_nascimento, e.ds_municipio FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
ORDER BY e.ds_municipio ASC;

SELECT c.nm_cliente, ds_cpf, e.bairro FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
WHERE e.bairro = 'Centro';

SELECT c.nm_cliente, c.dt_nascimento, e.ds_municipio, e.bairro FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
WHERE c.dt_nascimento > '1990-01-01';

SELECT c.nm_cliente, c.ds_cpf, e.ds_municipio FROM cliente AS c JOIN endereco AS e
ON c.cd_endereco = e.id
WHERE c.bl_cooperado = FALSE
ORDER BY c.nm_Cliente AND e.ds_municipio;


#6) Selecione o nome do produto, a quantidade em estoque e o valor para todos os produtos 
#que pertencem à categoria "Eletrônicos".

#7) Selecione o nome do produto, o valor e a descrição da categoria para todos os produtos, 
#ordenados por valor em ordem decrescente.

#8) Selecione o nome do produto, a quantidade em estoque e a descrição da categoria para produtos 
#que têm menos de 20 unidades em estoque, ordenados por quantidade em estoque em ordem crescente.

#9) Selecione o nome do produto, o valor e a quantidade em estoque para produtos que pertencem 
#à categoria "Livros" e têm um valor superior a 15.

#10) Selecione o nome do produto, a quantidade em estoque e a descrição da categoria para produtos 
#que têm mais de 50 unidades em estoque e pertencem à categoria "Casa e Jardim", ordenados por quantidade em estoque em ordem decrescente.

SELECT p.nm_produto, p.qt_estoque, p.vl_produto FROM produto AS p JOIN categoria AS c
ON p.id = c.id
WHERE c.nm_categoria = 'Eletrônicos';

SELECT p.nm_produto, p.vl_produto FROM produto AS p JOIN categoria AS c
ON p.id = c.id
WHERE c.nm_categoria = 'Eletrônicos';

SELECT AVG(nm_alunos), SUM(nm_alunos) FROM sala_de_aula;

# Imprima o valor médio dos produtos
SELECT AVG(vl_produto) FROM produto;

# Imprima o valor total da compra de todos os produtos
SELECT SUM(vl_produto) FROM produto;

# Calcular o maior valor
SELECT MAX(vl_produto) FROM produto;

# Calcular o menor valor
SELECT MIN(vl_produto) FROM produto;

# Qual cliente é o mais velho e qual o mais novo
SELECT MAX(dt_nascimento), nm_cliente FROM cliente;

SELECT MIN(dt_nascimento), nm_cliente FROM cliente;

# Exemplo de COUNT - Sempre utilizar o Where quando utilizar o COUNT ou GROUP BY
SELECT COUNT(*) FROM produto;
# GROUP BY - Agrupa os dados iguais e faz uma contagem
SELECT COUNT(cd_endereco), cd_endereco
FROM cliente GROUP BY(cd_endereco);

# Quantos produtos na categoria 1
SELECT COUNT(cd_categoria)
FROM produto WHERE cd_categoria = 1;

# Quantos clientes são cooperados
SELECT nm_cliente, COUNT(bl_cooperado)
FROM cliente WHERE bl_cooperado = TRUE
GROUP BY(nm_cliente);

#======== EXERCÍCIOS 27/11 ===========
#1) Calcule a média de idade dos clientes.
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(dt_nascimento)) 
FROM cliente;

#2) Determine a quantidade total de produtos em estoque.
SELECT SUM(qt_estoque) FROM produto;

#3) Encontre o valor máximo dos produtos.
SELECT MAX(vl_produto) FROM produto;

#4) Calcule a soma total dos valores dos produtos na categoria "Eletrônicos".
SELECT SUM(vl_produto) FROM produto
WHERE cd_categoria = 1;

#5) Encontre o produto mais barato.
SELECT nm_produto FROM produto
WHERE vl_produto = (SELECT MIN(vl_produto)
FROM produto);

#6) Determine a quantidade total de clientes por município.
SELECT e.ds_municipio, COUNT(c.id)
FROM cliente AS c JOIN endereco AS e ON c.cd_endereco = e.id_endereco
-- Agrupar por município
GROUP BY(e.ds_municipio);

#7) Calcule a média de estoque por categoria.
SELECT c.nm_categoria, AVG(p.qt_estoque)
FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id_categoria
GROUP BY(c.id_categoria);

#9) Determine a quantidade de produtos por categoria.
SELECT c.nm_categoria, COUNT(p.qt_estoque)
FROM produto AS p JOIN categoria AS c ON p.cd_categoria = c.id_categoria
GROUP BY(c.id_categoria);