# Karst

A scroll-down descent through a cave, then down the Kola borehole to 12,262 m.

- `src/karst.body.html` – the page source (also what the Claude artifact publishes)
- `build.sh` – builds `dist/index.html` (adds the doctype, social tags and favicon)
- `dist/` – **upload this folder**: `index.html` + `og.png`

## Publish
1. Netlify Drop: drag `dist/` onto https://app.netlify.com/drop
2. Once you know the address, rebuild so link previews use a full image URL, then re-upload `dist/`:
   `SITE_URL=https://your-site.netlify.app ./build.sh`

## Deep links
Every landmark has a link, e.g. `/#naica`, `/#veryovkina`, `/#kola`, `/#glowworms`.
