/**
	Consultas feitas para a atividade "Laboratório Prático - Índices"
	Bárbara Neves, 388713
**/

-- 2ª Questão
CREATE INDEX index1 ON l08_despesa USING hash (dnro);

-- 3ª Questão 
EXPLAIN ANALYSE SELECT * FROM l08_despesa WHERE dnro = 10;

-- 4ª Questão
SET enable_seqscan = FALSE;

EXPLAIN ANALYSE SELECT * FROM l08_despesa WHERE dnro = 10;

-- 5ª Questão 
SELECT relname, indexrelid, indexrelname, idx_scan, idx_tup_read 
FROM pg_stat_all_indexes
WHERE relname = 'l08_despesa';

-- 6ª Questão
SELECT * FROM l08_despesa WHERE dnro = 10;

-- 7ª Questão 
SELECT relname, indexrelid, indexrelname, idx_scan, idx_tup_read 
FROM pg_stat_all_indexes
WHERE relname = 'l08_despesa';

-- 8ª Questão
SELECT relname, indexrelid, indexrelname, idx_blks_read, idx_blks_hit 
FROM pg_statio_all_indexes
WHERE relname = 'l08_despesa';

-- 9ª Questão
SELECT * FROM l08_despesa WHERE dnro = 10;

-- 10ª Questão
SELECT relname, indexrelid, indexrelname, idx_blks_read, idx_blks_hit 
FROM pg_statio_all_indexes
WHERE relname = 'l08_despesa';

-- 12ª Questão
SELECT attname, most_common_vals, most_common_freqs, correlation
FROM pg_stats
WHERE tablename = 'l08_despesa';

-- 14ª Questão
EXPLAIN ANALYSE SELECT * FROM l08_despesa WHERE dtipo = 'gas';
        
SET enable_seqscan = FALSE;

EXPLAIN ANALYSE SELECT * FROM l08_despesa WHERE dtipo = 'gas';
        
SELECT relname, indexrelid, indexrelname, idx_scan, idx_tup_read 
FROM pg_stat_all_indexes
WHERE relname = 'l08_despesa';

SELECT relname, indexrelid, indexrelname, idx_blks_read, idx_blks_hit 
FROM pg_statio_all_indexes
WHERE relname = 'l08_despesa';
