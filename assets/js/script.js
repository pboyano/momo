// ==========================================================================
// SIMULAÇÃO DE BANCO DE DADOS LOCAL (Dados iniciais caso não existam)
// ==========================================================================
if (!localStorage.getItem('usuarios')) {
    const usuariosIniciais = [
        { id: 1, nome: "Maria Silva", email: "maria@email.com", tipo: "aluno", saldo: 120 },
        { id: 2, nome: "Professor Lucas", email: "lucas@email.com", tipo: "professor", saldo: 320 }
    ];
    localStorage.setItem('usuarios', JSON.stringify(usuariosIniciais));
}

// Guarda qual usuário está "logado" no momento (Simulação de Sessão)
let usuarioLogado = JSON.parse(localStorage.getItem('usuarioLogado')) || null;

// ==========================================================================
// 1. FLUXO DE LOGIN (Ajustado para identificar Aluno vs Professor)
// ==========================================================================
function login() {
    // Captura os inputs da tela index.html ou login.html
    const emailInput = document.getElementById('email')?.value;
    const usuarios = JSON.parse(localStorage.getItem('usuarios'));

    // Busca o usuário no nosso "banco" simulado
    const usuarioEncontrado = usuarios.find(u => u.email === emailInput);

    if (usuarioEncontrado) {
        // Salva a sessão do usuário logado
        localStorage.setItem('usuarioLogado', JSON.stringify(usuarioEncontrado));
        
        // CORREÇÃO: Redireciona para a Home correta baseada no tipo de perfil
        if (usuarioEncontrado.tipo === 'aluno') {
            window.location.href = "pages/home-aluno.html"; // Se estiver na raiz
        } else if (usuarioEncontrado.tipo === 'professor') {
            window.location.href = "pages/home-professor.html";
        }
    } else {
        // Fallback caso clique sem digitar ou para testes rápidos na banca:
        // Se não achar o e-mail, assume Aluno por padrão para não quebrar o clique
        localStorage.setItem('usuarioLogado', JSON.stringify(usuarios[0]));
        window.location.href = "home-aluno.html"; 
    }
}

// ==========================================================================
// 2. FLUXO DE RESERVA E COBRANÇA DE CRÉDITOS
// ==========================================================================
function reservarAula(idAula, custoCreditos) {
    usuarioLogado = JSON.parse(localStorage.getItem('usuarioLogado'));

    if (!usuarioLogado || usuarioLogado.tipo !== 'aluno') {
        alert("Erro: Você precisa estar logado como Aluno para reservar uma aula.");
        return;
    }

    // Verifica se o aluno tem créditos suficientes (Regra de Negócio do Banco!)
    if (usuarioLogado.saldo < custoCreditos) {
        alert(`Saldo insuficiente! Essa aula custa ${custoCreditos} créditos, e você possui apenas ${usuarioLogado.saldo}.`);
        return;
    }

    // Deduz o valor do saldo do aluno (UPDATE simulado)
    usuarioLogado.saldo -= custoCreditos;
    localStorage.setItem('usuarioLogado', JSON.stringify(usuarioLogado));

    // Atualiza a lista geral de usuários para salvar o novo saldo do aluno
    const usuarios = JSON.parse(localStorage.getItem('usuarios'));
    const index = usuarios.findIndex(u => u.id === usuarioLogado.id);
    if (index !== -1) {
        usuarios[index].saldo = usuarioLogado.saldo;
        localStorage.setItem('usuarios', JSON.stringify(usuarios));
    }

    // Redireciona para a tela de sucesso que arrumamos!
    window.location.href = "reserva.html";
}

// ==========================================================================
// 3. CARREGAMENTO DINÂMICO DE DADOS NAS TELAS (DASHBOARD)
// ==========================================================================
document.addEventListener("DOMContentLoaded", () => {
    usuarioLogado = JSON.parse(localStorage.getItem('usuarioLogado'));
    
    if (!usuarioLogado) return;

    // Injeta o nome do usuário logado nas saudações (Home Aluno e Home Professor)
    const nomeAlunoEl = document.getElementById('nome-aluno');
    const nomeProfessorEl = document.getElementById('nome-professor');
    if (nomeAlunoEl) nomeAlunoEl.textContent = usuarioLogado.nome;
    if (nomeProfessorEl) nomeProfessorEl.textContent = usuarioLogado.nome;

    // Injeta o saldo real nas páginas de Perfil e Saldo
    const saldoValorEl = document.getElementById('saldo-valor');
    const perfilSaldoEl = document.getElementById('perfil-saldo');
    
    if (saldoValorEl) saldoValorEl.textContent = usuarioLogado.saldo;
    if (perfilSaldoEl) perfilSaldoEl.value = `${usuarioLogado.saldo} créditos`;
});