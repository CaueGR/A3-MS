CREATE TABLE pessoa(
id     	 	      NUMBER(10) NOT NULL,
nome              VARCHAR2(100) NOT NULL,
telefone          NUMBER(11) NOT NULL,
email   	      VARCHAR2(80) NOT NULL,
cpf     	      NUMBER(11) NOT NULL
);

CREATE TABLE medico(
id     	 	      NUMBER(10) NOT NULL,
especialidade     VARCHAR2(100) NOT NULL
);

CREATE TABLE paciente(
id     	 	      NUMBER(10) NOT NULL,
plano_de_saude    VARCHAR2(100) NOT NULL
);

CREATE TABLE evolucao(
id     	 	      NUMBER(10) NOT NULL,
dataEvolucao      DATE NOT NULL,
descricao         NVARCHAR2(1000) NOT NULL,
id_medico         NUMBER(10) NOT NULL,
id_paciente       NUMBER(10) NOT NULL
);

CREATE TABLE consulta(
id     	 	      NUMBER(10) NOT NULL,
data_hora         DATE NOT NULL,
status            VARCHAR2(100) NOT NULL,
id_medico         NUMBER(10) NOT NULL,
id_paciente       NUMBER(10) NOT NULL
);

CREATE TABLE farmacia(
id     	 	      NUMBER(10) NOT NULL,
nome_farmacia     VARCHAR2(100) NOT NULL,
endereco          VARCHAR2(200) NOT NULL,
id_paciente         NUMBER(10) NOT NULL
);

CREATE TABLE laboratorio(
id     	 	      NUMBER(10) NOT NULL,
nome_laboratorio  VARCHAR2(100) NOT NULL,
endereco          VARCHAR2(200) NOT NULL
);

CREATE TABLE exame(
id     	 	      NUMBER(10) NOT NULL,
tipo            VARCHAR2(100) NOT NULL,
resultado            VARCHAR2(100) NOT NULL,
id_laboratorio    NUMBER(10) NOT NULL,
id_paciente       NUMBER(10) NOT NULL
);

CREATE TABLE sistema_de_pesquisa(
id     	 	      NUMBER(10) NOT NULL,
termo_busca            VARCHAR2(100) NOT NULL,
filtro            VARCHAR2(100) NOT NULL,
id_medico    NUMBER(10) NOT NULL,
id_paciente       NUMBER(10) NOT NULL
);

CREATE TABLE controle_de_acesso(
id     	 	      NUMBER(10) NOT NULL,
usuario            VARCHAR2(100) NOT NULL,
nivel_de_acesso     VARCHAR2(100) NOT NULL,
id_pessoa       NUMBER(10) NOT NULL
);





ALTER TABLE pessoa ADD PRIMARY KEY(id);
ALTER TABLE consulta ADD PRIMARY KEY(id);
ALTER TABLE exame ADD PRIMARY KEY(id);
ALTER TABLE laboratorio ADD PRIMARY KEY(id);
ALTER TABLE farmacia ADD PRIMARY KEY(id);
ALTER TABLE sistema_de_pesquisa ADD PRIMARY KEY(id);
ALTER TABLE controle_de_acesso ADD PRIMARY KEY(id);
ALTER TABLE evolucao ADD PRIMARY KEY(id);

ALTER TABLE medico ADD UNIQUE(id);
ALTER TABLE paciente ADD UNIQUE(id);

ALTER TABLE medico ADD FOREIGN KEY (id) 
REFERENCES pessoa(id);

ALTER TABLE paciente ADD FOREIGN KEY (id) 
REFERENCES pessoa(id);

ALTER TABLE evolucao ADD FOREIGN KEY (id_medico) 
REFERENCES medico(id);

ALTER TABLE evolucao ADD FOREIGN KEY (id_paciente) 
REFERENCES paciente(id);

ALTER TABLE consulta ADD FOREIGN KEY (id_medico) 
REFERENCES medico(id);

ALTER TABLE consulta ADD FOREIGN KEY (id_paciente) 
REFERENCES paciente(id);

ALTER TABLE farmacia ADD FOREIGN KEY (id_paciente) 
REFERENCES paciente(id);

ALTER TABLE exame ADD FOREIGN KEY (id_laboratorio) 
REFERENCES laboratorio(id);

