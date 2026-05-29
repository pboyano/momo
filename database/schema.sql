CREATE TABLE "usuario" (
  "id_usuario" int PRIMARY KEY,
  "nome" varchar,
  "email" varchar,
  "senha" varchar,
  "telefone" varchar,
  "tipo_usuario" varchar,
  "data_cadastro" timestamp
);

CREATE TABLE "aluno" (
  "id_aluno" int PRIMARY KEY,
  "id_usuario" int UNIQUE NOT NULL,
  "saldo" decimal
);

CREATE TABLE "professor" (
  "id_professor" int PRIMARY KEY,
  "id_usuario" int UNIQUE NOT NULL,
  "especialidade" varchar,
  "descricao" text,
  "saldo" decimal
);

CREATE TABLE "aula" (
  "id_aula" int PRIMARY KEY,
  "id_professor" int,
  "titulo" varchar,
  "descricao" text,
  "modalidade" varchar,
  "data_aula" datetime,
  "hora_aula" time,
  "duracao" int,
  "valor_creditos" int,
  "vagas" int,
  "status" varchar
);

CREATE TABLE "reserva" (
  "id_reserva" int PRIMARY KEY,
  "id_aluno" int,
  "id_aula" int,
  "status" varchar,
  "data_reserva" timestamp,
  "checkin" boolean
);

-- CORREÇÃO: O Aluno é quem possui o id_usuario apontando para a tabela pai (Usuario)
ALTER TABLE "aluno" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario");

-- CORREÇÃO: O Professor é quem possui o id_usuario apontando para a tabela pai (Usuario)
ALTER TABLE "professor" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario");

-- A aula aponta para o professor que vai ministrá-la
ALTER TABLE "aula" ADD FOREIGN KEY ("id_professor") REFERENCES "professor" ("id_professor");

-- A reserva aponta para o aluno que está agendando
ALTER TABLE "reserva" ADD FOREIGN KEY ("id_aluno") REFERENCES "aluno" ("id_aluno");

-- CORREÇÃO: A reserva aponta para a aula escolhida (e não para data_reserva)
ALTER TABLE "reserva" ADD FOREIGN KEY ("id_aula") REFERENCES "aula" ("id_aula");