# Methodology — How the Evidence Figures Are Produced

> This document describes the Google Earth before/after figures now archived
> in `_archive_ge_before_after_pv_20261014/`. The main library categories
> (including `pv/`) hold multi-panel review composites produced during label
> auditing (see README, "Figure format").

## Goal

For every labelled sample we produce a pair of high-resolution scenes —
**before** and **after** the VIIRS event date — so that a human reviewer can
see what actually exists at the sample location and judge whether the label
(real fire / specific non-fire category) is correct.

## Tool

- **GEHistoricalImagery v0.7.1** (github.com/Mbucari/GEHistoricalImagery):
  command-line access to Google Earth "Time Machine" historical imagery
  (equivalent to dragging the time slider in Google Earth Pro). Also supports
  the Esri Wayback archive.
- Google Earth Pro desktop has no batch/headless interface and is not used.
- The Esri Wayback archive receives no updates in our study area after 2016
  and is not relied upon for historical scenes.

## Per-sample protocol

1. **Footprint**: a ±600 m box centred on the sample coordinates
   (`dlat = 600/111320`, `dlon = 600/(111320·cos(lat))`).
2. **Date selection** (availability is queried per location first):
   - `before` = the latest available acquisition **strictly before** the event
     date (`--date-match=ClosestBefore`);
   - `after` = the earliest available acquisition **at least 14 days after**
     the event date (`--date-match=ClosestAfter`). Locations without
     post-event coverage fall back to the latest available scene, and the
     fallback is recorded.
3. **Zoom**: z18 by default (~108 tiles per ±600 m box). When a side has no
   z18 coverage (recent acquisitions often exist only at z19), that side is
   downloaded at z19 (~432 tiles).
4. **Output**: stitched PNG with a `.pgw` world file and a `.msk` mask
   marking tiles without coverage (those pixels are filled light grey —
   black is never used as the no-data colour).

## Known limitation — acquisition-date metadata

Google Earth's historical-date metadata is **regionally unreliable**. We have
verified cases where a scene labelled e.g. "2018" actually shows a state that
independent Sentinel-2 time series prove did not exist until years later
(date errors of 1.5–7 years), while in other regions the dates are exact.

**Standing rule**: Google Earth provides *visual identification* (≈0.5 m —
solar arrays, greenhouses, water surfaces are unmistakable); Sentinel-2
provides *timing* (5-day revisit pins down construction/burn dates). When the
two disagree, the multi-date Sentinel-2 evidence prevails and the conflict is
noted in the review record.

## Throughput

3 concurrent samples × 8 tile threads is stable; one full batch
(availability + before + after per sample) takes ≈10 s per sample-side.

## Batch provenance (archived GE before/after set)

The 1,418 PV-plant cases were produced in three batches (94 + 790 + 534),
all with the protocol above; 782/790, and equivalent rates in the other
batches, obtained both sides successfully — the remainder fell back to the
latest available scene as described in step 2.
