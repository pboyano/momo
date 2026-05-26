-- Alunos
INSERT INTO alunos (nome, email, senha)
VALUES 
('João Silva', 'joao@email.com', '123'),
('Maria Souza', 'maria@email.com', '123');

-- Professores
INSERT INTO professores (nome, email, especialidade)
VALUES 
('Carlos Lima', 'carlos@email.com', 'Yoga'),
('Ana Costa', 'ana@email.com', 'Alongamento');

-- Aulas
INSERT INTO aulas (professor_id, titulo, descricao, data_hora)
VALUES
(1, 'Yoga', 'aula para inciantes', '2026-05-27 10:00:00'),
(2, 'Alongamento', 'Movimentos leves para alongar', '2026-05-28 14:00:00');

-- Reservas
INSERT INTO reservas (aluno_id, aula_id, status)
VALUES
(1, 1, 'confirmada'),
(2, 2, 'pendente');