ALTER TABLE exame ADD FOREIGN KEY (id_paciente) 
REFERENCES paciente(id);

ALTER TABLE sistema_de_pesquisa ADD FOREIGN KEY (id_paciente) 
REFERENCES paciente(id);

ALTER TABLE sistema_de_pesquisa ADD FOREIGN KEY (id_medico) 
REFERENCES medico(id);

ALTER TABLE controle_de_acesso ADD FOREIGN KEY (id_pessoa) 
REFERENCES pessoa(id);

CREATE SEQUENCE pessoa_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER pessoa_trig
BEFORE INSERT ON pessoa FOR EACH ROW
BEGIN
:NEW.id := pessoa_seq.NEXTVAL;
END;


CREATE SEQUENCE consulta_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER consulta_trig
BEFORE INSERT ON consulta FOR EACH ROW
BEGIN
:NEW.id := consulta_seq.NEXTVAL;
END;

CREATE SEQUENCE evolucao_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER evolucao_trig
BEFORE INSERT ON evolucao FOR EACH ROW
BEGIN
:NEW.id := evolucao_seq.NEXTVAL;
END;

CREATE SEQUENCE exame_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER exame_trig
BEFORE INSERT ON exame FOR EACH ROW
BEGIN
:NEW.id := exame_seq.NEXTVAL;
END;

CREATE SEQUENCE farmacia_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER farmacia_trig
BEFORE INSERT ON farmacia FOR EACH ROW
BEGIN
:NEW.id := farmacia_seq.NEXTVAL;
END;

CREATE SEQUENCE laboratorio_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER laboratorio_trig
BEFORE INSERT ON laboratorio FOR EACH ROW
BEGIN
:NEW.id := laboratorio_seq.NEXTVAL;
END;

CREATE SEQUENCE sistema_de_pesquisa_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER sistema_de_pesquisa_trig
BEFORE INSERT ON sistema_de_pesquisa FOR EACH ROW
BEGIN
:NEW.id := sistema_de_pesquisa_seq.NEXTVAL;
END;

CREATE SEQUENCE controle_de_acesso_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER controle_de_acesso_trig
BEFORE INSERT ON controle_de_acesso FOR EACH ROW
BEGIN
:NEW.id := controle_de_acesso_seq.NEXTVAL;
END;


DELETE FROM pessoa;
SELECT * FROM medico;
SELECT * FROM pessoa;
DROP SEQUENCE pessoa_seq;

TRUNCATE TABLE pessoa;



INSERT INTO pessoa (nome, telefone, email, cpf) VALUES
('Dr. João Silva', 51911112222, 'joao.silva@hospital.com', 12345678901),
('Maria Oliveira', 51922223333, 'maria.oliveira@gmail.com', 23456789012),
('Dr. Ana Costa', 51933334444, 'ana.costa@hospital.com', 34567890123),
('Carlos Souza', 51944445555, 'carlos.souza@gmail.com', 45678901234),
('Juliana Lima', 51955556666, 'juliana.lima@gmail.com', 56789012345);

INSERT INTO medico (id, especialidade) VALUES
(1, 'Cardiologista'),
(3, 'Pediatra');

INSERT INTO paciente (id, plano_de_saude) VALUES
(2, 'UNIMED'),
(4, 'SULAMÉRICA'),
(5, 'BRADESCO SAÚDE');

INSERT INTO consulta (data_hora, status, id_medico, id_paciente) VALUES
(TO_DATE('2024-06-01 10:00', 'YYYY-MM-DD HH24:MI'), 'Realizada', 1, 2),
(TO_DATE('2024-06-02 15:00', 'YYYY-MM-DD HH24:MI'), 'Agendada', 3, 5),
(TO_DATE('2024-06-03 09:00', 'YYYY-MM-DD HH24:MI'), 'Cancelada', 1, 4);


INSERT INTO evolucao (dataEvolucao, descricao, id_medico, id_paciente) VALUES
(TO_DATE('2024-06-02', 'YYYY-MM-DD'), 'Paciente apresentou melhora significativa.', 1, 4),
(TO_DATE('2024-06-03', 'YYYY-MM-DD'), 'Sintomas persistem, exames solicitados.', 3, 5),
(TO_DATE('2024-06-04', 'YYYY-MM-DD'), 'Alta médica concedida.', 1, 2);

