/* Consulta 1 */
-- a)
SELECT A.nm_candidato, A.ds_cargo, A.ds_sit_tot_turno
FROM votacoes A
WHERE A.sg_uf = 'CE';

-- b) 
CREATE INDEX index1 ON votacoes USING hash (sg_uf);

-- c)
EXPLAIN ANALYSE 
SELECT A.nm_candidato, A.ds_cargo, A.ds_sit_tot_turno
FROM votacoes A
WHERE A.sg_uf = 'CE';

-- d)
DROP INDEX index1 ON votacoes;

CREATE INDEX index2 ON votacoes USING btree (sg_uf);

-- e)
EXPLAIN ANALYSE 
SELECT A.nm_candidato, A.ds_cargo, A.ds_sit_tot_turno
FROM votacoes A
WHERE A.sg_uf = 'CE';

/* Consulta 2 */
-- a) 
SELECT DISTINCT A.ds_cargo, A.nm_candidato, A.nm_partido
FROM votacoes A
WHERE A.qt_votos_nominais > 50000;

-- b) 
CREATE INDEX index1 ON votacoes USING btree (qt_votos_nominais);

-- c) 
DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE 
SELECT DISTINCT A.ds_cargo, A.nm_candidato, A.nm_partido
FROM votacoes A
WHERE A.qt_votos_nominais > 50000;

-- e)
DROP INDEX index1 ON votacoes;

CREATE INDEX index2 ON votacoes USING hash (qt_votos_nominais);

-- f)
DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE 
SELECT DISTINCT A.ds_cargo, A.nm_candidato, A.nm_partido
FROM votacoes A
WHERE A.qt_votos_nominais > 50000;

/* Consulta 3 */
-- a) 
SELECT DISTINCT A.nm_candidato, B.ds_tipo_bem_candidato, B.ds_bem_candidato
FROM votacoes A, bens_declarados B
WHERE A.sq_candidato = B.sq_candidato;

-- b)
CREATE INDEX index1 ON votacoes USING hash (sq_candidato);

-- c)
DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE 
SELECT DISTINCT A.nm_candidato, B.ds_tipo_bem_candidato, B.ds_bem_candidato
FROM votacoes A, bens_declarados B
WHERE A.sq_candidato = B.sq_candidato;

-- d)
CREATE INDEX index2 ON bens_declarados USING hash (sq_candidato);

-- e)
DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE 
SELECT DISTINCT A.nm_candidato, B.ds_tipo_bem_candidato, B.ds_bem_candidato
FROM votacoes A, bens_declarados B
WHERE A.sq_candidato = B.sq_candidato;

/* Consulta 4 */
-- a) 
SELECT A.nm_partido, COUNT(A.nm_candidato)
FROM votacoes A
GROUP BY A.nm_partido;
-- Quantidade de candidatos por cada partido
-- Runtime: 3 min 21 secs.

-- b) 
CREATE INDEX index1 ON votacoes USING hash (nm_partido);

-- c)
DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE 
SELECT A.nm_partido, COUNT(A.nm_candidato)
FROM votacoes A
GROUP BY A.nm_partido;

/* Consulta 5.1 */
SELECT A.nm_coligacao, SUM(B.qt_votos_nominais) 
FROM filiacoes A, votacoes B
WHERE A.sq_coligacao = B.sq_coligacao
GROUP BY A.nm_coligacao;

CREATE INDEX index1 ON filiacoes USING btree (sq_coligacao);
CREATE INDEX index2 ON votacoes USING btree (sq_coligacao);

DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE
SELECT A.nm_coligacao, SUM(B.qt_votos_nominais) 
FROM filiacoes A, votacoes B
WHERE A.sq_coligacao = B.sq_coligacao
GROUP BY A.nm_coligacao;

/* Consulta 5.2 */
-- A quantidade de votos de determinado candidato por estado
SELECT A.sg_uf, B.nm_candidato, SUM(A.qt_votos_nominais)
FROM votacoes A, candidatos B
WHERE A.sq_candidato = B.sq_candidato
GROUP BY A.sg_uf, B.nm_candidato;

CREATE INDEX index1 ON votacoes USING btree (sq_candidato);
CREATE INDEX index2 ON candidatos USING btree (sq_candidato);

DISCARD ALL;
SET SESSION AUTHORIZATION DEFAULT;
RESET ALL;
DEALLOCATE ALL;
CLOSE ALL;
UNLISTEN *;
SELECT pg_advisory_unlock_all();
DISCARD PLANS;
DISCARD TEMP;

EXPLAIN ANALYSE
SELECT A.sg_uf, B.nm_candidato, SUM(A.qt_votos_nominais)
FROM votacoes A, candidatos B
WHERE A.sq_candidato = B.sq_candidato
GROUP BY A.sg_uf, B.nm_candidato;