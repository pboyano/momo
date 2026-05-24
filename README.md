# MoMo

Projeto estático de plataforma de reserva de aulas de atividades físicas com fluxos diferenciados para alunos e professores.

## 📋 Descrição

MoMo é um site responsivo que simula uma plataforma de marketplace para aulas de atividades físicas. O projeto demonstra dois fluxos principais:

**Para Alunos:**
- Autenticação e login
- Busca e filtro de aulas disponíveis
- Reserva de aulas
- Gerenciamento de aulas reservadas
- Perfil pessoal

**Para Professores:**
- Autenticação e login
- Cadastro de novas aulas
- Gerenciamento de aulas criadas
- Perfil pessoal

## 📁 Estrutura de Arquivos

### Páginas Públicas
- `index.html` - página inicial de login
- `cadastro.html` - formulário de cadastro de novo usuário

### Páginas do Aluno
- `home-aluno.html` - dashboard principal do aluno
- `buscar-aulas.html` - página de busca e filtro de aulas
- `minhas-aulas-aluno.html` - aulas reservadas pelo aluno
- `perfil-aluno.html` - perfil do aluno

### Páginas do Professor
- `home-professor.html` - dashboard principal do professor
- `cadastrar-aula.html` - formulário para criar nova aula
- `minhas-aulas-professor.html` - aulas criadas pelo professor
- `perfil-professor.html` - perfil do professor

### Recursos
- `css/style.css` - estilos e customizações do site
- `js/script.js` - scripts para interatividade

## 🎨 Características

- ✅ Design responsivo com Bootstrap 5.3.3
- ✅ Navbar dinâmica com navegação contextual
- ✅ Filtros de busca de aulas (modalidade, região)
- ✅ Cards informativos com detalhes das aulas
- ✅ Sistema de créditos para pagamento de aulas
- ✅ Formulários intuitivos e bem estruturados
- ✅ Interface limpa e moderna com paleta de cores MoMo

## 🚀 Como Usar

1. Abra o arquivo `index.html` em um navegador
2. Realize login ou crie uma nova conta
3. Escolha seu tipo de conta (aluno ou professor)
4. Navegue conforme seu perfil:
   - **Como Aluno:** Busque aulas, reserve atividades e gerenie suas aulas
   - **Como Professor:** Crie novas aulas e gerenccie as existentes

## 🛠️ Tecnologias

- **HTML5** - Estrutura das páginas
- **CSS3** - Estilos customizados
- **Bootstrap 5.3.3** - Framework responsivo
- **JavaScript** - Interatividade (em desenvolvimento)

## 📊 Composição do Projeto

- HTML: 96.9%
- CSS: 2.9%
- JavaScript: 0.2%

## ⚠️ Observações Importantes

- ⚡ Este é um **projeto estático** - nenhuma integração com backend real
- 🔐 O login não valida credenciais reais
- 📡 As reservas não são persistidas em banco de dados
- 🔄 A navegação é feita por redirecionamento entre páginas HTML
- 📱 Layout totalmente responsivo para dispositivos móveis, tablets e desktops

## 🎯 Próximas Melhorias

- Integração com backend/API
- Sistema de autenticação real
- Persistência de dados em banco de dados
- Implementação de funcionalidades JavaScript avançadas
- Sistema de pagamento com créditos
- Notificações e mensagens entre usuários
