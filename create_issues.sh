#!/bin/bash
gh issue create --title "Issue 1: Ambiente e Dependências" --body "- [ ] BACK-001: Inicializar gerenciador de pacotes (Poetry/uv) e definir dependências (dbt-core, dbt-bigquery, sqlfluff, pre-commit, pytest).
- [ ] BACK-002: Criar arquivo \`.env\` de exemplo e abstrair credenciais e perfis do dbt no \`profiles.yml\`."

gh issue create --title "Issue 2: Padronização e Qualidade" --body "- [ ] BACK-003: Configurar o \`pre-commit\` com hooks básicos para controle de qualidade antes dos commits.
- [ ] BACK-004: Configurar regras de linting e formatação SQL com \`sqlfluff\` (arquivo \`.sqlfluff\`).
- [ ] BACK-005: Configurar linting e formatação de código Python usando \`Ruff\`."

gh issue create --title "Issue 3: Testes e CI/CD" --body "- [ ] BACK-006: Criar estrutura de testes Python usando \`pytest\` e mocks.
- [ ] BACK-007: Adicionar \`dbt-expectations\` e expandir testes e validação de dados nas tabelas.
- [ ] BACK-008: Configurar pipeline de CI/CD com GitHub Actions para validação e testes automatizados."
