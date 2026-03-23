
---

# Checkpoint — Backend Operacional Fib-Food
## Data
2026-03-23

## Status validado até o momento
### P0.4 — Abertura de mesa no backend
- abertura de mesa validada no tenant-api
- persistência de:
  - número da mesa
  - setor
  - area_kind
  - occupants_count
  - notes
- imagem persistida:
  - fib-food-tenant-api:p0-open-table-v19

### P0.4.1 — Ocupantes e comandas individuais por pessoa
- ocupantes por sessão de mesa validados
- comandas individuais por ocupante validadas
- endpoints de listagem funcionando

### P0.4.2 — Itens, subtotal, taxa e fechamento individual
- itens por comanda individual validados
- subtotal por comanda validado
- taxa por comanda validada
- total por comanda validado
- fechamento individual de comanda validado

### P0.4.3 — Conferência e fechamento total da mesa
- conferência por comanda validada
- fechamento total da mesa condicionado a todas as comandas fechadas validado

## Estado validado da sessão 2
- total_tabs: 4
- open_tabs: 0
- closed_tabs: 4
- can_close_table: true

## Conferência validada
- conference da tab 1 funcionando
- itens exibidos corretamente
- subtotal, taxa e total exibidos corretamente

## Container / imagem atual
- container validado:
  - fib-food-tenant-api
- imagem persistida:
  - fib-food-tenant-api:p0-open-table-v19

## Próximo passo
1. integrar os endpoints no frontend operacional:
   - abertura de mesa
   - ocupantes/comandas
   - itens por comanda
   - taxa por comanda
   - conferência por comanda
   - fechamento individual
   - fechamento total da mesa
2. revisar fluxo de KDS
3. revisar fluxo de Delivery

## Observação
- checkpoint encerrado com backend operacional persistido e validado até P0.4.3
- continuidade do projeto deve partir deste ponto

## P0.4.3 — Checkpoint frontend bridge
- backend operacional validado e persistido até fib-food-tenant-api:p0-open-table-v19
- criada camada frontend para consumo do tenant-api operacional
- criado client:
  - src/lib/operational/tenantOperationalApi.ts
- criados tipos:
  - src/types/operational/tableService.ts
- criada página bridge de validação:
  - /p042-bridge
- variável de ambiente frontend configurada:
  - VITE_TENANT_API_URL=http://127.0.0.1:8010

### Objetivo desta etapa
Preparar integração do frontend operacional com:
- abertura de mesa
- ocupantes/comandas
- itens por comanda
- taxa
- conferência
- fechamento individual
- status de fechamento da sessão

## Checkpoint — CORS tenant-api corrigido
### Data
2026-03-23

### Status
- CORS corrigido no tenant-api
- preflight OPTIONS validado com 200 OK
- origem liberada:
  - http://127.0.0.1:13001
- imagem persistida:
  - fib-food-tenant-api:p0-open-table-v20

### Evidência validada
- OPTIONS /tables/open -> 200 OK
- Access-Control-Allow-Origin -> http://127.0.0.1:13001

### Próximo passo
- validar bridge frontend em /p042-bridge
- integrar backend operacional nas telas reais de mesas/comandas/fechamento/conferência

## Checkpoint — Bridge operacional ajustada
- bridge frontend deixou de usar session_id/tab_id fixos
- agora usa:
  - session_id retornado no openTable
  - primeira tab aberta disponível
- ações inválidas são bloqueadas quando não existe comanda aberta
- objetivo:
  - evitar testes em comanda já fechada
  - preparar integração limpa nas telas reais

## Checkpoint — Bridge operacional dinâmica compilada
- página /p042-bridge compilada sem erro
- bridge ajustada para:
  - usar session_id retornado pelo openTable
  - usar primeira tab aberta disponível
  - bloquear ações inválidas quando não houver tab aberta
- próximo passo:
  - integrar a mesma lógica nas telas reais de mesas/comandas/fechamento/conferência

## Checkpoint — Bridge operacional dinâmica validada
- bridge compilada e executada sem erro
- fluxo dinâmico validado:
  - abertura de mesa
  - inicialização de ocupantes
  - listagem de comandas
  - item por comanda aberta
  - taxa por comanda aberta
  - conferência
  - fechamento individual
  - status de fechamento da sessão
- próximo passo:
  - integrar a mesma lógica nas telas reais de mesas/comandas/fechamento/conferência

## Checkpoint — Painel operacional reutilizável
- criado componente reutilizável:
  - src/components/operational/integration/OperationalSessionPanel.tsx
- criada página de integração real:
  - /p043-operational-integration
- objetivo:
  - preparar encaixe nas telas reais de mesas/comandas
  - centralizar fluxo operacional validado no backend
  - evitar uso de ids fixos e ações inválidas em tab fechada

## Checkpoint — Painel operacional encaixado na tela real de mesas
- painel reutilizável OperationalSessionPanel integrado na página real de mesas
- objetivo:
  - validar backend operacional dentro da tela real
  - manter layout aprovado
  - preparar substituição gradual dos mocks/estados locais pelo tenant-api
