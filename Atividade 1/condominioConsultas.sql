SELECT * FROM pg_class;

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l01_morador';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l02_unidade';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l03_veiculo';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l04_familiar';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l05_prestador';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l06_requisita';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l07_administracao';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l08_despesa';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l09_funcionario';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l10_permanente';

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l11_terceirizado';

CREATE TABLE L11_TERCEIRIZADO (
  TCPF            DECIMAL(11) NOT NULL,

  TCustoPorDia    DECIMAL(6,2) NOT NULL,
  TEmpresa        VARCHAR(150) NOT NULL,

  CONSTRAINT PK_TERC PRIMARY KEY (TCPF),
  CONSTRAINT FK_TFUNC FOREIGN KEY(TCPF) REFERENCES L09_FUNCIONARIO(FUCPF)
);

--L11_TERCEIRIZADO
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('904', '40', 'Seguranca e Cia.');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('906', '60', 'Condominios S.A.');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('907', '70', 'Construtiva');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('909', '90', 'Segurarte');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('911', '110', 'Firme e Forte');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('912', '120', 'Condominius');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('913', '130', 'Portal');
INSERT INTO L11_TERCEIRIZADO (TCPF, TCustoPorDia, TEMPRESA) VALUES ('914', '140', 'Imoveis Seguros');

SELECT relname, relpages, reltuples, relhasindex 
FROM pg_class
WHERE relname = 'l12_contrata';

SELECT * FROM information_schema.tables;

VACUUM(FULL, ANALYZE, VERBOSE) l01_morador;
VACUUM(FULL, ANALYZE, VERBOSE) l02_unidade;
VACUUM(FULL, ANALYZE, VERBOSE) l03_veiculo;
VACUUM(FULL, ANALYZE, VERBOSE) l04_familiar;
VACUUM(FULL, ANALYZE, VERBOSE) l05_prestador;
VACUUM(FULL, ANALYZE, VERBOSE) l06_requisita;
VACUUM(FULL, ANALYZE, VERBOSE) l07_administracao;
VACUUM(FULL, ANALYZE, VERBOSE) l08_despesa;
VACUUM(FULL, ANALYZE, VERBOSE) l09_funcionario;
VACUUM(FULL, ANALYZE, VERBOSE) l10_permanente;
VACUUM(FULL, ANALYZE, VERBOSE) l11_terceirizado;
VACUUM(FULL, ANALYZE, VERBOSE) l12_contrata;

SELECT pg_stat_reset();

SELECT relname, seq_scan, n_tup_ins, n_tup_upd, n_tup_del 
FROM pg_stat_all_tables
WHERE relname = 'l08_despesa';

INSERT INTO L08_DESPESA (DNRO, DTIPO, DFUNCAOADMIN, DANOADMIN) 
VALUES ('41', 'gas', 'sindico', '2011');

DELETE FROM L08_DESPESA
WHERE DNRO = '40';

SELECT L08.DFUNCAOADMIN
FROM L08_DESPESA L08 
WHERE L08.DTIPO = 'agua';

UPDATE L08_DESPESA
SET DANOADMIN = '2011'
WHERE DNRO = '39';

SELECT relname, seq_scan, n_tup_ins, n_tup_upd, n_tup_del 
FROM pg_stat_all_tables
WHERE relname = 'l08_despesa';

SELECT L08.DFUNCAOADMIN
FROM L08_DESPESA L08 
WHERE L08.DNRO = '40';

DELETE FROM L08_DESPESA
WHERE DNRO = '38';

SELECT blks_read, blks_hit, datname, conflicts, deadlocks, xact_commit, xact_rollback 
FROM pg_stat_database
WHERE datname= 'condominio';