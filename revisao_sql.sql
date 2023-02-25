USE MASTER
GO
DROP DATABASE IF EXISTS revisao_sql
GO
CREATE DATABASE revisao_sql
GO
USE revisao_sql
GO

CREATE TABLE alunos (
	ra		INT				NOT NULL	CHECK (ra > 0)	UNIQUE,
	nome	VARCHAR(100)	NOT NULL,
	idade	INT				NOT NULL,

	PRIMARY KEY(ra)
);
GO

CREATE TABLE disciplinas (
	codigo			INT				NOT NULL	UNIQUE,
	nome			VARCHAR(80)		NOT NULL,
	carga_horaria	INT				NOT NULL	CHECK (carga_horaria >= 32),

	PRIMARY KEY(codigo)
);
GO

CREATE TABLE aluno_disciplina (
	id					INT		NOT NULL	IDENTITY(1,1),
	aluno_ra			INT		NOT NULL,
	disciplina_codigo	INT		NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(aluno_ra) REFERENCES alunos(ra),
	FOREIGN KEY(disciplina_codigo) REFERENCES disciplinas(codigo)
);
GO

CREATE TABLE titulacao (
	codigo		INT				NOT NULL	UNIQUE,
	titulo		VARCHAR(40)		NOT NULL,

	PRIMARY KEY(codigo)
);
GO

CREATE TABLE professores (
	registro			INT				NOT NULL	UNIQUE,
	nome				VARCHAR(100)	NOT NULL,
	titulacao_codigo	INT				NOT NULL,

	PRIMARY KEY(registro),
	FOREIGN KEY(titulacao_codigo) REFERENCES titulacao(codigo)
);
GO

CREATE TABLE disciplina_professor (
	id					INT		NOT NULL	IDENTITY(1,1),
	disciplina_codigo	INT		NOT NULL,
	professor_registro	INT		NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(disciplina_codigo) REFERENCES disciplinas(codigo),
	FOREIGN KEY(professor_registro) REFERENCES professores(registro)
);
GO

CREATE TABLE cursos (
	codigo			INT				NOT NULL	UNIQUE,
	nome			VARCHAR(50)		NOT NULL,
	area			VARCHAR(50)		NOT NULL,

	PRIMARY KEY(codigo)
);
GO

CREATE TABLE curso_disciplina (
	id					INT		NOT NULL	IDENTITY(1,1),
	curso_codigo		INT		NOT NULL,
	disciplina_codigo	INT		NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(curso_codigo) REFERENCES cursos(codigo),
	FOREIGN KEY(disciplina_codigo) REFERENCES disciplinas(codigo)
);
GO

INSERT INTO alunos (ra, nome, idade) VALUES
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423, 'LEONARDO MAGALHÃES DA ROSA', 17),
(3434, 'LUIZA CRISTINA DE LIMA MARTINELI', 20),
(3440, 'IVO ANDRÉ FIGUEIRA DA SILVA', 25),
(3443, 'BRUNA LUISA SIMIONI', 37),
(3448, 'THAÍS NICOLINI DE MELLO', 17),
(3457, 'LÚCIO DANIEL TÂMARA ALVES', 29),
(3459, 'LEONARDO RODRIGUES', 25),
(3465, 'ÉDERSON RAFAEL VIEIRA', 19),
(3466, 'DAIANA ZANROSSO DE OLIVEIRA', 21),
(3467, 'DANIELA MAURER', 23),
(3470, 'ALEX SALVADORI PALUDO', 42),
(3471, 'VINÍCIUS SCHVARTZ', 19),
(3472, 'MARIANA CHIES ZAMPIERI', 18),
(3482, 'EDUARDO CAINAN GAVSKI', 19),
(3483, 'REDNALDO ORTIZ DONEDA', 20),
(3499, 'MAYELEN ZAMPIERON', 22);
GO

INSERT INTO disciplinas (codigo, nome, carga_horaria) VALUES
(1, 'Laboratório de Banco de Dados', 80),
(2, 'Laboratório de Engenharia de Software', 80),
(3, 'Programação Linear e Aplicações', 80),
(4, 'Redes de Computadores', 80),
(5, 'Segurança da informação', 40),
(6, 'Teste de Software', 80),
(7, 'Custos e Tarifas Logísticas', 80),
(8, 'Gestão de Estoques', 40),
(9, 'Fundamentos de Marketing', 40),
(10, 'Métodos Quantitativos de Gestão', 80),
(11, 'Gestão do Tráfego Urbano', 80),
(12, 'Sistemas de Movimentação e Transporte', 40);
GO

