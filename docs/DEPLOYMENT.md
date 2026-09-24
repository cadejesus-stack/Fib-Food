# Publicação

## Separação de ambientes

Mantenha desenvolvimento, homologação e produção em projetos/contas e bancos separados. Não promova `.env`, volume PostgreSQL ou banco local diretamente para produção.

## Processo de publicação

1. Gerar imagem imutável por commit e registrar SBOM/vulnerabilidades quando a cadeia de CI estiver disponível.
2. Aplicar migrations com backup e plano de rollback compatível.
3. Publicar primeiro em homologação e executar smoke tests autenticados por tenant.
4. Fazer rollout gradual em produção, monitorando erro, latência e transações de pedido/pagamento.
5. Manter rollback para a versão anterior e comunicar clientes afetados quando necessário.

## Configuração

Segredos devem ser injetados pelo provedor de deploy. A imagem e o Git não devem conter senhas de banco, chaves JWT, tokens de pagamento ou certificados TLS.
