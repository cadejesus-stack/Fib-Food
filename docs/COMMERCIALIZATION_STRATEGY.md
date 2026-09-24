# Estratégia de conclusão e comercialização

## Objetivo

Transformar o Fib-Food em um SaaS white-label comercializável para restaurantes, bares e dark kitchens **sem prometer funcionalidades que não possam ser operadas, suportadas e auditadas**. A estratégia prioriza uma oferta repetível: uma única base de código, configuração por tenant e implantação controlada por plano.

## Ponto de partida e princípio de decisão

O snapshot atual não inclui o código de `services/` nem `src/`; por isso, nenhuma data de venda deve ser assumida antes da recuperação e validação do código-fonte. O primeiro marco é técnico: somente funcionalidades verificadas entram em material comercial e contratos.

**Regra de produto:** não criar forks por cliente. Uma solicitação deve virar configuração por tenant, evolução reutilizável de plataforma ou integração versionada. Desenvolvimento exclusivo só é aceito com custo, suporte e plano de manutenção definidos.

## Oferta inicial recomendada

| Plano | Público | Módulos | Limites comerciais a definir |
| --- | --- | --- | --- |
| Essencial | operação de salão pequena | mesas, comandas, catálogo, pedidos, caixa e KDS | usuários, mesas, terminais e suporte |
| Profissional | restaurante com operação multicanal | Essencial + reservas, delivery e fidelidade | unidades, integrações e SLA |
| Rede | grupos e franquias | Profissional + gestão por unidade, integrações e suporte dedicado | tenants/unidades, relatórios e SLA |

Os nomes e preços são propostas de posicionamento; só devem ser publicados após validar custos de infraestrutura, suporte, impostos, meios de pagamento e margem por unidade.

## Roteiro de conclusão

### Fase 0 — Recuperar e estabelecer baseline

**Objetivo:** obter uma árvore executável e confiável do produto.

1. Localizar o repositório/backup que contenha `services/`, `src/`, migrations, manifestos de dependência, testes e pipelines.
2. Registrar commit de origem, versões de dependência e inventário de serviços/endpoints.
3. Rotacionar segredos que constavam no snapshot e confirmar que arquivos de ambiente não estão no histórico publicado.
4. Executar build, migrations, testes e smoke tests em ambiente isolado.
5. Atualizar a matriz de funcionalidades para separar o que está implementado, parcialmente implementado, ausente e não validado.

**Saída e gate:** todos os contextos do Compose existem, os serviços iniciam, a documentação corresponde ao código e existe uma baseline de testes reproduzível. Sem este gate, o projeto fica em recuperação, não em pré-venda.

### Fase 1 — Fechar o núcleo operacional vendável

**Objetivo:** garantir o ciclo completo e auditável de uma operação de restaurante.

| Prioridade | Entrega | Critério de aceite |
| --- | --- | --- |
| P0 | isolamento de tenant e RBAC | testes negativos provam que um tenant não lê nem altera dados de outro |
| P0 | pedido → KDS → entrega/mesa → pagamento → fechamento | fluxo persiste estado, suporta reexecução idempotente e deixa trilha de auditoria |
| P0 | caixa e fechamento de mesa | saldo, cancelamento, desconto e pagamento possuem autorização e reconciliação |
| P0 | backup e restauração | restauração testada e documentada, com objetivo de RPO/RTO definido |
| P1 | relatórios diário, semanal e mensal | números conciliam com pedidos e pagamentos em casos de teste |
| P1 | pagamentos externos | webhook assinado, idempotência, conciliação e contingência documentadas |
| P1 | delivery, reservas e fidelidade | contratos, erros e permissões cobertos por testes de integração |

**Saída e gate:** um restaurante piloto consegue operar um turno completo sem planilhas paralelas, perda de pedido ou fechamento manual; incidentes críticos têm procedimento de resposta.

### Fase 2 — Productizar o white-label

**Objetivo:** tornar a implantação de um cliente repetível e segura.

1. Implementar cadastro de tenant com plano, status, módulos, limites, unidade e administrador inicial.
2. Centralizar configuração de marca: nome, domínio, logo, paleta, idioma, fuso horário, moeda e origens CORS permitidas.
3. Aplicar feature flags e limites por plano no backend, nunca somente no frontend.
4. Criar fluxo automatizado de provisionamento: tenant, banco/schema, admin, domínio, configuração padrão e auditoria.
5. Criar console interno para suporte: status do tenant, módulos, logs correlacionados e ações auditadas; sem acesso irrestrito a dados pessoais.
6. Garantir exportação e retenção de dados, suspensão, reativação e encerramento de tenant conforme LGPD e contrato.