INSERT INTO aluno_disciplina (aluno_ra, disciplina_codigo) VALUES
(3416, 1), (3416, 4), (3423, 1), (3423, 2),
(3423, 5), (3423, 6), (3434, 2), (3434, 5),
(3434, 6), (3440, 1), (3443, 5), (3443, 6),
(3448, 4), (3448, 5), (3448, 6), (3457, 2),
(3457, 4), (3457, 5), (3457, 6), (3459, 1),
(3459, 6), (3465, 7), (3465, 11), (3466, 8),
(3466, 11), (3467, 8), (3467, 12), (3470, 8),
(3470, 9), (3470, 11), (3470, 12), (3471, 7),
(3472, 7), (3472, 12), (3482, 9), (3482, 11),
(3483, 8), (3483, 11), (3483, 12), (3499, 8);
GO

INSERT INTO Titulacao (Codigo, Titulo) VALUES
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor');
GO

INSERT INTO professores (registro, nome, titulacao_codigo) VALUES
(1111, 'Leandro', 2),
(1112, 'Antonio', 2),
(1113, 'Alexandre', 3),
(1114, 'Wellington', 2),
(1115, 'Luciano', 1),
(1116, 'Edson', 2),
(1117, 'Ana', 2),
(1118, 'Alfredo', 1),
(1119, 'Celio', 2),
(1120, 'Dewar', 3),
(1121, 'Julio', 1);
GO

INSERT INTO disciplina_professor (disciplina_codigo, professor_registro) VALUES
(1, 1111),
(2, 1112),
(3, 1113),
(4, 1114),
(5, 1115),
(6, 1116),
(7, 1117),
(8, 1118),
(9, 1117),
(10, 1119),
(11, 1120),
(12, 1121);
GO

INSERT INTO cursos (codigo, nome, area) VALUES 
(1, 'ADS', 'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil');
GO

INSERT INTO curso_disciplina (disciplina_codigo, curso_codigo) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2);
GO


--1 Como fazer as listas de chamadas, com RA e nome por disciplina ?
SELECT alunos.ra, alunos.nome, disciplinas.nome AS disciplina
FROM alunos
INNER JOIN aluno_disciplina ON alunos.ra = aluno_disciplina.aluno_ra
INNER JOIN disciplinas ON aluno_disciplina.disciplina_codigo = disciplinas.codigo
ORDER BY disciplina, alunos.nome;

--2 Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram
SELECT disciplinas.nome AS disciplina, professores.nome AS professor
FROM disciplinas 
INNER JOIN disciplina_professor ON disciplinas.codigo = disciplina_professor.disciplina_codigo
INNER JOIN professores ON disciplina_professor.professor_registro = professores.registro
ORDER BY disciplina;

--3 Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do curso
SELECT disciplinas.nome AS disciplina, cursos.nome AS curso
FROM disciplinas
INNER JOIN curso_disciplina ON disciplinas.codigo = curso_disciplina.disciplina_codigo
INNER JOIN cursos ON curso_disciplina.curso_codigo = cursos.codigo
ORDER BY curso;

--4 Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área
SELECT disciplinas.nome AS disciplina, cursos.area AS area
FROM disciplinas 
INNER JOIN curso_disciplina ON disciplinas.codigo = curso_disciplina.disciplina_codigo
INNER JOIN cursos ON curso_disciplina.curso_codigo = cursos.codigo;

--5 Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra
SELECT disciplinas.nome AS disciplina, titulacao.titulo AS titulo
FROM disciplinas
INNER JOIN disciplina_professor ON disciplinas.codigo = disciplina_professor.disciplina_codigo
INNER JOIN professores ON disciplina_professor.professor_registro = professores.registro
INNER JOIN titulacao ON professores.titulacao_codigo = titulacao.codigo;

--6 Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas
SELECT disciplinas.nome AS disciplina,  COUNT(aluno_disciplina.aluno_ra)AS alunos
FROM disciplinas
INNER JOIN aluno_disciplina ON aluno_disciplina.disciplina_codigo = disciplinas.codigo
GROUP BY disciplinas.nome;

--7 Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor. Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados
SELECT disciplinas.nome AS disciplina, professores.nome AS professor,  COUNT(aluno_disciplina.aluno_ra) AS alunos
FROM disciplinas 
INNER JOIN disciplina_professor ON disciplinas.codigo = disciplina_professor.disciplina_codigo
INNER JOIN professores ON disciplina_professor.professor_registro = professores.registro
INNER JOIN aluno_disciplina ON aluno_disciplina.disciplina_codigo = disciplinas.codigo
GROUP BY disciplinas.nome, professores.nome
HAVING COUNT(aluno_disciplina.aluno_ra) >= 5;

--8 Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram aula nele. A coluna de ve se chamar quantidade
SELECT cursos.nome AS curso, COUNT(DISTINCT professores.registro) AS quantidade 
FROM cursos
INNER JOIN curso_disciplina ON cursos.codigo = curso_disciplina.curso_codigo
INNER JOIN disciplina_professor ON curso_disciplina.disciplina_codigo = disciplina_professor.disciplina_codigo
INNER JOIN professores ON disciplina_professor.professor_registro = professores.registro
GROUP BY cursos.nome;


