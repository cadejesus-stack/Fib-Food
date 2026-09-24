# Fib-Food

Plataforma SaaS **white-label** para operação de restaurantes, bares e dark kitchens. Cada operação possui identidade visual, catálogo, fluxo de pedidos e dados isolados, enquanto a plataforma central mantém provisionamento, observabilidade e evolução do produto.

> **Estado deste repositório:** esta cópia contém a base de infraestrutura e documentação, mas não inclui os diretórios de código `services/` e `src/`. Consulte [Recuperação do código-fonte](#recuperação-do-código-fonte) antes de tentar executar o sistema.

## Produto e proposta white-label

O Fib-Food suporta operações de salão, PDV, cozinha (KDS), delivery, reservas, fidelidade e financeiro. A oferta white-label permite que cada cliente comercialize a solução com sua própria marca, domínio e catálogo, sem acesso aos dados de outros clientes.

| Camada | Responsabilidade |
| --- | --- |
| Plataforma | provisionamento de tenants, observabilidade, suporte, atualizações e governança |
| Tenant | marca, domínio, catálogo, preços, equipe, mesas, pedidos e regras operacionais |
| Usuário final | operação de caixa, salão, cozinha, entregas e autoatendimento conforme as permissões |

O modelo operacional, limites de customização e requisitos de isolamento estão definidos em [`docs/WHITE_LABEL.md`](docs/WHITE_LABEL.md). A arquitetura-alvo está em [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

## Serviços previstos

| Serviço | Porta local | Função |
| --- | ---: | --- |
| tenant-api | 8010 | tenants, identidade operacional e sessões de mesa |
| food-catalog-api | 8011 | categorias, produtos e preços |
| food-order-api | 8012 | pedidos, contas, caixa e pagamentos |
| food-kitchen-api | 8013 | tickets e estados de cozinha |
| food-reservation-api | 8014 | reservas |
| food-delivery-api | 8015 | entregas |
| food-loyalty-api | 8016 | clientes e fidelidade |
| postgres | `${POSTGRES_PORT}` | persistência |

## Início rápido (quando o código estiver restaurado)

1. Copie o template: `cp .env.example .env`.
2. Gere valores fortes para `POSTGRES_PASSWORD` e `JWT_SECRET`; nunca versione o arquivo `.env`.
3. Recupere os diretórios `services/` e, se aplicável, `src/` do repositório/fonte oficial.
4. Valide a configuração: `docker compose config --quiet`.
5. Suba o ambiente: `docker compose up --build`.
6. Execute o smoke test: `pwsh ./test-apis.ps1`.

Para o procedimento completo de operação e publicação, use [`docs/OPERATIONS.md`](docs/OPERATIONS.md) e [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md).

## Recuperação do código-fonte

Não execute `docker compose up` nesta cópia enquanto os contextos `services/*` estiverem ausentes. Recupere um clone que contenha os serviços e o frontend e confirme que a árvore possui, ao menos:

```text
services/tenant-api
services/food-catalog-api
services/food-order-api
services/food-kitchen-api
services/food-reservation-api
services/food-delivery-api
services/food-loyalty-api
src/                         # se o frontend estiver no mesmo repositório
```

Depois, siga a lista de aceite em [`docs/RECOVERY_CHECKLIST.md`](docs/RECOVERY_CHECKLIST.md).

## Segurança

- Não versione segredos, chaves, dumps de banco ou artefatos internos do Git.
- Use um gerenciador de segredos no ambiente publicado.
- Mantenha bancos, filas e observabilidade fora da rede pública.
- Faça validação de autorização em todos os serviços; o identificador do tenant não pode vir de uma fonte não confiável sem validação pelo token/sessão.
- Antes de uma venda, conclua o checklist de lançamento em [`docs/WHITE_LABEL.md`](docs/WHITE_LABEL.md).

## Documentação

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) — arquitetura e contratos entre camadas.
- [`docs/WHITE_LABEL.md`](docs/WHITE_LABEL.md) — modelo comercial e técnico white-label.
- [`docs/OPERATIONS.md`](docs/OPERATIONS.md) — execução, backup e suporte.
- [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md) — publicação por ambiente.
- [`docs/RECOVERY_CHECKLIST.md`](docs/RECOVERY_CHECKLIST.md) — recuperação deste snapshot incompleto.
- [`docs/KNOWN_GAPS.md`](docs/KNOWN_GAPS.md) — lacunas conhecidas e prioridades.
- [`docs/COMMERCIALIZATION_STRATEGY.md`](docs/COMMERCIALIZATION_STRATEGY.md) — roteiro, gates e métricas para concluir e comercializar o produto.
