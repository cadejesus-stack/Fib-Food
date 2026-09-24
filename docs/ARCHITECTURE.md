# Arquitetura Fib-Food

## Princípios

1. **Isolamento por tenant:** toda leitura e escrita de dados de negócio deve ser vinculada a um `tenant_id` validado pela autenticação.
2. **Marca configurável, núcleo único:** logo, cores, domínio, textos e integrações são configurações por tenant; não forks do código.
3. **Contratos versionados:** APIs e eventos entre serviços precisam de versão, autenticação de serviço e observabilidade.
4. **Operação auditável:** mudanças de preço, descontos, pagamentos, cancelamentos e permissões precisam de autor, data e correlação.
5. **Falha segura:** não concluir cobrança, fechamento de mesa ou mudança de estado de pedido sem confirmação persistida.

## Contextos de domínio

| Contexto | Serviço previsto | Dono dos dados |
| --- | --- | --- |
| Tenant, marca e usuários | tenant-api | configuração do tenant e autorização |
| Catálogo | food-catalog-api | categorias, produtos, complementos e preços |
| Pedido e pagamentos | food-order-api | pedidos, contas, caixa e conciliação |
| Produção | food-kitchen-api | tickets de cozinha e tempos |
| Reserva | food-reservation-api | disponibilidade e reservas |
| Entrega | food-delivery-api | despacho e status da entrega |
| Fidelidade | food-loyalty-api | cliente, saldo e transações |

## Regras mínimas de integração

- Propagar `tenant_id`, `request_id` e identidade do ator entre serviços.
- Derivar o tenant do token/sessão no gateway ou no serviço autenticador; um header como `X-Tenant-ID` é apenas contexto adicional validado, nunca autoridade isolada.
- Aplicar filtros de tenant no repositório de dados e testes de isolamento para cada endpoint.
- Usar idempotência em criação de pedido, cobrança, webhooks e mudança de status.
- Publicar eventos de domínio após persistência transacional; consumidores devem ser idempotentes.

## Configuração white-label

O `tenant-api` deve expor uma configuração de marca por tenant, por exemplo: nome comercial, logo, paleta, domínio permitido, idioma, fuso horário, moeda, módulos contratados e integrações habilitadas. O frontend deve carregar essa configuração no início da sessão e usar tokens de design, sem condicionais de marca espalhados nas telas.
