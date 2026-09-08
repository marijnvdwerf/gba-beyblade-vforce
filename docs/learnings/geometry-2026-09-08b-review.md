# Review: worktree-agent-a47fdc48b36ae1119

## BLOCKING

- `docs/learnings/geometry-2026-09-08b.md:3-17` — The parked-function note records the first divergence and the allocation probes, but it does not explicitly inventory the retained/removed byte-required temporaries or give measured signedness evidence for the draft's `s32`/`unk16`/`unk8` choices — `.claude/agents/decompiler.md` requires per-function byte-required-temp and signedness evidence in the learnings for a parked function — add a measured inventory (or explicitly state that no other temporaries are byte-required) and tie each non-default width/sign choice to target instructions or a call site.

## QUESTIONS

- `src/geometry.c:760` — `point0X` is a staged coordinate used only to feed the two `lineMinX`/`lineMaxX` assignments — temporary-hygiene rule — test folding this expression inline one change at a time; retain it only if the bytes require it and record the result.
- `src/geometry.c:761` — `point0Y` is a staged coordinate used only to feed the two `lineMinY`/`lineMaxY` assignments — temporary-hygiene rule — test folding it inline one change at a time; retain it only if required by the bytes.
- `src/geometry.c:762` — `point1X` is a staged coordinate used only to feed the two `lineMinX`/`lineMaxX` assignments — temporary-hygiene rule — test folding it inline one change at a time; retain it only if required by the bytes.
- `src/geometry.c:763` — `point1Y` is a staged coordinate used only to feed the two `lineMinY`/`lineMaxY` assignments — temporary-hygiene rule — test folding it inline one change at a time; retain it only if required by the bytes.
- `src/geometry.c:778` — `yNegativeOffset` caches one shifted field expression for two rectangle-bound arms — temporary-hygiene rule — test folding the expression into the two uses; keep the local only if the diff proves its lifetime is needed.
- `src/geometry.c:779` — `yPositiveOffset` caches one shifted field expression for two rectangle-bound arms — temporary-hygiene rule — test folding the expression into the two uses; keep the local only if the diff proves its lifetime is needed.
- `src/geometry.c:780` — `actorY` stages `actor->y` solely for rectangle-bound construction — temporary-hygiene rule — test direct `actor->y` expressions and keep the snapshot only if it is byte-required.
- `src/geometry.c:781` — `yMargin` stages `actor->unk50` for two additions — temporary-hygiene rule — test folding the field read into those additions; keep the local only if required by the bytes.
- `src/geometry.c:793` — `initialMinX` is a staged bound used only by the early rejection and overlap tests — temporary-hygiene rule — test folding this expression into its uses; keep it only if the target allocation/lifetime requires it.
- `src/geometry.c:794` — `initialMaxX` is a staged bound used only by the early rejection and overlap tests — temporary-hygiene rule — test folding this expression into its uses; keep it only if the target allocation/lifetime requires it.
- `src/geometry.c:914` — `temp` stages each response-velocity result before absolute-value clamping and negation — temporary-hygiene rule — test folding the arithmetic into each response path (without duplicating the multiply); retain the local only if that is the byte-required shape.
- `src/geometry.c:801-847` — The two vertical endpoint-response arms duplicate the callback/mask/update choreography — source-shape rule — test a shared source shape for the lower/upper endpoint cases, retaining the current explicit arms if the target bytes require them.
- `src/geometry.c:859-901` — The two horizontal endpoint-response arms duplicate the callback/mask/update choreography — source-shape rule — test a shared source shape for the left/right endpoint cases, retaining the current explicit arms if the target bytes require them.
- `src/geometry.c:714,905` — `output` is declared as `unk32*` and each line pointer is explicitly cast to `unk32` before storing — real-parameter/source-shape rule — test whether the proven element type can be `GeometryLine**` with `output[count] = line`; keep `unk32*` only if the API has a reason to expose a scalar word buffer.

## NITS

None.
