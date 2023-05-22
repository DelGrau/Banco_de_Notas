CREATE TABLE Pessoa(
	id_pessoa INT PRIMARY KEY NOT NULL,
	nome VARCHAR(50) NOT NULL
);

-- --------------------------------------------------------------------------

CREATE TABLE Periodo(
	id_periodo INT PRIMARY KEY NOT NULL,
	descricao VARCHAR(100) NOT NULL
);

-- --------------------------------------------------------------------------

CREATE TABLE Professor(	
	id_professor INT PRIMARY KEY NOT NULL,
	id_pessoa INT NOT NULL,
	id_disciplina INT NOT NULL
);

-- --------------------------------------------------------------------------

CREATE TABLE Disciplina (
	id_disciplina INT PRIMARY KEY NOT NULL,
	descricao VARCHAR(50),
	id_professor INT,
	id_periodo INT,
	CONSTRAINT fk_idprofessor FOREIGN KEY (id_professor) REFERENCES Professor (id_professor),
	CONSTRAINT fk_idperiodo FOREIGN KEY (id_periodo) REFERENCES Periodo (id_periodo)
);

-- --------------------------------------------------------------------------

CREATE TABLE Turma(
	id_turma INT PRIMARY KEY NOT NULL,
	descricao VARCHAR(50) NOT NULL
);

-- --------------------------------------------------------------------------

CREATE TABLE Alunos (
	id_aluno INT PRIMARY KEY NOT NULL,
	id_Pessoa INT NOT NULL,
	id_turma INT NOT NULL,
	matricula VARCHAR(8) NOT NULL,
	CONSTRAINT fk_idpessoa FOREIGN KEY (id_Pessoa) REFERENCES Pessoa (id_Pessoa),
	CONSTRAINT fk_idturma FOREIGN KEY (id_turma) REFERENCES Turma (id_turma),
	CONSTRAINT fk_idmatricula FOREIGN KEY (id_matricula) REFERENCES Matricula (id_matricula)
);

-- --------------------------------------------------------------------------

CREATE TABLE Notas(
	id_nota PRIMARY KEY NOT NULL,
	nota REAL,
	id_periodo INT,
	id_disciplina INT,
	id_aluno INT,
	CONSTRAINT fk_idaluno FOREIGN KEY(id_aluno) REFERENCES Aluno (id_aluno),
	CONSTRAINT fk_iddisciplina FOREIGN KEY(id_disciplina) REFERENCES Disciplina (id_disciplina),
	CONSTRAINT fk_idperiodo FOREIGN KEY (id_periodo) REFERENCES Periodo(id_periodo)
);

-- --------------------------------------------------------------------------

CREATE TABLE Recuperacao(
	id_recuperacao int PRIMARY KEY NOT NULL,
	id_aluno int,
	id_disciplina int,
	id_nota int,
	data TIMESTAMP(6),
	CONSTRAINT fk_idaluno FOREIGN KEY(id_aluno) REFERENCES Alunos (id_aluno),
	CONSTRAINT fk_iddisciplina FOREIGN KEY(id_disciplina) REFERENCES Disciplina (id_disciplina),
	CONSTRAINT fk_idnota FOREIGN KEY (id_nota) REFERENCES Notas (id_nota)
);