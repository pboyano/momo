MoMo
Plataforma de marketplace e reserva de aulas de atividades físicas com fluxos e painéis diferenciados para alunos e professores.

Descrição do Projeto
O MoMo é uma aplicação web responsiva projetada para conectar entusiastas de atividades físicas a instrutores qualificados. O sistema opera através de um modelo de economia de créditos, onde alunos adquirem pacotes de créditos para reservar vagas em aulas, e professores gerenciam seus agendamentos e faturamento. Atualmente, o projeto conta com uma interface moderna e uma arquitetura de simulação funcional no frontend, onde os dados são persistidos no navegador através do localStorage, preparando a aplicação para a integração definitiva com um banco de dados relacional.

Funcionalidades Principais
Para Alunos
Autenticação: Login simulado que reconhece o perfil do usuário automaticamente.

Marketplace de Atividades: Busca, filtragem e exploração de aulas disponíveis por região e modalidade.

Sistema de Agendamento: Reserva instantânea de vagas com abatimento automático no saldo de créditos.

Simulação de Checkout: Modal interativo preparado para integração futura com gateways de pagamento externos, como Stripe ou Mercado Pago.

Dashboard e Extrato: Histórico completo de transações, incluindo entradas de créditos e saídas por reservas, acompanhado de um painel estatístico de evolução.

Para Professores
Painel de Controle Operacional: Visualização da receita em créditos e contadores em tempo real para controle de alunos atendidos e média de avaliações.

Módulo de Criação: Formulário estruturado para cadastro de novas aulas com definição de capacidade, local e custo em créditos.

Gestão de Grade: Listagem dinâmica das aulas ofertadas com ferramentas integradas para edição e cancelamento de registros.

Estrutura de Pastas e Arquivos
Abaixo está a organização dos arquivos após a refatoração do ecossistema e a componentização em pastas de recursos:

Plaintext
momo/
├── assets/
│   ├── css/
│   │   └── style.css       # Identidade visual, variáveis (:root) e micro-animações
│   ├── js/
│   │   └── script.js       # Motor da aplicação, lógica de créditos e localStorage
│   └── img/                # Imagens e vetores da plataforma
├── docs/
│   └── der.png             # Diagrama de Entidade-Relacionamento oficial do Banco
├── pages/                  # Módulos restritos da aplicação
│   ├── buscar-aulas.html
│   ├── cadastrar-aula.html
│   ├── cadastro.html
│   ├── editar-aula.html
│   ├── home-aluno.html
│   ├── home-professor.html
│   ├── minhas-aulas-aluno.html
│   ├── minhas-aulas-professor.html
│   ├── perfil-aluno.html
│   ├── perfil-professor.html
│   ├── reserva.html        # Tela de feedback de sucesso
│   └── saldo.html          # Central de finanças e extrato do aluno
├── index.html              # Tela de entrada e autenticação unificada
└── README.md


Tecnologias e Frameworks
HTML5: Estruturação otimizada para acessibilidade e semântica.

CSS3: Customização baseada em variáveis nativas, gradientes e efeitos de transição nos cards.

Bootstrap 5.3.3: Framework utilitário garantindo responsividade mobile-first e componentes como modais, navbars adaptativas e grids.

JavaScript (ES6): Manipulação dinâmica do DOM e lógica de persistência de sessão.

Web Storage API (localStorage): Persistência de dados simulada no cliente para validação das regras de negócio, como o bloqueio de reserva por falta de saldo.

Atualizações Recentes e Evolução Técnica
Refatoração de Escopo: Remoção da funcionalidade de transferência direta de saldo entre alunos para blindagem do ecossistema financeiro.

Padronização Arquitetural: Agrupamento de arquivos estáticos dentro da pasta encapsulada assets e correção de caminhos relativos em todas as visões.

Mapeamento de Dados: Inserção de identificadores exclusivos, como atributos id e form, em todas as tags críticas de exibição, preparando o HTML para as queries SELECT e UPDATE do módulo de banco de dados.

UX Refinada: Substituição de redirecionamentos brutos por feedbacks visuais estruturados, como a nova página de reserva concluída e modais nativos de recarga.

Como Executar a Aplicação
Clone o repositório ou baixe os arquivos do projeto.

Abra o arquivo raiz index.html em qualquer navegador moderno.

Para testar a simulação automatizada do banco de dados, utilize as seguintes credenciais padrão no campo de e-mail:

Acesso Aluno: maria@email.com (Inicia com 120 créditos para gastar em reservas)

Acesso Professor: lucas@email.com (Painel com 320 créditos e visão de instrutor)