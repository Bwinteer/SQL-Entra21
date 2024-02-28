INSERT INTO produto (id_produto, nm_produto, qt_estoque, vl_produto, cd_categoria) VALUES
(1, 'Smartphone XYZ', 50, 899.99, 1);

INSERT INTO produto (id_produto, nm_produto, qt_estoque, vl_produto, cd_categoria) VALUES
(2, 'Camiseta Casual', 100, 29.99, 2);

SELECT * FROM produto;

INSERT INTO produto (id_produto, nm_produto, qt_estoque, vl_produto, cd_categoria) VALUES
(3, 'Livro "Aventuras Fantásticas"', 30, 15.50, 3);

SELECT * FROM produto;

INSERT INTO produto (id_produto, nm_produto, qt_estoque, vl_produto, cd_categoria) VALUES
(4, 'Conjunto de Sofá Moderno', 10, 799.99, 4);

SELECT * FROM produto;

INSERT INTO produto (id_produto, nm_produto, qt_estoque, vl_produto, cd_categoria) VALUES
(5, 'Bicicleta de Montanha', 20, 349.99, 5);

SELECT * FROM produto;

# UPDATE 
# Suponha que o preço do "Smartphone XYZ" foi reduzido para 799.99. Atualize o valor na tabela de produtos.
UPDATE produto SET vl_produto = 799.99
WHERE id_produto = 1;

# UPDATE com SET
# Suponha que a descrição da categoria "Moda" foi atualizada para "Roupas e acessórios de moda para homens, mulheres e crianças". 
# Utilize o comando SET para fazer essa atualização na tabela de categorias.
UPDATE produto SET nm_produto = 'Smartphone XYZ'
WHERE id_produto = 1;

SELECT * FROM produto;

# DELETE
# Remova da tabela de produtos todos os produtos que têm uma quantidade em estoque inferior a 15 unidades.
DELETE FROM produto
WHERE qt_estoque < 15;

SELECT * FROM produto;