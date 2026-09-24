# Operações

## Ambiente local

Use `.env.example` como ponto de partida e mantenha `.env` apenas na máquina/gerenciador de segredos. Antes de subir os containers, valide se todos os contextos de build em `services/` existem.

## Rotina operacional mínima

- monitorar saúde, latência, taxa de erro e fila de cada API;
- correlacionar logs por `request_id` e `tenant_id`, sem registrar segredos ou dados de cartão;
- executar backup do PostgreSQL e teste de restauração periódico;
- revisar usuários administrativos, permissões e tenants suspensos;
- registrar incidentes, impacto por tenant e comunicação de suporte.

## Incidentes

1. Identifique tenant, período, serviço e `request_id` afetados.
2. Preserve evidências sem expor PII ou segredos.
3. Para pagamentos ou fechamento de mesa, priorize consistência: não repita uma operação sem chave de idempotência.
4. Informe o cliente usando o canal e SLA contratados.
5. Execute análise pós-incidente e transforme a correção em monitoramento ou teste automatizado.
