# VIIRS Fire Sample Assets

Human-reviewed sample library behind our VIIRS active-fire detection study.

**Guangzhou Meteorological Satellite Ground Station**, Tianhe District,
Guangzhou, Guangdong, China · Contact: jinyb_gzmss@yeah.net

## Links

- **Gallery & documentation site** (GitHub Pages):
  https://jybsysu.github.io/viirs-fire-sample-assets/
- **Full figure archive — live, self-hosted**:
  http://120.77.78.161:8443 — all ~78,500 review images (~105 GB),
  browsable and downloadable by category
- **Full data release**: index tables and data tensors will be released together
  with the accompanying paper

## What is here

The training library (snapshot 2026-09-14) holds **63,714 human-reviewed
samples** in 14 categories: confirmed real fires (day/night, plus a large-fire
collection) and hard negatives that operational VIIRS fire products commonly
confuse with fires (industrial heat sources, photovoltaic plants, open/persistent
burning, hot roofs and surfaces, urban areas, cropland, water, heated water,
volcanoes, clean background).

This repository contains:

```
index.html                  gallery site (served via GitHub Pages)
README.md                   this file
METHODOLOGY.md              how the evidence figures are produced
data/sample_manifest.json   per-category totals and gallery sampling
images/<category>/          compressed example figures (gallery seed 20261013)
scripts/push.sh             publish helper
```

| Category | Contents |
|---|---|
| `fire/day`, `fire/night` | Confirmed fires, by overpass illumination — 38,756 / 963 figures |
| `large_fire`, `large_fire_v5_full` | Large-fire event collections — 145 / 1,999 figures |
| `industrial` | Factories & industrial heat sources — 6,692 |
| `pv_plant` | Photovoltaic plants — 1,418 Google Earth before/after cases |
| `open_persistent_burning` | Open burning / open-pit coal combustion — 1,729 |
| `hot_surface` | High-temperature roofs / hot surfaces — 290 |
| `urban` | Urban / industrial mixed areas — 277 |
| `cropland` | Cropland (non-fire) — 1,590 |
| `water` | Water bodies — 3,712 |
| `heated_water` | Fixed heat sources on water — 848 |
| `volcano` | Volcanic activity — 29 |
| `background` | Clean background — 7,955 |

## Release policy

No CSV files with coordinates or training metadata are released before the
paper is published. The full archive (including index tables and patch
tensors) will be released together with the paper. For collaboration in
the meantime, open an Issue or email us.
