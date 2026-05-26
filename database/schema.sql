CREATE TABLE "usuario" (
  "id_usuario" int PRIMARY KEY,
  "nome" varchar,
  "email" varchar,
  "senha" varchar,
  "telefone" varchar,
  "tipo_usuario" varchar,
  "data_cadastro" datetime
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
  "data_reserva" datetime,
  "checkin" boolean
);

ALTER TABLE "usuario" ADD FOREIGN KEY ("id_usuario") REFERENCES "aluno" ("id_usuario") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "usuario" ADD FOREIGN KEY ("id_usuario") REFERENCES "professor" ("id_usuario") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "aula" ADD FOREIGN KEY ("id_professor") REFERENCES "professor" ("id_professor") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "reserva" ADD FOREIGN KEY ("id_aluno") REFERENCES "aluno" ("id_aluno") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "reserva" ADD FOREIGN KEY ("id_aula") REFERENCES "aula" ("id_aula") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "reserva" ADD FOREIGN KEY ("data_reserva") REFERENCES "reserva" ("id_aluno") DEFERRABLE INITIALLY IMMEDIATE;
