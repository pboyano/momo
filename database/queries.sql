-- =====================================================================
-- 1. OPERAÇÕES DE LEITURA (SELECT / READ)
-- =====================================================================

-- Listar todos os alunos (buscando o nome e email que estão na tabela usuario)
SELECT a.id_aluno, u.nome, u.email, a.saldo 
FROM "aluno" a
JOIN "usuario" u ON a.id_usuario = u.id_usuario;

-- Listar todas as aulas exibindo o nome do respectivo professor
SELECT 
    au.id_aula,
    au.titulo,
    au.data_aula,
    au.hora_aula,
    u.nome AS professor
FROM "aula" au
JOIN "professor" p ON au.id_professor = p.id_professor
JOIN "usuario" u ON p.id_usuario = u.id_usuario;

-- Ver o histórico de reservas de um aluno específico (Ex: Aluno ID 1)
SELECT 
    r.id_reserva,
    au.titulo,
    r.status,
    au.data_aula
FROM "reserva" r
JOIN "aula" au ON r.id_aula = au.id_aula
WHERE r.id_aluno = 1;


-- =====================================================================
-- 2. OPERAÇÕES DE ATUALIZAÇÃO (UPDATE)
-- =====================================================================

-- Atualizar o status de uma reserva específica
UPDATE "reserva"
SET status = 'confirmada'
WHERE id_reserva = 1;

-- Atualizar dados cadastrais do Usuário (Ex: Mudança de e-mail)
UPDATE "usuario"
SET email = 'novoemail@email.com'
WHERE id_usuario = 1;

-- Alterar informações de agendamento de uma aula
UPDATE "aula"
SET titulo = 'Yoga Avançado', descricao = 'Aula focada em técnicas avançadas.'
WHERE id_aula = 1;


-- =====================================================================
-- 3. OPERAÇÕES DE REMOÇÃO (DELETE)
-- =====================================================================

-- Cancelar/Remover uma reserva do sistema
DELETE FROM "reserva"
WHERE id_reserva = 2;


-- =====================================================================
-- 4. CONSULTA AVANÇADA (AGREGAÇÃO COM GROUP BY)
-- =====================================================================

-- Contabilizar quantas reservas cada aula possui cadastrada
SELECT 
    au.titulo,
    COUNT(r.id_reserva) AS total_reservas
FROM "aula" au
LEFT JOIN "reserva" r ON au.id_aula = r.id_aula
GROUP BY au.id_aula, au.titulo;