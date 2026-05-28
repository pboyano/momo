-- 1. Criando os Usuários genéricos no sistema
INSERT INTO "usuario" ("id_usuario", "nome", "email", "senha", "telefone", "tipo_usuario", "data_cadastro") VALUES
(1, 'João Silva', 'joao@email.com', '123', '19999999999', 'aluno', '2026-05-28 10:00:00'),
(2, 'Maria Souza', 'maria@email.com', '123', '19988888888', 'aluno', '2026-05-28 10:05:00'),
(3, 'Carlos Lima', 'carlos@email.com', '123', '19977777777', 'professor', '2026-05-28 10:10:00'),
(4, 'Ana Costa', 'ana@email.com', '123', '19966666666', 'professor', '2026-05-28 10:15:00');

-- 2. Vinculando e definindo quem é Aluno e o saldo de créditos
INSERT INTO "aluno" ("id_aluno", "id_usuario", "saldo") VALUES
(1, 1, 100.00),
(2, 2, 50.00);

-- 3. Vinculando quem é Professor e as suas especialidades
INSERT INTO "professor" ("id_professor", "id_usuario", "especialidade", "descricao", "saldo") VALUES
(1, 3, 'Yoga', 'Aulas para iniciantes e avançados', 0.00),
(2, 4, 'Alongamento', 'Movimentos leves para o dia a dia', 0.00);

-- 4. Cadastrando as Aulas ofertadas pelos professores
INSERT INTO "aula" ("id_aula", "id_professor", "titulo", "descricao", "modalidade", "data_aula", "hora_aula", "duracao", "valor_creditos", "vagas", "status") VALUES
(1, 1, 'Yoga Matinal', 'Aula de Yoga para começar bem o dia', 'Presencial', '2026-06-01', '08:00:00', 60, 10, 15, 'Ativa'),
(2, 2, 'Alongamento Postural', 'Foco em melhorar a postura', 'Online', '2026-06-02', '14:00:00', 45, 8, 20, 'Ativa');

-- 5. Criando as Reservas dos alunos nas respectivas aulas
INSERT INTO "reserva" ("id_reserva", "id_aluno", "id_aula", "status", "data_reserva", "checkin") VALUES
(1, 1, 1, 'confirmada', '2026-05-28 10:30:00', false),
(2, 2, 2, 'pendente', '2026-05-28 10:35:00', false);