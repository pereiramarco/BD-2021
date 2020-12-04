USE BD_Zoologico;

-- --------------------------------------------------------------
-- --------------------------VIEWS-------------------------------
-- --------------------------------------------------------------


DROP VIEW IF EXISTS vwNBilhetesAno;
DROP VIEW IF EXISTS vwNbilhetesAnos;

-- Numero de bilhetes por ano
CREATE VIEW vwNBilhetesAno AS
	SELECT YEAR(B.momento_aquisicao) AS Ano,COUNT(B.idBilhete) AS NumeroBilhetes
		FROM Bilhete as B
		GROUP BY YEAR(B.momento_aquisicao)
        ORDER BY YEAR(B.momento_aquisicao) DESC;

-- Usa view anterior para ter uma tabela com o ano, o n de bilhetes desse ano e o n de bilhetes do ano anterior
CREATE VIEW vwNbilhetesAnos AS        
	SELECT Atual.Ano AS Ano, Atual.NumeroBilhetes AS NumeroBilhetes, Anterior.NumeroBilhetes AS NumeroBilhetesAnterior
		FROM (SELECT * FROM vwNBilhetesAno) AS Atual
		INNER JOIN (SELECT * FROM vwNBilhetesAno) AS Anterior
		ON Atual.Ano= Anterior.Ano+1;

-- Apresenta o número de animais vivos presentes em cada zona
CREATE VIEW vwNAnimaisZona AS
SELECT Z.nome AS NomeDeZona, COUNT(Z.idZona) AS NúmeroAnimais
    FROM Zona AS Z 
		INNER JOIN Recinto AS R
		ON Z.idZona = R.Zona_idZona
        INNER JOIN Animal AS A
        ON A.Recinto_ID = R.ID
	WHERE A.vivo=1
	GROUP BY Z.idZona;

-- --------------------------------------------------------------
-- --------------------------Funções-----------------------------
-- --------------------------------------------------------------


-- Função que calcula quantas doses faltam administrar dada uma data de nascimento 
DELIMITER $$
DROP FUNCTION IF EXISTS calculaDosesRestantes;
CREATE FUNCTION calculaDosesRestantes(dataNascimento DATE,limiteTemporal INT, intervaloTemporal INT, dosesNecessarias INT) RETURNS INT
BEGIN
	RETURN CEIL(((limiteTemporal + (intervaloTemporal * (dosesNecessarias-1))) - (TIMESTAMPDIFF(MONTH,dataNascimento,CURDATE())))/intervaloTemporal);
END $$

-- ------------Requisitos de Exploração------------ --


-- ---------------------QUERY 1-----------------------
-- Consultar que animais um padrinho apadrinhou     --
-- ---------------------------------------------------

DELIMITER $$
CREATE PROCEDURE animaisApadrinhados 
	(IN idPadrinho INT)
BEGIN
	SELECT idAnimal AS IDAnimal, nome AS Nome
		FROM Animal
        WHERE Padrinho_idPadrinho = idPadrinho;
END $$

-- -----------------------------QUERY 2---------------------------------
-- Consultar qual o valor mensal total que cada padrinho deve pagar   --
-- ---------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE valorMensalAPagar
	()
BEGIN
	SELECT Padrinho_idPadrinho AS IDPadrinho, SUM(E.valor_de_apadrinhamento) AS ValorAPagar
		FROM Animal AS A INNER JOIN Especie AS E
			ON A.Especie_idEspecie=E.idEspecie
		WHERE Padrinho_idPadrinho IS NOT NULL
		GROUP BY Padrinho_idPadrinho;
END $$
    
-- --------------------QUERY 3---------------------------
-- Consultar as crias de um animal existentes no zoo   --
-- ------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE criasDeAnimal
	(IN idAnimal INT)
BEGIN
	SELECT Animal_idAnimalFilho AS IDCria
		FROM Animal_has_Animal
		WHERE Animal_idAnimalProgenitor=idAnimal;
END $$
-- -----------------------QUERY 4-------------------------
-- Determinar todos os descendentes de um animal no zoo --
-- -------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE descendentesAnimal
	(IN idAnimal INT)
