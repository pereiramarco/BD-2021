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
    WHERE Animal_idAnimalProgenitor=2;
    
-- -----------------------QUERY 4-------------------------
-- Determinar todos os descendentes de um animal no zoo --
-- -------------------------------------------------------

WITH RECURSIVE sub_tree AS (
  SELECT id, name, 1 AS relative_depth
  FROM categories
  WHERE name = 'Child A1'

  UNION ALL

  SELECT cat.id, cat.name, st.relative_depth + 1
  FROM categories cat, sub_tree st
  WHERE cat.parent_id = st.id
)
SELECT * FROM sub_tree;


WITH RECURSIVE parents AS (
  SELECT Animal_idAnimalFilho, Animal_idAnimalProgenitor, 1 AS relative_depth
  FROM Animal_has_Animal
  WHERE id = 6

  UNION ALL

  SELECT an.Animal_idAnimalProgenitor, an.Animal_idAnimalFilho, p.relative_depth + 1
  FROM Animal_has_Animal an, parents p
  WHERE an.Animal_idAnimalProgenitor = p.id
)
SELECT id, name, relative_depth FROM parents;