**Saída e gate:** criar um tenant de demonstração do zero é repetível, auditável e leva menos de uma hora sem alteração manual de código.

### Fase 3 — Qualidade, segurança e operação

**Objetivo:** reduzir risco antes de receber clientes pagantes.

- Definir ambientes isolados de desenvolvimento, homologação e produção, com CI que bloqueia regressões.
- Cobrir fluxos críticos com testes unitários, integração, contrato, E2E e isolamento multi-tenant.
- Implantar observabilidade: health checks, métricas, logs estruturados, traces por `request_id`/`tenant_id` e alertas acionáveis.
- Formalizar gestão de incidentes, backups, recuperação, janelas de manutenção e changelog.
- Revisar autenticação, RBAC, CORS, headers, rate limits, dependências, segredos e auditoria antes do piloto.

**Saída e gate:** existe runbook, dashboard operacional e evidência de teste de restauração e de isolamento. Falhas P0/P1 sem mitigação bloqueiam a venda.

### Fase 4 — Piloto pago e validação de mercado

**Objetivo:** provar valor com poucos clientes controlados antes de escalar.

1. Selecionar de 2 a 5 clientes com operação representativa e patrocinador disponível.
2. Assinar contrato piloto com escopo, módulos, integrações, suporte, limites, feedback e critérios de saída explícitos.
3. Executar onboarding acompanhado: importação, treinamento, simulação de turno e plano de reversão.
4. Medir ativação, pedidos concluídos, tempo de atendimento/KDS, divergências de caixa, chamados e satisfação.
5. Priorizar melhorias por recorrência e impacto em receita/operação, não por customização isolada.

**Saída e gate:** os pilotos atingem os indicadores mínimos por dois ciclos operacionais e não dependem de intervenção diária de engenharia.

### Fase 5 — Lançamento controlado e escala

**Objetivo:** crescer sem perder previsibilidade de margem e suporte.

- Publicar página comercial e material de vendas baseado somente no escopo validado.
- Padronizar demonstração, proposta, onboarding, treinamento, base de conhecimento e offboarding.
- Medir custo de infraestrutura e suporte por tenant, receita recorrente, churn, expansão de módulos e margem bruta.
- Expandir por coortes de clientes; pausar aquisição se suporte, incidentes ou custos ultrapassarem os limites definidos.

## Critérios de go/no-go para comercialização

| Dimensão | Go | No-go |
| --- | --- | --- |
| Código | origem restaurada, CI verde e releases reproduzíveis | snapshot parcial, build manual ou dependências desconhecidas |
| Segurança | segredos fora do Git, RBAC e isolamento testados | credenciais expostas ou fronteira de tenant não provada |
| Operação | backups restaurados, monitoramento e runbooks ativos | sem restauração testada ou sem responsável por incidentes |
| Produto | ciclo de pedido e pagamento validado no piloto | relatório financeiro ou fechamento depende de controle manual |
| Comercial | contrato, preço, SLA, LGPD e suporte definidos | oferta promete recursos sem aceite técnico |

## Indicadores para a gestão semanal

| Indicador | Decisão que orienta |
| --- | --- |
| tenants provisionados com sucesso e tempo de provisionamento | capacidade de onboarding |
| taxa de pedido concluído e erros por etapa | estabilidade do fluxo operacional |
| divergência de caixa/pagamento | confiabilidade financeira |
| incidentes P0/P1, MTTA e MTTR | qualidade de suporte e operação |
| sucesso de backup/restauração | risco de continuidade |
| ativação, uso semanal, churn e expansão por módulo | aderência e viabilidade comercial |
| custo de infraestrutura e suporte por tenant | margem e preço mínimo |

## Responsabilidades sugeridas

| Papel | Responsável por |
| --- | --- |
| Produto | escopo, planos, priorização, evidência de valor e critérios de aceite |
| Engenharia | código, testes, segurança, migrations e contratos de API |
| Operações/SRE | deploy, observabilidade, backup, incidentes e capacidade |
| Sucesso do cliente | onboarding, treinamento, adoção e feedback do piloto |
| Comercial/jurídico | proposta, preço, SLA, LGPD, termos e processo de cobrança |

## Próxima ação prática

Concluir a **Fase 0** antes de iniciar qualquer campanha comercial: recuperar a árvore de código real, executar a checklist de recuperação e preencher a matriz de funcionalidades com evidências de testes. Em seguida, abrir um backlog P0/P1 a partir das lacunas registradas em [`KNOWN_GAPS.md`](KNOWN_GAPS.md).
