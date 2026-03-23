# Fib-Food — Status do frontend admin em 2026-03-18

## Concluído
- Frontend estabilizado no WSL/Linux
- npm install e build funcionando
- `.env.local` configurado para:
  - tenant 8010
  - catalog 8011
  - order 8012
  - kitchen 8013
  - reservation 8014
  - delivery 8015
  - loyalty 8016
- Rotas admin ativas restauradas em `src/App.tsx`
- Layout aprovado em uso: `src/components/admin/AdminLayout.tsx`
- Telas admin principais revisadas para uso por API real:
  - Dashboard
  - Categorias
  - Produtos
  - Pedidos
  - Mesas
  - PDV
  - KDS
  - Caixa
  - Reservas
  - Delivery
  - Fidelidade
  - Financeiro
  - Conta da mesa
  - Pagamento de conta
  - Fechamento
- Busca final sem `axios` ou `/api/` no admin real
- Build final validado com sucesso

## Confirmado por smoke test
- `8011 /categories` OK
- `8011 /products` OK
- `8012 /orders` OK
- `8012 /tables` OK
- `8012 /financial-dashboard/summary` OK
- `8012 /cash-sessions/current` OK
- `8012 /cash-movements/current` OK
- `8012 /cash-movements/current/summary` OK
- `8012 /table-account-summary/table/1` OK
- `8012 /table-closing-report/table/1` OK
- `8013 /tickets` OK
- `8014 /reservations` OK
- `8015 /deliveries` OK
- `8016 /loyalty/customers` OK
- `8016 /loyalty/customers/1/transactions` OK

## Pendências reais de backend
- `8012 /reports/daily` -> 404
- `8012 /reports/weekly` -> 404
- `8012 /reports/monthly` -> 404
- `8012 /external-payments` -> 404
- `8012 /table-safe-close/table/{id}` -> 404

## Tratamento aplicado no frontend
- Relatórios: tela permanece acessível, mas mostra aviso controlado quando backend não existe
- Pagamentos externos: tela permanece acessível, mas mostra aviso controlado quando backend não existe
- TablesPage: removida dependência de `table-safe-close`; fechamento seguro agora deriva de `remaining_total <= 0`
- KDS ajustado para contrato real:
  - endpoint `/tickets`
  - patch `/tickets/{ticket_id}/status`
  - status reais `preparing` e `ready`
- Delivery ajustado para contrato real:
  - endpoint `/deliveries`
  - patch `/deliveries/{delivery_id}/status`
  - status real `out_for_delivery`
- Loyalty ajustado para contrato real:
  - customers em `/loyalty/customers`
  - transações por cliente em `/loyalty/customers/{id}/transactions`

## Próxima etapa sugerida do cronograma
1. Implementar backend de relatórios no order-api
2. Implementar backend de pagamentos externos no order-api
3. Revisar UX final removendo `alert()` das telas admin
4. Fazer rodada de navegação manual página a página
5. Publicar frontend em serviço estável

