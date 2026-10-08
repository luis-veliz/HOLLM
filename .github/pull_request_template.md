<!--
Título del PR: usa Conventional Commits
  feat(scope): resumen en imperativo, minúsculas, sin punto, ≤50 chars
Ejemplo: feat(auth): add refresh-token rotation
-->

## 📝 Qué cambia
<!-- 1-3 líneas: QUÉ hace este PR y POR QUÉ (contexto de negocio o técnico) -->


## 🏷️ Tipo de cambio
- [ ] feat (nueva funcionalidad)
- [ ] fix (bug fix)
- [ ] refactor (sin cambio de comportamiento)
- [ ] perf (mejora de performance)
- [ ] docs (solo documentación)
- [ ] test (agregar/arreglar tests)
- [ ] build / ci / chore (tooling, dependencias)
- [ ] ⚠️ BREAKING CHANGE (romper compatibilidad)

## 🔗 Issue relacionado
<!-- GitHub cerrará el issue automáticamente al mergear -->
Closes #

## 🚀 Impacto en despliegue
<!-- Marca TODO lo que aplique. Si marcas algo, incluye detalle abajo. -->
- [ ] Requiere **variables de entorno nuevas o modificadas**
- [ ] Requiere **migraciones de base de datos**
- [ ] Requiere **cambios en infra / CI / secretos**
- [ ] Rompe compatibilidad de API pública
- [ ] Ninguno (deploy transparente)

### Detalle de impacto
<!--
Variables nuevas:
  - NEW_VAR_NAME (descripción, dónde cargar valor, ej. 1Password → vault / item)

Migraciones:
  - Archivo: Migrations/20261008_add_x.sql
  - Reversible: sí / no
  - Downtime esperado: 0s / <5s / >5s

Infra:
  - Nuevo bucket S3, nuevo cron, nueva cola, etc.
-->


## 🧪 Cómo probar
1. 
2. 
3. 

## ✅ Checklist
- [ ] Mi título de PR sigue Conventional Commits
- [ ] Mis commits siguen Conventional Commits (lefthook corrió verde)
- [ ] Tests pasan localmente
- [ ] Linter / formatter OK
- [ ] Sin secretos ni credenciales commiteadas (gitleaks ✅)
- [ ] Docs/README actualizados si aplica
- [ ] Si hay migraciones, probadas en local y reversibles
- [ ] Si hay env vars nuevas, documentadas en `.env.example` y 1Password

## 📸 Screenshots / logs (si UI o CLI)
<!-- Arrastra imágenes o pega logs relevantes -->
