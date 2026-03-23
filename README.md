# ERP-SaaS para Provedores (ISP)

Plataforma **ERP SaaS multi-tenant**, desenvolvida para **ISPs**, integrando **Financeiro, Clientes, Contratos, RADIUS, CoA, NOC e Monitoramento**, com foco em **escala, isolamento de dados e automação operacional**.

---

## 🚀 Visão Geral

Este projeto foi construído com base em **cenários reais de operação ISP**, priorizando:

- Escalabilidade
- Segurança
- Automação
- Observabilidade
- Separação clara de responsabilidades

---

## 🧠 Arquitetura em Alto Nível

- **Arquitetura SaaS**
- **Multi-tenant por schema PostgreSQL**
- **Isolamento lógico total entre provedores**
- **Integração direta com NAS / OLT / BRAS**
- **Eventos de rede → ERP (tempo real)**

---

## 🧱 Principais Módulos

| Módulo | Descrição |
|------|---------|
| Auth API | JWT, CPF, RBAC, tenants |
| Tenant API | Clientes, contratos, financeiro |
| RADIUS | Auth, Accounting, CoA |
| Dashboard API | Métricas e sessões |
| Alerts API | Thresholds e capacidade |
| Portal do Cliente | Autoatendimento |
| Financeiro | Faturas, cortes, políticas |
| NOC | Monitoramento e eventos |

---

## 🔐 Multi-Tenant

- Cada ISP = **1 schema PostgreSQL**
- Schema dinâmico por `X-Tenant-ID`
- Tokens JWT carregam:
  - tenant_id
  - role
  - cliente_id (quando aplicável)

---

## 🌐 RADIUS & CoA

- FreeRADIUS integrado
- CoA real (Disconnect / Change)
- Vendor-agnostic:
  - MikroTik
  - Cisco
  - Huawei
  - Ubiquiti

---

## 🐳 Stack Tecnológica

- Python 3.12
- FastAPI
- PostgreSQL
- Docker / Docker Compose
- JWT
- FreeRADIUS
- Next.js (Dashboard)

---

## 🧪 Ambientes

| Ambiente | Status |
|-------|-------|
| Local (WSL2) | ✅ |
| Docker | ✅ |
| Produção VPS | 🔄 |

---

## 📄 Documentação

- [`ARCHITECTURE.md`](ARCHITECTURE.md)
- [`OPERATIONS.md`](OPERATIONS.md)
- [`DEPLOYMENT.md`](DEPLOYMENT.md)
- [`README_EXECUTIVO.md`](README_EXECUTIVO.md)

---

## 🔓 Open-Source vs Privado

Este repositório pode operar em **dois modos**:

### 🔹 Open-Source
- Sem dados sensíveis
- Mocks de RADIUS
- CoA em dry-run

### 🔹 Privado (Produção)
- CoA real
- Segredos via `.env`
- Integração direta com NAS

---

## 📌 Status do Projeto

> **v0.1.0 — MVP Operacional Completo**

---

## ⚠️ Aviso Legal

Este projeto envolve **infraestrutura crítica de rede**.  
Use com cuidado em ambientes produtivos.


---

## 🔧 Modo de Operação (Open-Source vs Privado)

O comportamento do sistema depende da variável:


### Open-Source
- CoA em modo dry-run
- Sem segredos reais
- RADIUS simulado ou restrito
- Logs educacionais

### Privado (Produção)
- CoA real
- Integração direta com NAS
- Segredos via `.env`
- Monitoramento ativo

> ⚠️ Nunca execute modo `private` sem ambiente controlado.


## Fib-Food - Cronograma de equiparacao 2026-03-22

Para o plano de evolucao do produto de restaurante (comparativo Takeart, sem totem), ver:
- `docs/CRONOGRAMA_EQUIPARACAO_TAKEART_2026-03-22.md`
