/* modelo_logico: */

CREATE TABLE bandeiras (
    id_bandeiras  SERIAL      PRIMARY KEY,
    nome_bandeira VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE combustiveis (
    id_combustivel   SERIAL,
    nome_combustivel VARCHAR(70) NOT NULL,
	CONSTRAINT pk_combustiveis PRIMARY KEY (id_combustivel),
	CONSTRAINT un_combustiveis UNIQUE (nome_combustivel)
);

CREATE TABLE estados (
    id_estado    SERIAL,
    sigla_estado VARCHAR(02) NOT NULL,
    sigla_regiao VARCHAR(02) NOT NULL,
	CONSTRAINT pk_estados PRIMARY KEY (id_estado),
	CONSTRAINT un_estados_1 UNIQUE (sigla_estado),
	CONSTRAINT un_estados_2 UNIQUE (sigla_regiao),
	CONSTRAINT ck_estados   CHECK (sigla_regiao IN ('N', 'S', 'NE', 'SE', 'CO'))
);

-- ANO: só aceitar até o ano atual
-- VALOR: aceitar apenas valores maiores que ZERO
--        limitar até no máximo 100,00 (com 2 casas decimais)
-- Transferir as restrições de chave estrangeira para dentro 
-- da criação da tabla
CREATE TABLE coletas_anp (
    id_coleta      INTEGER,
    ano            INTEGER,
    valor 		   NUMERIC(5,2),
    id_bandeiras   INTEGER,
    id_combustivel INTEGER,
    id_estado 	   INTEGER,
	CONSTRAINT pk_coletas_anp   PRIMARY KEY (id_coleta),
	CONSTRAINT ck_valor         CHECK (valor >= 0 AND valor <= 100),
	CONSTRAINT ck_ano           CHECK (ano <= EXTRACT(YEAR from CURRENT_DATE)),
	CONSTRAINT fK_coletas_anp_1 FOREIGN KEY (id_bandeiras)   REFERENCES bandeiras (id_bandeiras),
	CONSTRAINT fk_coletas_anp_2 FOREIGN KEY (id_combustivel) REFERENCES combustiveis (id_combustivel),
	CONSTRAINT fk_coletas_anp_3 FOREIGN KEY (id_estado)      REFERENCES estados (id_estado)
);