- próxima etapa:
  - ligar grid/ações reais da tela de mesas ao backend operacional

## Checkpoint — Integração do painel operacional na tela real de mesas
- página real de mesas localizada automaticamente
- painel OperationalSessionPanel encaixado sem remover layout existente
- objetivo:
  - validar backend real dentro da tela real
  - preparar substituição gradual dos fluxos locais/mocks
- próximo passo:
  - ligar ações nativas da tela de mesas ao hook useOperationalSession

## Checkpoint — Barra de ações operacionais reais na tela de mesas
- criado componente:
  - src/components/operational/integration/OperationalTablesActionsBar.tsx
- hook operacional encaixado na tela real de mesas
- integração feita sem remover o layout atual
- objetivo:
  - preparar substituição gradual das ações locais/mocks
  - validar backend operacional direto na tela real

## Checkpoint — Abertura real de mesa conectada na tela de mesas
- criado hook:
  - src/hooks/operational/useOpenOperationalTable.ts
- adicionada ação real temporária de abertura de mesa na tela real de mesas
- objetivo:
  - começar a substituir ações locais/mocks por chamadas reais ao tenant-api
- próximo passo:
  - ligar modal real de abertura de mesa ao submitOpenOperationalTable

## Checkpoint — Formulário real temporário de abertura na tela de mesas
- hook useOpenOperationalTable ligado na tela real de mesas
- criado formulário temporário com:
  - número da mesa
  - setor
  - área
  - ocupantes
- objetivo:
  - conectar a abertura real ao backend sem depender ainda do modal visual final
- próximo passo:
  - substituir o submit do modal visual definitivo por submitOpenOperationalTable

## Checkpoint — Preparação para trocar submit do modal visual de mesas
- helper handleSubmitOpenOperationalTableFromForm adicionado na página real de mesas
- objetivo:
  - trocar o submit do modal visual aprovado pela chamada real ao tenant-api
  - manter layout e campos visuais atuais
- próximo passo:
  - substituir o handler atual do modal pelo helper real

## Checkpoint — Tela operacional real TableAccountPage conectada
- página operacional identificada:
  - src/pages/ops/TableAccountPage.tsx
- hook de abertura real preparado nessa página
- barra OperationalTablesActionsBar encaixada no topo da tela operacional
- objetivo:
  - validar backend operacional dentro do fluxo real de mesa/comanda
- próximo passo:
  - substituir handlers locais específicos da página pelas chamadas reais ao tenant-api

## Correções em andamento — nomes e pagamento individual
- backend preparado para permitir editar nome do ocupante/comanda após abertura da mesa
- client frontend preparado com função updateGuest
- diagnóstico do fluxo de pagamento individual iniciado em:
  - src/pages/ops/TableAccountPage.tsx
- objetivo:
  - permitir renomear "Pessoa 1", "Pessoa 2" etc. após abertura
  - impedir pagamento direto ao clicar na comanda antes da escolha da forma de pagamento

## Correção aplicada — nomes de ocupantes e fluxo de pagamento individual
- backend corrigido com endpoint PATCH para editar nome do ocupante/comanda:
  - /table-sessions/{session_id}/guests/{guest_id}
- objetivo:
  - permitir renomear "Pessoa 1", "Pessoa 2" após abertura da mesa

- frontend operacional corrigido em:
  - src/pages/ops/TableAccountPage.tsx
- ajuste de fluxo:
  - removido atalho de pagamento direto ("Marcar paga")
  - fluxo passa a ir para escolha da forma de pagamento
  - encerramento da conta pode ser bloqueado enquanto houver saldo pendente


## Checkpoint — TableAccountPage estabilizada
- build voltou a passar sem erro
- removido fluxo de pagamento direto por função morta
- botão operacional agora deve seguir para escolha da forma de pagamento
- próxima etapa:
  - expor edição de nome do ocupante/comanda diretamente na tela operacional

## Correção aplicada — nomes de ocupantes/comandas
- backend com PATCH para editar ocupante/comanda após abertura da mesa
- regra de unicidade por sessão adicionada
- agora não deve permitir duplicar nome de comanda/ocupante na mesma mesa
- imagem persistida:
  - fib-food-tenant-api:p0-open-table-v21

## Checkpoint — edição de nome e duplicidade de ocupantes
- PATCH de ocupante validado
- edição de nome funcionando
- duplicidade de nome por sessão bloqueada
- ajuste final:
  - retorno amigável para duplicidade no endpoint update_guest
- imagem persistida:
  - fib-food-tenant-api:p0-open-table-v22

## Checkpoint — edição de nome direto na UI operacional
- criado componente:
  - src/components/operational/guests/OperationalGuestEditor.tsx
- editor ligado à tela operacional real:
  - src/pages/ops/TableAccountPage.tsx
- backend já validado para:
  - editar nome
  - bloquear duplicidade por sessão
