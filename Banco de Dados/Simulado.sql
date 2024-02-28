CREATE TABLE livro (
cd_livro INTEGER PRIMARY KEY,
nm_titulo VARCHAR(50),
ano_publicacao INTEGER,
vl_livro DECIMAL(8,2),
cd_editora INTEGER REFERENCES editora (cd_editora)
);

CREATE TABLE editora (
cd_editora INTEGER PRIMARY KEY,
nm_editora VARCHAR(50)
);

CREATE TABLE autor (
cd_autor INTEGER PRIMARY KEY,
nm_autor VARCHAR(100),
dt_nascimento DATE
);

CREATE TABLE autor_livro (
cd_livro INTEGER REFERENCES livro(cd_livro),
cd_autor INTEGER REFERENCES autor(cd_autor),
papel_no_livro VARCHAR(200),
ano_contribuicao INTEGER
);

INSERT INTO livro (cd_livro, nm_titulo, ano_publicacao, vl_livro, cd_editora) VALUES 
(1, 'Livro 1', 2020, 50.00, 1),
(2, 'Livro 2', 2018, 45.50, 2),
(3, 'Livro 3', 2022, 60.75, 3),
(4, 'Livro 4', 2010, 42.50, 2),
(5, 'Livro 5', 2015, 56.77, 3);

SELECT * FROM livro;

INSERT INTO editora (cd_editora, nm_editora) VALUES 
(1, 'Editora A'),
(2, 'Editora B'),
(3, 'Editora C');

SELECT * FROM editora;

INSERT INTO autor (cd_autor, nm_autor, dt_nascimento) VALUES 
(1, 'Autor A', "1990-01-15"),
(2, 'Autor B', "1985-07-20"),
(3, 'Autor C', "1987-03-10"),
(4, 'Autor D', "1995-10-25"),
(5, 'Autor E', "1992-06-27");

SELECT * FROM autor;

INSERT INTO autor_livro (cd_livro, cd_autor, ano_contribuicao) VALUES
(1, 1, 2020),
(1, 2, 2020),
(2, 3, 2018),
(3, 1, 2022),
(3, 3, 2022),
(4, 4, 2010),
(5, 5, 2015);

SELECT * FROM autor_livro;

-- EXERCÍCIOS --
-- a. Suponha que você deseja atualizar o preço de todos os livros da Editora B para um novo valor de R$ 55.00. 
UPDATE livro SET vl_livro = 55.00
WHERE cd_editora = 2; 

SELECT * FROM livro;

-- b. Suponha que você deseja excluir o livro com o título 'Livro 4' da tabela livro.
DELETE FROM livro 
WHERE nm_titulo = 'Livro 4';

-- c. Selecione todos os livros publicados após o ano de 2015. 
SELECT * FROM livro WHERE ano_publicacao > 2015;

-- d. Apresente a média dos preços, o valor do mais caro e do mais barato dos livros.

-- Média dos preços dos livros
SELECT AVG(vl_livro) FROM livro;

-- Valor mais caro dos livros
SELECT MAX(vl_livro) FROM livro;

-- Valor mais barato dos livros
SELECT MIN(vl_livro) FROM livro;

-- e. Calcule o total de livros publicados por cada editora e ordene pelo nome da editora. 
SELECT e.nm_editora, COUNT(l.cd_editora)
FROM livro AS l JOIN editora AS e 
ON l.cd_editora = e.cd_editora
-- Agrupar por editora
GROUP BY(e.nm_editora);

-- f. Conte quantos autores contribuíram para cada livro.
SELECT a.nm_autor, COUNT(al.cd_livro)
FROM autor_livro AS al JOIN autor AS a
ON al.cd_autor = a.cd_autor
GROUP BY(al.cd_autor);

-- g. Encontre o ano mais antigo e mais recente de publicação entre todos os livros. 
SELECT MIN(ano_publicacao) AS ano_mais_antigo,
MAX(ano_publicacao) AS ano_mais_recente
FROM livro;

-- h. Selecione os autores nascidos antes de 1990.
SELECT * FROM autor
WHERE dt_nascimento < '1990-01-01';

-- i. Selecione os livros da Editora B. 
SELECT * FROM livro
WHERE cd_editora = (SELECT cd_editora FROM editora WHERE nm_editora = 'Editora B');

-- j. Selecione os autores que contribuíram para o livro com o título 'Livro 3'. 
SELECT a. * FROM autor AS a
JOIN autor_livro AS al ON a.cd_autor = al.cd_autor
JOIN livro l ON al.cd_livro = l.cd_livro
WHERE l.nm_titulo = 'Livro 3';