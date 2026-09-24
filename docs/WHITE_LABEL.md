# Operação white-label

## Oferta vendável

Cada cliente recebe um tenant com marca própria, usuários, catálogo e dados isolados. A plataforma entrega módulos habilitados por plano e mantém uma única versão do produto.

### Configurável por tenant

- nome comercial, logo, favicon, cores e textos institucionais;
- domínio/subdomínio e origens CORS permitidas;
- fuso horário, moeda, impostos e política de serviço;
- catálogo, preços, mesas, setores e equipe;
- módulos contratados: salão, PDV, KDS, reserva, delivery e fidelidade;
- integrações aprovadas de pagamento, entrega e mensagens.

### Não configurável por tenant

- regras de autorização e isolamento de dados;
- auditoria financeira e retenção de dados;
- versão do núcleo e correções de segurança;
- contratos públicos de API sem processo formal de versão.

## Provisionamento de um novo cliente

1. Criar o registro do tenant e um administrador inicial.
2. Definir plano, módulos, limites e status de cobrança.
3. Registrar domínio, verificar DNS/TLS e configurar origens permitidas.
4. Cadastrar identidade visual e validar contraste/acessibilidade.
5. Importar catálogo, mesas e usuários por processo auditável.
6. Executar testes de isolamento, pedidos, KDS, caixa e permissões.
7. Habilitar monitoramento, backup e contatos de suporte antes do go-live.

## Critérios de aceite antes da venda

- [ ] Nenhum segredo está no Git ou em imagens.
- [ ] O tenant A não consegue ler, alterar ou inferir dados do tenant B.
- [ ] Fluxos críticos possuem auditoria e idempotência.
- [ ] Backups são restauráveis e têm teste periódico de restauração.
- [ ] Há limite de uso, plano e desativação de tenant documentados.
- [ ] Domínios possuem TLS, CORS restrito e cabeçalhos de segurança.
- [ ] O status de serviços, logs e alertas é acessível pela equipe de suporte.
- [ ] Termos comerciais definem SLA, suporte, LGPD, exportação e retenção de dados.

## Governança de customizações

Toda demanda deve ser classificada como: configuração existente, evolução reutilizável de plataforma, integração isolada ou desenvolvimento exclusivo. Desenvolvimento exclusivo não deve entrar no núcleo sem revisão de segurança, impacto multi-tenant, custo de suporte e plano de versionamento.
