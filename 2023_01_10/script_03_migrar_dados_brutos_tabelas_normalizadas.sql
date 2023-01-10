--INSERT INTO combustiveis (nome_combustivel) 
--	VALUES ('DIESEL'), ('DIEASEL 10'), ...;
	
INSERT INTO combustiveis (nome_combustivel) 
	SELECT DISTINCT(combustivel) FROM dados_brutos.dados_coleta_anp;

SELECT * FROM combustiveis;

--INSERT INTO bandeiras (nome_bandeira) 
--	VALUES ('...'), ('...'), ...;
INSERT INTO bandeiras (nome_bandeira) 
	SELECT DISTINCT(distribuidora) FROM dados_brutos.dados_coleta_anp;
	
SELECT * FROM bandeiras;

INSERT INTO estados (sigla_regiao, sigla_estado)
	SELECT DISTINCT regiao, estado FROM dados_brutos.dados_coleta_anp;
	
SELECT * FROM estados;

