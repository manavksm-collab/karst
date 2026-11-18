#!/usr/bin/env bash
# Builds index.html (standalone site) from src/karst.body.html (shared with the Claude artifact).
set -euo pipefail
cd "$(dirname "$0")"
SRC=src/karst.body.html
SITE_URL="${SITE_URL:-}"   # e.g. SITE_URL=https://karst.example.com ./build.sh
OG="og.png"; [ -n "$SITE_URL" ] && OG="${SITE_URL%/}/og.png"
DESC="Scroll down through a cave lit by your headlamp, past the bottom of the deepest known cave, and on down the Kola borehole to 12,262 m."
{
cat <<HEAD
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="description" content="$DESC">
<meta name="theme-color" content="#0b0908">
<meta property="og:type" content="website">
<meta property="og:title" content="Karst: a descent">
<meta property="og:description" content="$DESC">
<meta property="og:image" content="$OG">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
$( [ -n "$SITE_URL" ] && echo "<meta property=\"og:url\" content=\"${SITE_URL%/}/\">" && echo "<link rel=\"canonical\" href=\"${SITE_URL%/}/\">" )
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="Karst: a descent">
<meta name="twitter:description" content="$DESC">
<meta name="twitter:image" content="$OG">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect width='64' height='64' rx='12' fill='%230b0908'/%3E%3Cpath d='M10 6h44l-6 14-8 4-4 34h-8l-4-34-8-4z' fill='%235a4a3c'/%3E%3Ccircle cx='32' cy='30' r='5' fill='%23ffcf8a'/%3E%3C/svg%3E">
<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>
HEAD
sed -n '1,/^<\/style>/p' "$SRC" | grep -v 'claude:viewport'
echo '</head>'
echo '<body>'
sed -n '/^<\/style>/,$p' "$SRC" | tail -n +2
echo '</body>'
echo '</html>'
} > dist/index.html
echo "built dist/index.html (og:image = $OG)"
