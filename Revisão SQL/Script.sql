/* Tabela dos Fornecedores */
CREATE TABLE f
(
  fnome varchar(20),
  cidade varchar(20),
  fid integer NOT NULL,
  CONSTRAINT id PRIMARY KEY (fid)
);

/* Tabela das Peças */
CREATE TABLE j
(
  jid integer NOT NULL,
  jnome varchar(20),
  cidade varchar(20),
  CONSTRAINT j_pkey PRIMARY KEY (jid)
);

/* Tabela dos Projetos */
CREATE TABLE p
(
  pid integer NOT NULL,
  pnome varchar(20),
  cor varchar(20),
  CONSTRAINT p_pkey PRIMARY KEY (pid)
);

/* Tabela que indica quando uma Peça foi fornecida por um Fornecedor para um Projeto específico*/
CREATE TABLE fpj
(
  fid integer NOT NULL,
  pid integer NOT NULL,
  jid integer NOT NULL,
qtd integer NOT NULL,
  CONSTRAINT p_pkey1 PRIMARY KEY (fid,pid,jid),
  constraint fk_1 foreign key(fid) references f(fid),
  constraint fk_2 foreign key(pid) references p(pid),
  constraint fk_3 foreign key(jid) references j(jid) 
);

/* Fornecedores */
insert into f values ('Maria','Fortaleza',1);
insert into f values ('Lucia','São Paulo',2);
insert into f values ('João','Fortaleza',3);
insert into f values ('Ana','Rio de Janeiro',4);
insert into f values ('Pedro','Teresina',5);

/* Peças */
insert into p values (1,'peca1','preto');
insert into p values (2,'peca2','branco');
insert into p values (3,'peca3','preto');

/* Projetos */
insert into j values (1,'projeto1','Fortaleza');
insert into j values (2,'projeto2','São Paulo');
insert into j values (3,'projeto3','Teresina');
insert into j values (4,'projeto4','Fortaleza');
insert into j values (5,'projeto5','São Paulo');
insert into j values (6,'projeto6','Teresina');

/* Peça, Fornecedor, Projeto e quantidade */
insert into fpj values (3,3,3,300);
insert into fpj values (2,1,4,500);
insert into fpj values (2,1,5,450);
insert into fpj values (2,1,1,300);
insert into fpj values (3,2,5,200);
insert into fpj values (1,2,6,100);
insert into fpj values (3,1,3,200);