INSERT INTO laboratorio (nome_laboratorio, endereco) VALUES
('Laboratório Saúde', 'Av. Laboratório, 123'),
('LabVida', 'Rua dos Exames, 456');

INSERT INTO exame (tipo, resultado, id_laboratorio, id_paciente) VALUES
('Raio-X', 'Normal', 1, 2),
('Sangue', 'Hemoglobina baixa', 2, 5),
('Urina', 'Sem alterações', 1, 4);

DROP TABLE farmacia CASCADE CONSTRAINTS;

INSERT INTO farmacia (nome_farmacia, endereco, id_paciente) VALUES
('Farmácia Vida', 'Av. Central, 1000', 4),
('Drogaria Popular', 'Rua das Flores, 222', 5);

INSERT INTO sistema_de_pesquisa (termo_busca, filtro, id_medico, id_paciente) VALUES
('dor no peito', 'urgente', 1, 4),
('febre persistente', 'pediatria', 3, 5);

INSERT INTO controle_de_acesso (usuario, nivel_de_acesso, id_pessoa) VALUES
('joaos', 'medico', 1),
('mariao', 'paciente', 2),
('anac', 'medico', 3),
('carloss', 'paciente', 4),
('julianal', 'paciente', 5);

SELECT p.nome AS medico, c.data_hora, c.status
FROM medico m
JOIN pessoa p ON m.id = p.id
JOIN consulta c ON m.id = c.id_medico;

SELECT p.nome AS paciente, e.tipo, e.resultado
FROM paciente pa
JOIN pessoa p ON pa.id = p.id
JOIN exame e ON pa.id = e.id_paciente;

SELECT med.nome AS medico, pac.nome AS paciente, ev.dataEvolucao, ev.descricao
FROM evolucao ev
JOIN medico m ON ev.id_medico = m.id
JOIN paciente pa ON ev.id_paciente = pa.id
JOIN pessoa med ON m.id = med.id
JOIN pessoa pac ON pa.id = pac.id;

SELECT tipo, COUNT(*) AS total_exames
FROM exame
GROUP BY tipo;

SELECT p.nome, COUNT(*) AS total_consultas
FROM consulta c
JOIN medico m ON c.id_medico = m.id
JOIN pessoa p ON m.id = p.id
GROUP BY p.nome
HAVING COUNT(*) > 1;


SELECT p.nome, COUNT(*) AS total_evolucoes
FROM evolucao e
JOIN paciente pa ON e.id_paciente = pa.id
JOIN pessoa p ON pa.id = p.id
GROUP BY p.nome;

-----------------------------------------

-----------------------------------------
SELECT DISTINCT p.nome
FROM paciente pa
JOIN pessoa p ON pa.id = p.id
JOIN exame e ON pa.id = e.id_paciente
WHERE e.tipo IN (
  SELECT tipo FROM exame WHERE id_paciente = 1
);
----------------------------------------------
----------------------------------------------

SELECT DISTINCT p.nome
FROM medico m
JOIN pessoa p ON m.id = p.id
WHERE m.id IN (
  SELECT id_medico FROM consulta
  WHERE id_paciente IN (
    SELECT id_paciente FROM exame WHERE tipo = 'Raio-X'
  )
);

--------------------------------

--------------------------------
SELECT * FROM consulta
WHERE id_paciente IN (
  SELECT id_paciente
  FROM evolucao
  GROUP BY id_paciente
  HAVING COUNT(*) > 1
);
-------------------------------------
-------------------------------------

INSERT INTO consulta (id, data_hora, status, id_medico, id_paciente)
SELECT pessoa_seq.NEXTVAL, SYSDATE, 'Agendada', 1, id_paciente
FROM exame
WHERE tipo = 'Sangue';

UPDATE consulta
SET status = 'Realizada'
WHERE id_paciente IN (
  SELECT id_paciente FROM evolucao
);

DELETE FROM exame
WHERE resultado IN (
  SELECT resultado FROM exame WHERE id_paciente = 1
)
AND id_paciente != 1;

SELECT id_paciente FROM exame
UNION
SELECT id_paciente FROM consulta;

SELECT id_paciente FROM exame
INTERSECT
SELECT id_paciente FROM consulta;

SELECT id_paciente FROM exame
MINUS
SELECT id_paciente FROM consulta;