BEGIN
	WITH RECURSIVE arvoreDescendente AS (
	SELECT Animal_idAnimalProgenitor AS IDProgenitor,Animal_idAnimalFilho AS IDCria, 1 AS Profundidade_Relativa
	FROM Animal_has_Animal
	WHERE Animal_idAnimalProgenitor = idAnimal

	UNION ALL

	SELECT pais.Animal_idAnimalProgenitor, pais.Animal_idAnimalFilho, aD.Profundidade_Relativa + 1
	FROM Animal_has_Animal pais, arvoreDescendente aD
	WHERE pais.Animal_idAnimalProgenitor = aD.IDCria
	)
	SELECT * FROM arvoreDescendente;
END $$

-- -------------------------QUERY 5---------------------------
-- Consultar os progenitores de um animal existentes no zoo --
-- -----------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE progenitoresDeAnimal
	(IN idAnimal INT)
BEGIN
SELECT Animal_idAnimalProgenitor AS IDCria
	FROM Animal_has_Animal
    WHERE Animal_idAnimalFilho=idAnimal;
END $$
    
-- ---------------------------QUERY 6----------------------------
-- Mostrar todos os ascendentes de um animal existentes no zoo --
-- --------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE ascendentesAnimal
	(IN idAnimal INT)
BEGIN
	WITH RECURSIVE arvoreAscendente AS (
	SELECT Animal_idAnimalFilho AS IDCria, Animal_idAnimalProgenitor AS IDProgenitor, -1 AS Profundidade_Relativa
	FROM Animal_has_Animal
	WHERE Animal_idAnimalFilho = idAnimal

	UNION ALL

	SELECT pais.Animal_idAnimalFilho, pais.Animal_idAnimalProgenitor, aA.Profundidade_Relativa - 1
	FROM Animal_has_Animal pais, arvoreAscendente aA
	WHERE pais.Animal_idAnimalFilho = aA.IDProgenitor
	)
	SELECT * FROM arvoreAscendente;
END $$

-- --------------------------QUERY 7------------------------------
-- Conhecer todas as espécies que um tipo de bilhete dá acesso  --
-- ---------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE especiesPorTipoBilhete
	(IN idTipo INT)
BEGIN
SELECT E.nome_comum AS NomeComum, E.nome_cientifico AS NomeCientifico, Z.nome AS NomeZona
	FROM Tipo AS T 
    INNER JOIN Tipo_has_Zona AS TZ
		ON T.idTipo = TZ.Tipo_idTipo
        INNER JOIN Zona AS Z
			ON Z.idZona=TZ.Zona_idZona
            INNER JOIN Recinto AS R
				ON R.Zona_idZona=Z.idZona
                INNER JOIN Animal AS A
					ON A.Recinto_ID = R.ID 
					INNER JOIN Especie AS E
						ON E.idEspecie = A.Especie_idEspecie
	WHERE T.idTipo=4
    GROUP BY E.idEspecie;
END $$

-- ---------------------------------QUERY 8--------------------------------------
-- Consultar quantos animais, existem em cada bioma do jardim zoológico --
-- ------------------------------------------------------------------------------

CREATE VIEW vwNAnimaisBioma AS
	SELECT bioma AS Bioma, SUM(A.vivo) AS NAnimaisVivos ,SUM(CASE WHEN A.vivo=0 THEN 1 ELSE 0 END)AS NAnimaisMortos
		FROM Recinto as R INNER JOIN Animal AS A
		ON R.ID = A.Recinto_ID
		GROUP BY bioma;

-- --------------------QUERY 9------------------------
-- Calcular o TOP 3 tipo de bilhetes mais comprados --
-- ---------------------------------------------------

DELIMITER $$
CREATE PROCEDURE top3TiposBilheteMaisComprado
	()
BEGIN
SELECT T.nome AS TipoBilhete, COUNT(B.tipo_idTipo) AS NBilhetesVendidos
	FROM Bilhete as B
		INNER JOIN Tipo AS T
		ON B.Tipo_idTipo = T.idTipo
	GROUP BY B.tipo_idTipo
    ORDER BY COUNT(B.tipo_idTipo) DESC
    LIMIT 3;
END $$

-- --------------------QUERY 10----------------------------
-- Conhecer quantos bilhetes de cada tipo foram vendidos --
-- --------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE nBilhetesTipoSold
	()
BEGIN
SELECT idTipo AS Tipo, COUNT(*) AS Número FROM Bilhete b,Tipo t
	WHERE b.Tipo_idTipo = t.idTipo
	GROUP BY idTipo;
END $$

-- -------QUERY 11-----------
-- Calcula faturação total --
-- --------------------------

DELIMITER $$
CREATE PROCEDURE faturacaoGlobal
	()
