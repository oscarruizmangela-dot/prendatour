#!/usr/bin/env bash
# Script de build per a Render (Static Site).
# Substitueix el marcador __GOOGLE_MAPS_API_KEY__ pel valor real de la
# variable d'entorn GOOGLE_MAPS_API_KEY, definida al Dashboard de Render
# (Settings -> Environment), NO al codi font.
set -euo pipefail

if [ -z "${GOOGLE_MAPS_API_KEY:-}" ]; then
  echo "ERROR: la variable d'entorn GOOGLE_MAPS_API_KEY no està definida a Render." >&2
  exit 1
fi

sed -i "s|__GOOGLE_MAPS_API_KEY__|${GOOGLE_MAPS_API_KEY}|g" index.html
echo "Clau de Google Maps injectada correctament a index.html."
