# 🏃 MoMo - Move More

> Conectando alunos a profissionais de educação física autônomos

Uma plataforma web responsiva que permite que alunos encontrem e reservem aulas com profissionais de educação física independentes de forma flexível através de um sistema de créditos.

---

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Banco de Dados](#banco-de-dados)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Como Executar](#como-executar)
- [Credenciais de Teste](#credenciais-de-teste)

---

## 👁️ Visão Geral

O **MoMo** é uma plataforma que democratiza o acesso a aulas de atividades físicas com profissionais autônomos. Funciona como um **Gympass descentralizado**, onde:

- **Alunos** compram créditos para reservar aulas com diferentes profissionais
- **Profissionais** oferecem suas aulas e ganham créditos por cada aula ministrada
- Sem mensalidades pesadas, com total flexibilidade para ambos os lados

---

## ✨ Funcionalidades

### 🎓 Para Alunos

| Funcionalidade | Descrição |
|---|---|
| **Autenticação** | Login simulado com reconhecimento automático de perfil |
| **Descoberta de Aulas** | Busca, filtragem e exploração de aulas por modalidade, local e professor |
| **Agendamento Rápido** | Reserva instantânea de vagas com abatimento automático de créditos |
| **Checkout Integrado** | Modal interativo preparado para integração com Stripe ou Mercado Pago |
| **Dashboard Pessoal** | Histórico completo de aulas reservadas e estatísticas de treino |
| **Extrato Financeiro** | Relatório detalhado de compra e consumo de créditos |

### 👨‍🏫 Para Profissionais

| Funcionalidade | Descrição |
|---|---|
| **Painel de Controle** | Visualização de receita em créditos e estatísticas em tempo real |
| **Criação de Aulas** | Formulário estruturado para cadastro com capacidade, local e preço em créditos |
| **Gestão de Agenda** | Listagem dinâmica de aulas ofertadas com ferramentas de edição e cancelamento |
| **Histórico de Alunos** | Controle de alunos atendidos e avaliações recebidas |

---

## 🛠️ Tecnologias

```
Frontend
├── HTML5 (Estruturação semântica)
├── CSS3 (Variáveis nativas, gradientes e animações)
├── JavaScript ES6 (Lógica e persistência)
└── Bootstrap 5.3.3 (Responsividade mobile-first)

Persistência
└── Web Storage API (localStorage)
```

---

## 💾 Banco de Dados

### Visão Geral

O MoMo utiliza **localStorage** como persistência de dados local, simulando um banco de dados relacional. Os dados são armazenados em formato JSON e carregados automaticamente ao iniciar a aplicação.

> 📝 **Nota**: Esta é uma implementação de prototipagem. Para produção, integre um backend com um banco de dados SQL ou NoSQL real (PostgreSQL, MongoDB, etc).

### Estrutura de Dados

#### **Tabela: Usuários**
```json
{
  "id": 1,
  "nome": "Maria Silva",
  "email": "maria@email.com",
  "tipo": "aluno",
  "saldo": 120
}
```

| Campo | Tipo | Descrição |
|---|---|---|
| `id` | Integer (PK) | Identificador único do usuário |
| `nome` | String | Nome completo do usuário |
| `email` | String (UK) | Email único para login |
| `tipo` | String | "aluno" ou "professor" |
| `saldo` | Integer | Quantidade de créditos disponíveis |

#### **Tabela: Aulas**
```json
{
  "id": 1,
  "titulo": "Yoga Matinal",
  "descricao": "Aula de yoga relaxante",
  "professor_id": 2,
  "modalidade": "Yoga",
  "local": "Parque do Ibirapuera",
  "capacidade": 15,
  "inscritos": 8,
  "custo_creditos": 5,
  "data": "2024-06-15",
  "horario": "08:00"
}
```

| Campo | Tipo | Descrição |
|---|---|---|
| `id` | Integer (PK) | Identificador único da aula |
| `titulo` | String | Nome da aula |
| `descricao` | String | Detalhes da aula |
| `professor_id` | Integer (FK) | Referência ao professor (Usuários.id) |
| `modalidade` | String | Tipo de atividade (Yoga, Pilates, etc) |
| `local` | String | Endereço ou local da aula |
| `capacidade` | Integer | Máximo de alunos permitidos |
| `inscritos` | Integer | Quantidade atual de inscritos |
| `custo_creditos` | Integer | Créditos necessários para reservar |
| `data` | Date | Data da aula (YYYY-MM-DD) |
| `horario` | Time | Horário de início (HH:MM) |

#### **Tabela: Reservas**
```json
{
  "id": 1,
  "aluno_id": 1,
  "aula_id": 5,
  "data_reserva": "2024-06-10T14:30:00Z",
  "status": "confirmada",
  "creditos_pagos": 5
}
```

| Campo | Tipo | Descrição |
|---|---|---|
| `id` | Integer (PK) | Identificador único da reserva |
| `aluno_id` | Integer (FK) | Referência ao aluno (Usuários.id) |
| `aula_id` | Integer (FK) | Referência à aula (Aulas.id) |
| `data_reserva` | DateTime | Timestamp da reserva |
| `status` | String | "confirmada", "cancelada", etc |
| `creditos_pagos` | Integer | Quantidade de créditos debitados |

#### **Tabela: Transações**
```json
{
  "id": 1,
  "usuario_id": 1,
  "tipo": "compra",
  "descricao": "Compra de 50 créditos",
  "valor_creditos": 50,
  "data": "2024-06-10T14:30:00Z",
  "saldo_anterior": 70,
  "saldo_novo": 120
}
```

| Campo | Tipo | Descrição |
|---|---|---|
| `id` | Integer (PK) | Identificador único da transação |
| `usuario_id` | Integer (FK) | Referência ao usuário (Usuários.id) |
| `tipo` | String | "compra", "reserva", "cancelamento", etc |
| `descricao` | String | Detalhes da transação |
| `valor_creditos` | Integer | Valor em créditos (positivo ou negativo) |
| `data` | DateTime | Timestamp da transação |
| `saldo_anterior` | Integer | Saldo antes da transação |
| `saldo_novo` | Integer | Saldo após a transação |

### Fluxo de Operações

#### 🔐 Login
1. Usuário insere email na tela de autenticação
2. Sistema busca o usuário em localStorage
3. Se encontrado, carrega dados na sessão (`usuarioLogado`)
4. Se não encontrado, faz fallback para usuário padrão (aluno)
5. Redireciona para dashboard correspondente

#### 💳 Reserva de Aula
1. Aluno clica em "Reservar" em uma aula
2. Sistema verifica se `saldo >= custo_creditos`
3. **Se saldo insuficiente**: mostra alerta e interrompe
4. **Se saldo suficiente**:
   - Debita créditos do aluno: `saldo -= custo_creditos`
   - Incrementa inscritos da aula: `inscritos += 1`
   - Registra transação de débito
   - Exibe página de confirmação

#### 📊 Atualização de Dashboard
1. Página carrega dados do `usuarioLogado`
2. Injeta dinamicamente nome e saldo
3. Busca aulas disponíveis ou do professor
4. Calcula estatísticas em tempo real
5. Atualiza a cada mudança no localStorage

### Validações de Negócio

✅ **Bloqueio de saldo insuficiente** - Não permite reservar sem créditos  
✅ **Capacidade máxima** - Aulas não podem exceeder limite de inscritos  
✅ **Singularidade de email** - Cada usuário tem email único  
✅ **Rastreabilidade** - Toda transação é registrada com timestamp  
✅ **Integridade referencial** - Aulas e reservas referem usuários válidos  

### Migrando para Banco de Dados Real

Para conectar a um backend real, substitua as chamadas a `localStorage` por requisições HTTP:

```javascript
// Antes (localStorage)
const usuarios = JSON.parse(localStorage.getItem('usuarios'));

// Depois (API REST)
const response = await fetch('/api/usuarios');
const usuarios = await response.json();
```

Endpoints sugeridos:
- `GET /api/usuarios/:id` - Obter usuário
- `POST /api/usuarios` - Criar usuário
- `GET /api/aulas` - Listar aulas
- `POST /api/reservas` - Criar reserva
- `GET /api/transacoes/:usuario_id` - Histórico

---

## 📁 Estrutura do Projeto

```
momo/
├── assets/
│   ├── css/
│   │   └── style.css          # Identidade visual, variáveis e animações
│   ├── js/
│   │   └── script.js          # Motor da aplicação e lógica de negócio
│   └── img/                   # Imagens e vetores
│
├── pages/                     # Módulos da aplicação
│   ├── buscar-aulas.html      # Descoberta de aulas
│   ├── cadastrar-aula.html    # Criação de nova aula
│   ├── cadastro.html          # Registro de novo usuário
│   ├── editar-aula.html       # Edição de aula existente
│   ├── home-aluno.html        # Dashboard do aluno
│   ├── home-professor.html    # Dashboard do professor
│   ├── minhas-aulas-aluno.html
│   ├── minhas-aulas-professor.html
│   ├── perfil-aluno.html
│   ├── perfil-professor.html
│   ├── reserva.html           # Confirmação de reserva
│   └── saldo.html             # Central financeira
│
├── docs/
│   └── der.png                # Diagrama de Entidade-Relacionamento
│
├── index.html                 # Tela de autenticação
└── README.md
```

---

## 🚀 Como Executar

### 1. Baixar o Projeto
```bash
git clone https://github.com/pboyano/momo.git
cd momo
```

### 2. Abrir no Navegador
Simplesmente abra o arquivo `index.html` em qualquer navegador moderno.

```
Navegadores suportados:
✓ Chrome 90+
✓ Firefox 88+
✓ Safari 14+
✓ Edge 90+
```

---

## 🔐 Credenciais de Teste

Use estas credenciais para testar a plataforma:

### 👩‍🎓 Acesso Aluno
```
E-mail: maria@email.com
Senha: (qualquer senha)
Créditos iniciais: 120
```

### 👨‍🏫 Acesso Profissional
```
E-mail: lucas@email.com
Senha: (qualquer senha)
Créditos iniciais: 320
```

---

## 🎨 Destaques Técnicos

- ✅ **Responsivo**: Mobile-first design com Bootstrap
- ✅ **Offline-first**: Persistência de dados com localStorage
- ✅ **Validação de Regras**: Bloqueio de reservas sem saldo suficiente
- ✅ **Acessibilidade**: HTML semântico e estruturado
- ✅ **UX Refinada**: Feedbacks visuais e modais nativos
- ✅ **Preparado para Backend**: IDs únicos em tags críticas

---

## 📊 Evoluções Recentes

- 🔄 Refatoração da arquitetura e componentização
- 📦 Encapsulação de assets em pasta dedicada
- 🆔 Adição de identificadores exclusivos (id, form)
- 🚫 Remoção de transferência direta de saldo (segurança financeira)
- 🎯 Padronização de caminhos relativos
- 💬 Feedbacks visuais em lugar de redirecionamentos

---

## 📄 Licença

Este projeto é de código aberto e livre para uso educacional e comercial.

---

**Desenvolvido com ❤️ por Priscila Boyano Marinho**
