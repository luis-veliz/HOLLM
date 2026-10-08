<!-- Título: release: vX.Y.Z → prod -->

## 📦 Release a producción

**Versión:** vX.Y.Z
**Branch origen:** develop → main
**Fecha estimada deploy:** YYYY-MM-DD HH:MM TZ
**Responsable deploy:** @

## 🧾 Changelog incluido
<!-- Pega el changelog generado (release-please / semantic-release / manual) -->
```
feat: ...
fix: ...
```

## ⚠️ BREAKING CHANGES
<!-- Lista cada breaking y cómo migrar. Si no hay, pon "Ninguno" -->


## 🚀 Checklist pre-deploy
- [ ] Todas las PRs del release están mergeadas en develop
- [ ] CI verde en develop (último commit)
- [ ] QA validado en staging / entorno dev
- [ ] Variables de entorno nuevas creadas en prod y guardadas en 1Password
- [ ] Migraciones aplicadas en orden y probadas en staging
- [ ] Backup de DB prod verificado (último backup < 24h)
- [ ] Comunicado a stakeholders (si hay downtime o cambios visibles)
- [ ] Rollback plan documentado (ver abajo)

## 📋 Variables de entorno nuevas / modificadas
<!-- Nombre, dónde cargar, 1Password item -->
| Variable | Entorno | 1Password | Notas |
|---|---|---|---|
|  |  |  |  |

## 🗄️ Migraciones de DB
<!-- Orden exacto de ejecución -->
| # | Archivo | Reversible | Downtime |
|---|---|---|---|
| 1 |  |  |  |

## 🔁 Plan de rollback
<!-- Si todo sale mal: comando/pasos exactos -->
1. Revertir deploy: `...`
2. Revertir migraciones: `...`
3. Validar: `...`

## 📊 Verificación post-deploy
- [ ] Healthcheck responde 200
- [ ] Métricas clave estables (p95, error rate)
- [ ] Smoke test manual pasado
- [ ] Tag `vX.Y.Z` creado en el repo

## 👥 Reviewers requeridos
- [ ] Lead técnico
- [ ] QA
- [ ] DevOps / infra
