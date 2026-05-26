-- Listar todos os alunos
SELECT * FROM alunos;

-- Listar aulas com nome do professor
SELECT 
    a.id,
    a.titulo,
    a.data_hora,
    p.nome AS professor
FROM aulas a
JOIN professores p ON a.professor_id = p.id;

-- Ver reservas de um aluno
SELECT 
    r.id,
    a.titulo,
    r.status
FROM reservas r
JOIN aulas a ON r.aula_id = a.id
WHERE r.aluno_id = 1;

-- Atualizar status da reserva
UPDATE reservas
SET status = 'confirmada'
WHERE id = 1;

-- Atualizar dados do aluno
UPDATE alunos
SET email = 'novoemail@email.com'
WHERE id = 1;

-- Alterar aula
UPDATE aulas
SET titulo = 'Yoga Avançado', descricao = 'aula para avançados'
WHERE id = 1;

-- Remover reserva
DELETE FROM reservas
WHERE id = 2;

-- Remover aluno
DELETE FROM alunos
WHERE id = 2;

-- Remover aula
DELETE FROM aulas
WHERE id = 1;

-- Quantas reservas cada aula tem
SELECT 
    a.titulo,
    COUNT(r.id) AS total_reservas
FROM aulas a
LEFT JOIN reservas r ON a.id = r.aula_id
GROUP BY a.id, a.titulo;