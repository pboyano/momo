// ==========================================================================
// 1. FLUXO DE LOGIN (Corrigido para aceitar qualquer senha nos testes)
// ==========================================================================
function login() {
    // Captura os inputs da tela index.html
    const emailInput = document.getElementById('email')?.value;
    const senhaInput = document.getElementById('senha')?.value; // Captura a senha para não dar erro de leitura
    const usuarios = JSON.parse(localStorage.getItem('usuarios'));

    // Busca o usuário no nosso "banco" simulado pelo e-mail
    const usuarioEncontrado = usuarios.find(u => u.email === emailInput);

    if (usuarioEncontrado) {
        // Salva a sessão do usuário logado
        localStorage.setItem('usuarioLogado', JSON.stringify(usuarioEncontrado));
        
        // Redireciona para a Home correta baseada no tipo de perfil e na pasta assets
        if (usuarioEncontrado.tipo === 'aluno') {
            window.location.href = "pages/home-aluno.html";
        } else if (usuarioEncontrado.tipo === 'professor') {
            window.location.href = "pages/home-professor.html";
        }
    } else {
        // Fallback caso digitem qualquer outra coisa ou cliquem direto:
        // Entra como aluno por padrão usando o primeiro usuário do banco
        localStorage.setItem('usuarioLogado', JSON.stringify(usuarios[0]));
        window.location.href = "pages/home-aluno.html"; 
    }
}