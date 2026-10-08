#!/usr/bin/env bash
# Valida que el mensaje de commit cumpla Conventional Commits.
# Uso en lefthook.yml:
#   commit-msg:
#     commands:
#       conventional:
#         run: bash .lefthook/validate-commit-msg.sh {1}
#
# Formato aceptado:
#   <type>[(scope)][!]: <subject>
# Ejemplos válidos:
#   feat: add login
#   fix(auth): handle expired token
#   feat(api)!: drop /v1 endpoints
#   chore(deps): bump axios
#
# Para bypassear temporalmente (NO abuses):
#   git commit --no-verify -m "..."

set -eu

MSG_FILE="${1:-.git/COMMIT_EDITMSG}"
[ -f "$MSG_FILE" ] || { echo "no COMMIT_EDITMSG"; exit 0; }

# Primera línea no vacía (ignora comentarios git)
FIRST_LINE=$(grep -v '^#' "$MSG_FILE" | sed -n '/./{p;q;}')

# Merge/revert/fixup commits: dejar pasar
case "$FIRST_LINE" in
  Merge*|Revert*|"fixup!"*|"squash!"*|"amend!"*) exit 0 ;;
esac

# Regex Conventional Commits:
#   type: feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert
#   scope opcional (letras/números/-/_/./, slash)
#   ! opcional para breaking
#   : + espacio + descripción (no vacía)
PATTERN='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([a-zA-Z0-9_./-]+\))?!?: .{1,}$'

if ! echo "$FIRST_LINE" | grep -Eq "$PATTERN"; then
  cat >&2 <<EOF

❌ Mensaje de commit inválido.

Primera línea recibida:
  $FIRST_LINE

Formato requerido (Conventional Commits):
  <type>[(scope)][!]: <descripción corta>

Tipos permitidos:
  feat     nueva funcionalidad
  fix      corrección de bug
  docs     solo documentación
  style    formato (no cambia lógica)
  refactor cambio sin alterar comportamiento
  perf     mejora de performance
  test     agregar/corregir tests
  build    build system / dependencias
  ci       pipelines CI/CD
  chore    tareas varias (no src ni test)
  revert   revertir commit previo

Ejemplos buenos:
  feat(auth): add refresh-token rotation
  fix: handle null user on logout
  chore(deps): bump axios to 1.7.4
  feat(api)!: remove deprecated /v1 endpoints

Reglas:
  • imperativo presente ("add", no "added"/"adds")
  • minúsculas, sin punto final
  • ≤72 chars en la primera línea
  • scope opcional pero consistente
  • "!" o footer "BREAKING CHANGE:" para rupturas

Más info: https://www.conventionalcommits.org/
Bypass (solo emergencias): git commit --no-verify

EOF
  exit 1
fi

# Longitud ≤ 72
if [ "${#FIRST_LINE}" -gt 72 ]; then
  echo "⚠️  La primera línea tiene ${#FIRST_LINE} caracteres (recomendado ≤72)." >&2
  echo "   No bloquea, pero considera acortar." >&2
fi

exit 0
