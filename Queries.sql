USE BD_Zoologico;

-- ------------Requisitos de Exploração------------ --


-- ---------------------QUERY 1-----------------------
-- Consultar que animais um padrinho apadrinhou     --
-- ---------------------------------------------------


SELECT idAnimal AS IDAnimal, nome AS Nome
	FROM Animal
    WHERE Padrinho_idPadrinho=1;


-- -----------------------------QUERY 2---------------------------------
-- Consultar qual o valor mensal total que um padrinho deve pagar     --
-- ---------------------------------------------------------------------

SELECT Padrinho_idPadrinho AS IDPadrinho, SUM(E.valor_de_apadrinhamento) AS ValorAPagar
    FROM Animal AS A INNER JOIN Especie AS E
		ON A.Especie_idEspecie=E.idEspecie
	WHERE Padrinho_idPadrinho=1
    GROUP BY Padrinho_idPadrinho;
    
-- --------------------QUERY 3---------------------------
-- Consultar as crias de um animal existentes no zoo   --
-- ------------------------------------------------------

SELECT Animal_idAnimalFilho AS IDCria
	FROM Animal_has_Animal
    WHERE Animal_idAnimalProgenitor=16;
    
-- -----------------------QUERY 4-------------------------
-- Determinar todos os descendentes de um animal no zoo --
-- -------------------------------------------------------

WITH RECURSIVE arvoreDescendente AS (
  SELECT Animal_idAnimalProgenitor AS IDProgenitor,Animal_idAnimalFilho AS IDCria, 1 AS Profundidade_Relativa
  FROM Animal_has_Animal
  WHERE Animal_idAnimalProgenitor = 16

  UNION ALL

  SELECT pais.Animal_idAnimalProgenitor, pais.Animal_idAnimalFilho, aD.Profundidade_Relativa + 1
  FROM Animal_has_Animal pais, arvoreDescendente aD
  WHERE pais.Animal_idAnimalProgenitor = aD.IDCria
)
SELECT * FROM arvoreDescendente;

-- -------------------------QUERY 5---------------------------
-- Consultar os progenitores de um animal existentes no zoo --
-- -----------------------------------------------------------

SELECT Animal_idAnimalProgenitor AS IDCria
	FROM Animal_has_Animal
    WHERE Animal_idAnimalFilho=11;
    
-- ---------------------------QUERY 6----------------------------
-- Mostrar todos os ascendentes de um animal existentes no zoo --
-- --------------------------------------------------------------


WITH RECURSIVE arvoreAscendente AS (
  SELECT Animal_idAnimalFilho AS IDCria, Animal_idAnimalProgenitor AS IDProgenitor, -1 AS Profundidade_Relativa
  FROM Animal_has_Animal
  WHERE Animal_idAnimalFilho = 12

  UNION ALL

  SELECT pais.Animal_idAnimalFilho, pais.Animal_idAnimalProgenitor, aA.Profundidade_Relativa - 1
  FROM Animal_has_Animal pais, arvoreAscendente aA
  WHERE pais.Animal_idAnimalFilho = aA.IDProgenitor
)
SELECT * FROM arvoreAscendente;

-- -------------------------QUERY 8----------------------------------------------
-- Consultar quantos animais, vivos, existem em cada bioma do jardim zoológico --
-- ------------------------------------------------------------------------------

SELECT bioma AS Bioma, COUNT() AS NAnimaisVivos
	FROM Recinto
    GROUP BY bioma;








