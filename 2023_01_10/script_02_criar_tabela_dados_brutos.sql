-- SE;SP;GASOLINA;2017;3.699;PETROBRAS DISTRIBUIDORA S.A.

-- Criando a estrutura de importação dos dados brutos
CREATE TABLE dados_brutos.dados_coleta_anp (
	regiao        VARCHAR,
	estado		  VARCHAR,
	combustivel   VARCHAR,
	ano			  VARCHAR,
	valor		  VARCHAR,
	distribuidora VARCHAR
);
