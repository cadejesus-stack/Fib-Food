# Lacunas conhecidas

## Bloqueadores do snapshot atual

- Os diretórios de código `services/` e `src/` não estão presentes.
- Não há manifestos de dependência, migrations, testes ou pipeline CI disponíveis.
- O ambiente local analisado não possui Docker instalado.

## Pendências funcionais registradas

O checkpoint de frontend registra ausência, no `food-order-api`, dos relatórios diário, semanal e mensal, pagamentos externos e do endpoint de fechamento seguro de mesa. Essas lacunas devem ter contrato, autorização, testes e auditoria antes de serem vendidas como funcionalidade disponível.

## Como priorizar

Use o roteiro em [`COMMERCIALIZATION_STRATEGY.md`](COMMERCIALIZATION_STRATEGY.md): recuperação do código é P0; isolamento multi-tenant, operação de pedido/pagamento, caixa, backup/restauração e segurança bloqueiam a venda; relatórios e pagamentos externos entram como P1 antes de prometer os módulos correspondentes.
