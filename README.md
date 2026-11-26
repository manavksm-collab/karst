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

## Deep Strike (bonus game)
`dist/fighter/index.html` is a self-contained 1-on-1 arcade fighter (smooth, cel-shaded vector art) set in Karst's caves (deployed at `/fighter/`).
Four original elemental fighters (Flint - fire, Vesna - water, Grotto - earth, Echo - wind) in a cel-shaded anime style, four stages (Karst River, Crystal Grotto, Deep Borehole, Glowworm Hollow),
an Arcade ladder vs CPU, 2-player Versus, attract-mode demo, chiptune audio, gamepad and touch controls.

- **P1:** WASD move · F punch · G kick (solo play also accepts arrows + J/K)
- **P2:** arrows move · `.` punch · `/` kick (or Numpad 1/2)
- Hold back to block (down-back blocks low). Esc pauses, M mutes.
- Specials (facing right): ↓↘→+P projectile · →↓↘+P uppercut · ↓↙←+K spin kick · ↓↘→↓↘→+P super (full meter)
