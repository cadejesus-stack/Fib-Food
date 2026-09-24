# Checklist de recuperação do código-fonte

Este snapshot não contém os serviços nem o frontend que a configuração e os checkpoints mencionam. Antes de retomar desenvolvimento:

- [ ] localizar o repositório/backup que contenha `services/` e `src/`;
- [ ] confirmar o commit de origem e preservar este snapshot apenas como referência documental;
- [ ] restaurar manifestos de dependência, migrations, testes e pipelines CI;
- [ ] validar todos os contextos de `docker-compose.yml`;
- [ ] executar build, testes automatizados e smoke tests em ambiente isolado;
- [ ] comparar endpoints e fluxos restaurados com `Fib-Food_Andamento_Projeto.md`;
- [ ] rotacionar quaisquer credenciais expostas no snapshot original;
- [ ] remover do histórico arquivos internos do Git e arquivos de ambiente antes de publicar.