BEGIN	
SELECT SUM(preco) AS Faturacao_Global
	FROM (SELECT * FROM Bilhete b,Tipo t
	WHERE b.Tipo_idTipo = t.idTipo) as aux;
END $$ 
 
-- ---------------QUERY 12--------------------
-- Calcula faturação num intervalo de tempo --
-- -------------------------------------------

DELIMITER $$
CREATE PROCEDURE faturacaoIntervalo
	(IN dataInicio DATE, dataFim Date)
BEGIN
SELECT SUM(preco) AS Faturacao_Intervalo
	FROM (SELECT * FROM Bilhete b, Tipo t
		WHERE b.Tipo_idTipo = t.idTipo 
			AND momento_aquisicao BETWEEN dataInicio AND dataFim) AS aux;
END $$ 

-- ------------QUERY 13--------------------
-- Saber o crescimento de visitas anual  --
-- ----------------------------------------

SELECT Ano, NumeroBilhetes, ((NumeroBilhetes-NumeroBilhetesAnterior)/NumeroBilhetesAnterior)*100 AS CrescimentoPercentagem
	FROM vwNbilhetesAnos;
    
-- --------------------------QUERY 14-----------------------------
-- Saber que veterinarios administraram qual vacina a um animal --
-- ---------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE veterinarioVacinaPorAnimal
	(IN idAnimal INT)
BEGIN
SELECT v.nome AS Nome, va.doenca AS Nome_Vacina 
	FROM Veterinario v, Animal_has_Vacina_has_Veterinario vc, Animal a, Vacina va
		WHERE v.idVeterinario = vc.Veterinario_idVeterinario 
			AND vc.Animal_idAnimal = a.idAnimal 
			AND va.idVacina = vc.Vacina_idVacina 
			AND a.idAnimal = idAnimal;
END $$

-- ---------------------------------------QUERY 15---------------------------------------------
-- Calcula quais vacinas já foram administradas a um animal e o seu momento de administração --
-- --------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE vacinaDataPorAnimal
	(IN idAnimal INT)
BEGIN
SELECT va.doenca AS Nome_Vacina, vc.data_administracao AS Data
	FROM Animal_has_Vacina_has_Veterinario vc, Animal a, Vacina va
		WHERE vc.Animal_idAnimal = a.idAnimal 
			AND va.idVacina = vc.Vacina_idVacina 
			AND a.idAnimal = idAnimal;
END $$

-- ------------------------------------QUERY 16-----------------------------------------------
-- Consulta quais vacinas, incluindo doses que se devem repetir, um animal ainda deve tomar --
-- -------------------------------------------------------------------------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS vacinasPorDarAnimal;
CREATE PROCEDURE vacinasPorDarAnimal
	(IN idAnimal INT)
BEGIN
SELECT v.doenca as Vacina, calculaDosesRestantes(a.data_nascimento,ev.limite_temporal,ev.intervalo_temporal,ev.doses_necessarias) as Doses_Em_Falta FROM Animal a, Especie e, Especie_has_Vacina ev, Vacina v
	WHERE a.Especie_idEspecie = e.idEspecie
		AND e.idEspecie = ev.Especie_idEspecie
		AND ev.Vacina_idVacina = v.idVacina
	    AND a.idAnimal = idAnimal
		AND a.vivo = 1
		AND (TIMESTAMPDIFF(MONTH,a.data_nascimento,CURDATE())) <= (ev.limite_temporal + (ev.intervalo_temporal * (ev.doses_necessarias-1)));
END $$

-- -----------------QUERY 17------------------
-- Apresenta os contactos de um veterinário --
-- -------------------------------------------

DELIMITER $$
CREATE PROCEDURE contactoVeterinario
	(IN idVeterinario INT)
BEGIN
SELECT * FROM Veterinario v, Contacto_Veterinario cv
	WHERE v.idVeterinario = cv.Veterinario_idVeterinario
		AND v.idVeterinario = idVeterinario;
END $$

-- -----------------------QUERY 18---------------------------
-- Calcula a média de pesos de animais de uma dada espécie --
-- ----------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE averageWeightSpecies
	(IN idEspecie INT)
BEGIN
SELECT e.nome_comum, e.nome_cientifico, AVG(a.peso) AS MediaPeso FROM Especie e, Animal a
	WHERE e.idEspecie = a.Especie_idEspecie
		AND e.idEspecie = idEspecie
			GROUP BY e.idEspecie;
END $$