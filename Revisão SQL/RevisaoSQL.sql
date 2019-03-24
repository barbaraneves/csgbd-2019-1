/*	
	CSGBD - Revisão de SQL 
	Bárbara Stéphanie Neves
	388713
*/

/* Alternativa a) */
SELECT P.pnome, MAX(FPJ.qtd), MIN(FPJ.qtd)
FROM fpj FPJ, p P 
WHERE FPJ.pid = P. pid
GROUP BY P.pnome;

/* Alternativa b) */

/* 	
	Adicionando o fornecedor F1:
	INSERT INTO f VALUES ('F1', 'Quixada', 6);

	INSERT INTO fpj VALUES (6, 2, 2, 300);
	INSERT INTO fpj VALUES (6, 1, 2, 550);
*/

/* 
	Peça nova: 	
	INSERT INTO p VALUES (4, 'peca4', 'vermelho');

	INSERT INTO fpj VALUES (6, 4, 1, 300);
	INSERT INTO fpj VALUES (4, 4, 3, 550);
*/

-- Consulta:
SELECT P.pnome, MAX(FPJ.qtd), MIN(FPJ.qtd)
FROM fpj FPJ, p P, f F
WHERE FPJ.pid = P. pid
AND FPJ.fid = F.fid 
AND F.fnome != 'F1'
GROUP BY P.pnome;

/* Alternativa c) */
SELECT P.pid 
FROM p P, fpj FPJ 
WHERE P.pid = FPJ.pid
GROUP BY P.pid
HAVING COUNT(FPJ.fid) > 1;

/* Alternativa d) */
SELECT F.fnome, SUM(FPJ.qtd)
FROM f F 
LEFT JOIN fpj FPJ
ON F.fid = FPJ.fid
GROUP BY F.fnome;

/* Alternativa e) */

/* 
	Adicionando a peça 4 para que o fornecedor 3 (João)
	tenha fornecido todas as peças existentes no banco:
	INSERT INTO fpj VALUES (3, 4, 1, 400);
*/

-- Consulta:
SELECT F.fnome
FROM f F
WHERE NOT EXISTS (
	(SELECT P.pid FROM p P)
	EXCEPT (SELECT FPJ.pid
			FROM FPJ 
			WHERE FPJ.fid = F.fid))
GROUP BY F.fnome;

/* Alternativa f) */

/* 
	Projetos do fornecedor 1 (Maria): 6.
	Projetos do fornecedor 2 (Lucia): 4, 5, 1.
	Projetos do fornecedor 3 (João): 3, 5, 3 e 1.
	Projetos do fornecedor 4 (Ana): 3.
	Projetos do fornecedor 6 (F1): 2, 2, 1.
	
	Adicionando mais um projeto para Lucia para que fique empatada 
	com a quantidade de projetos que o João tem:
	
	INSERT INTO fpj VALUES (2, 3, 2, 100);
	
	Projetos do fornecedor 2 (Lucia): 4, 5, 1 e 2.
	Quantidade de projetos distintos do fornecedor 2: 4.
*/

-- Consulta:
SELECT F.fnome
FROM f F, j J
WHERE J.jid = (SELECT DISTINCT J.jid
			   FROM fpj FPJ
			   WHERE J.jid = FPJ.jid 
			   AND F.fid = FPJ.fid)
GROUP BY F.fnome
HAVING COUNT(J.jid) = (SELECT MAX(A.CONTADOR) 
					   FROM (SELECT COUNT(FPJ.jid) AS CONTADOR
							 FROM fpj FPJ
							 GROUP BY (FPJ.jid)) AS A);
							 
/* 
	Adicionando mais um projeto para que Lucia e João tenham a mesma quantidade:
	
	INSERT INTO fpj VALUES (3, 3, 2, 100);
	
	Projetos do fornecedor 3 (João): 3, 5, 3, 1 e 2.
	Quantidade de projetos distintos do fornecedor 3: 4.
*/
							 		
/* Alternativa g) */
SELECT J.jnome, AVG(FPJ.qtd)
FROM j J, fpj FPJ, p P
WHERE J.jid = FPJ.jid 
AND FPJ.pid = P.pid 
AND P.pnome = 'peca1'
GROUP BY J.jnome;

/* Alternativa h) */
SELECT J.jnome, P.pnome, AVG(FPJ.qtd)
FROM j J, fpj FPJ, p P
WHERE J.jid = FPJ.jid 
AND P.pid = FPJ.pid
GROUP BY J.jnome, P.pnome;

/* Alternativa i) */
SELECT J.jnome, P.pnome
FROM j J, P p, fpj FPJ
WHERE J.jid = FPJ.jid
AND P.pid = (SELECT MAX(B.MEDIA) 
			 FROM (SELECT AVG(FPJ.qtd) AS MEDIA
				   FROM FPJ 
				   WHERE FPJ.pid = P.pid
				   GROUP BY (FPJ.qtd)) AS B)
GROUP BY J.jnome, P.pnome;

/* Alternativa j) */
SELECT P.pnome, COUNT(J.jid), J.jnome, SUM(FPJ.qtd)
FROM p P, fpj FPJ, j J
WHERE P.pid = FPJ.pid
AND J.jid = FPJ.jid
GROUP BY P.pnome, J.jnome;

/* Alternativa k) */
SELECT F.fnome 
FROM f F, fpj FPJ, j J
WHERE F.fid = FPJ.fid 
AND J.jid = FPJ.jid 
AND J.jnome = 'projeto1';