USE Filmes;

INSERT INTO Generos (Nome)
VALUES				('Terror')
				   ,('Anime')

INSERT INTO Filmes (Titulo, idGenero)
VALUES				('IT: A Coisa', 1)
				   ,('Pok�mon', 2)
				   ,('Koe no Katachi', 2)
				   ,('Invoca��o do Mal', 1)

UPDATE Generos
SET Nome = 'Aventura'
WHERE idGenero = 2;

DELETE FROM Filmes
WHERE idFilme = 3

INSERT INTO Filmes (Titulo)
VALUES				('Mogli')
				   ,('Naruto')

INSERT INTO Generos (Nome)
VALUES				('A��o')