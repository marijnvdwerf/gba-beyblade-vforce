# Round 2 rider and actor layouts

## actor_8057C58

The parked source draft temporarily used an `ActorConfig` layout with accessed fields at offsets `0x4`, `0x5`, `0x6`, `0x7`, `0x8`, `0xC`, and `0x14`. The temporary `Actor` view exposed accesses at offsets `0x0`, `0x4`, `0x8`, `0xC`, `0x10` through `0x22`, `0x28` through `0x30`, `0x38` through `0x3C`, `0x40` through `0x58`, `0x60` through `0x8D`, `0x90` through `0x98`, `0xA0` through `0xA5`, `0xB0` through `0xBC`, and `0xC0`. These fields were reverted because the function was not matched and committed.

The closest draft differed from the target only at the two zero-register initializations. The target emits `movs r5, #0` followed by `movs r4, #0`; both swapped source statement order and swapped local declaration order continued to emit `movs r4, #0` followed by `movs r5, #0`. The function remains parked above its dump include.

## initRider

The parked draft temporarily exposed two embedded `Actor` objects in `RiderBase` at offsets `0x238` and `0x2FC`, plus fields at offsets `0x3C0`, `0x3C4`, `0x3C8`, `0x3CA`, `0x3CC`, `0x3CE`, `0x3D0`, `0x3D4`, `0x3D8`, `0x3DC`, `0x3E0`, `0x3E4`, `0x3E8`, and the existing particle-system region at `0x3EC`. The draft also used the first embedded actor's fields corresponding to offsets `0x2C8`, `0x2CC`, `0x2E8`, `0x2EC`, and `0x2F4`, and the second embedded actor's fields corresponding to offsets `0x335`, `0x3AC`, and `0x3B8`.

Those temporary header fields and helper prototypes were reverted because `initRider` was not matched and committed. The draft remains parked above its dump include.
