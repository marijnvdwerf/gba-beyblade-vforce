    .ifndef _IDS_INC_GUARD
    .set _IDS_INC_GUARD, 1

@ Asset identifiers: 16-bit hashes of the asset name, h = (h * 37 + c) & 0xFFFF
@ over its bytes, starting from 0 (see src/ids.h). ID_UNK_xxxx are not named yet.

@ Name of unnamed metadata entries
    .set ID_NONE, 0x002D                @ "-"

@ Line metadata types
    .set ID_ACCELERATION, 0x6ACE        @ "Acceleration"
    .set ID_ACTOR, 0xD679               @ "Actor"
    .set ID_AI_BOSS, 0xD271             @ "AIBoss"
    .set ID_AI_PATH, 0x59C3             @ "AIPath"
    .set ID_AI_PATH_SPEED, 0xCF2C       @ "AIPathSpeed"
    .set ID_AI_RECHARGE_RATE, 0x05CF    @ "AIRechargeRate"
    .set ID_AI_TARGET_RADIUS, 0x215D    @ "AITargetRadius"
    .set ID_AI_TARGET_TIME, 0x3AB4      @ "AITargetTime"
    .set ID_COLLECTABLE, 0x37AE         @ "Collectable"
    .set ID_FRICTION, 0x5BBE            @ "Friction"
    .set ID_SPRITE, 0xFB93              @ "Sprite"
    .set ID_TUTORIAL_TRIGGER, 0x8CEC    @ "TutorialTrigger"
    .set ID_WEIGHT, 0xD368              @ "Weight"
    .set ID_UNK_2A39, 0x2A39            @ type 1: refills spin power (charge*)
    .set ID_UNK_4ECB, 0x4ECB            @ type 1 delay / type 3 event fired after it
    .set ID_UNK_505B, 0x505B            @ type 1: AI flee threshold
    .set ID_UNK_B396, 0xB396            @ type 4: velocity kick added to the rider (speed/launch pads)
    .set ID_UNK_BF84, 0xBF84            @ type 1: pause at spline end
    .set ID_UNK_F0F8, 0xF0F8            @ type 1: AI spin-meter palette

@ Collections (Collectable type-3 values)
    .set ID_COLLECTION, 0x3C00          @ "Collection"
    .set ID_COLLECTION_0, 0xAC30        @ "Collection0"

@ Events (type 6 fire / 7 listen / 18)
    .set ID_CHARGER_1, 0xBC69           @ "charger1"
    .set ID_CHARGER_2, 0xBC6A           @ "charger2"
    .set ID_CHARGER_3, 0xBC6B           @ "charger3"
    .set ID_CHARGER_6, 0xBC6E           @ "charger6"
    .set ID_CHARGE_1, 0x1997            @ "charge1"
    .set ID_CHARGE_2, 0x1998            @ "charge2"
    .set ID_CHARGE_3, 0x1999            @ "charge3"
    .set ID_CHARGE_4, 0x199A            @ "charge4"
    .set ID_CHARGE_5, 0x199B            @ "charge5"
    .set ID_CHARGE_10, 0xB303           @ "charge10"
    .set ID_CHARGE_11, 0xB304           @ "charge11"
    .set ID_CHARGE_13, 0xB306           @ "charge13"
    .set ID_CHARGE_21, 0xB329           @ "charge21"
    .set ID_CHARGE_22, 0xB32A           @ "charge22"
    .set ID_CHARGE_32, 0xB34F           @ "charge32"
    .set ID_CHARGE_111, 0xDFC5          @ "charge111"
    .set ID_CHARGE_112, 0xDFC6          @ "charge112"
    .set ID_CHARGE_311, 0xEA77          @ "charge311"
    .set ID_COLLECT, 0xB9DE             @ "collect"
    .set ID_COLLECT_0, 0xDD46           @ "collect0"
    .set ID_COLLECT_1, 0xDD47           @ "collect1"
    .set ID_COLLECT_2, 0xDD48           @ "collect2"
    .set ID_COLLECT_3, 0xDD49           @ "collect3"
    .set ID_COLLECT_5, 0xDD4B           @ "collect5"
    .set ID_COLLECT_11, 0xFB74          @ "collect11"
    .set ID_COLLECT_13, 0xFB76          @ "collect13"
    .set ID_COLLECT_21, 0xFB99          @ "collect21"
    .set ID_COLLECT_22, 0xFB9A          @ "collect22"
    .set ID_COLLECT_23, 0xFB9B          @ "collect23"
    .set ID_LAUNCH_0, 0x0B3F            @ "launch0"
    .set ID_LAUNCH_00, 0xA04B           @ "launch00"
    .set ID_LAUNCH_1, 0x0B40            @ "launch1"
    .set ID_LAUNCH_2, 0x0B41            @ "launch2"
    .set ID_LAUNCH_3, 0x0B42            @ "launch3"
    .set ID_LAUNCH_4, 0x0B43            @ "launch4"
    .set ID_LAUNCH_5, 0x0B44            @ "launch5"
    .set ID_LAUNCH_6, 0x0B45            @ "launch6"
    .set ID_LAUNCH_7, 0x0B46            @ "launch7"
    .set ID_LAUNCH_8, 0x0B47            @ "launch8"
    .set ID_LAUNCH_9, 0x0B48            @ "launch9"
    .set ID_LAUNCH_21, 0xA096           @ "launch21"
    .set ID_LAUNCH_40, 0xA0DF           @ "launch40"
    .set ID_PLATFORM_1, 0x28E6          @ "Platform1"
    .set ID_SPEED, 0x700D               @ "speed"
    .set ID_SPEEDDOWN, 0xE1C9           @ "speeddown"
    .set ID_SPEEDDOWN_1, 0xA23E         @ "speeddown1"
    .set ID_SPEEDDOWN_2, 0xA23F         @ "speeddown2"
    .set ID_SPEEDDOWN_3, 0xA240         @ "speeddown3"
    .set ID_SPEEDDOWN_4, 0xA241         @ "speeddown4"
    .set ID_SPEEDDOWN_5, 0xA242         @ "speeddown5"
    .set ID_SPEEDDOWN_6, 0xA243         @ "speeddown6"
    .set ID_SPEEDDOWN_11, 0x7327        @ "speeddown11"
    .set ID_SPEEDDOWN_22, 0x734D        @ "speeddown22"
    .set ID_SPEEDDOWN_24, 0x734F        @ "speeddown24"
    .set ID_SPEEDDOWN_29, 0x7354        @ "speeddown29"
    .set ID_SPEEDDOWN_32, 0x7372        @ "speeddown32"
    .set ID_SPEEDDOWN_222, 0xAA53       @ "speeddown222"
    .set ID_SPEEDDOWN_232, 0xAA78       @ "speeddown232"
    .set ID_SPEEDX, 0x3259              @ "speedx"
    .set ID_SPEEDX_1, 0x470E            @ "speedx1"
    .set ID_SPEEDX_2, 0x470F            @ "speedx2"
    .set ID_SPEEDX_3, 0x4710            @ "speedx3"
    .set ID_SPEEDX_4, 0x4711            @ "speedx4"
    .set ID_SPEEDX_06, 0x4517           @ "speedx06"
    .set ID_SPEEDX_6, 0x4713            @ "speedx6"
    .set ID_SPEED_01, 0x3CA6            @ "speed01"
    .set ID_SPEED_1, 0x3212             @ "speed1"
    .set ID_SPEED_2, 0x3213             @ "speed2"
    .set ID_SPEED_3, 0x3214             @ "speed3"
    .set ID_SPEED_4, 0x3215             @ "speed4"
    .set ID_SPEED_5, 0x3216             @ "speed5"
    .set ID_SPEED_6, 0x3217             @ "speed6"
    .set ID_SPEED_7, 0x3218             @ "speed7"
    .set ID_SPEED_9, 0x321A             @ "speed9"
    .set ID_SPEED_211, 0xCEE1           @ "speed211"
    .set ID_SPEED_222, 0xCF07           @ "speed222"
    .set ID_TUTORIAL, 0x9980            @ "Tutorial"
    .set ID_TUTORIAL_1, 0x2FB1          @ "Tutorial1"
    .set ID_TUTORIAL_2, 0x2FB2          @ "Tutorial2"
    .set ID_TUTORIAL_4, 0x2FB4          @ "Tutorial4"
    .set ID_TUTORIAL_10, 0xE4C5         @ "Tutorial10"
    .set ID_TUTORIAL_11, 0xE4C6         @ "Tutorial11"
    .set ID_TUTORIAL_12, 0xE4C7         @ "Tutorial12"
    .set ID_UNK_153B, 0x153B            @ speed pad, +Y
    .set ID_UNK_1D2E, 0x1D2E            @ speed pad, +Y
    .set ID_UNK_3250, 0x3250            @ speed pad, +X
    .set ID_UNK_42E2, 0x42E2            @ charge pickup
    .set ID_UNK_44C3, 0x44C3            @ charge pickup
    .set ID_UNK_45C2, 0x45C2            @ speed pad, +X
    .set ID_UNK_45F9, 0x45F9            @ speed pad, +X
    .set ID_UNK_4DEF, 0x4DEF            @ speed pad, +Y
    .set ID_UNK_57F5, 0x57F5
    .set ID_UNK_5D73, 0x5D73
    .set ID_UNK_89FE, 0x89FE            @ delayed: drops the actor
    .set ID_UNK_9366, 0x9366            @ speed pad, +Y
    .set ID_UNK_9EDF, 0x9EDF            @ trigger: fires ID_UNK_89FE after an ID_UNK_4ECB delay
    .set ID_UNK_9F56, 0x9F56
    .set ID_UNK_F1E7, 0xF1E7            @ delayed: drops the actor
    .set ID_UNK_F1E8, 0xF1E8            @ delayed: drops the actor
    .set ID_UNK_F534, 0xF534            @ speed pad, +X
    .set ID_UNK_F66C, 0xF66C            @ trigger: fires ID_UNK_F1E7 after an ID_UNK_4ECB delay
    .set ID_UNK_F66D, 0xF66D            @ trigger: fires ID_UNK_F1E8 after an ID_UNK_4ECB delay

@ Splines (GeometrySpline.unkC, AIPath and type-5 targets)
    .set ID_EMPTY, 0x0000               @ ""
    .set ID_LC_PATH_1, 0x5DBA           @ "path1"
    .set ID_LC_PATH_2, 0x5DBB           @ "path2"
    .set ID_LC_PATH_4, 0x5DBD           @ "path4"
    .set ID_PATH, 0xECF5                @ "Path"
    .set ID_PATH_01, 0x314E             @ "Path01"
    .set ID_PATH_1, 0x3F9A              @ "Path1"
    .set ID_PATH_2, 0x3F9B              @ "Path2"
    .set ID_PATH_3, 0x3F9C              @ "Path3"
    .set ID_PATH_4, 0x3F9D              @ "Path4"
    .set ID_PATH_5, 0x3F9E              @ "Path5"
    .set ID_PATH_6, 0x3F9F              @ "Path6"
    .set ID_PATH_10, 0x3172             @ "Path10"
    .set ID_PATH_11, 0x3173             @ "Path11"
    .set ID_PATH_12, 0x3174             @ "Path12"
    .set ID_PATH_13, 0x3175             @ "Path13"
    .set ID_PATH_21, 0x3198             @ "Path21"
    .set ID_PATH_22, 0x3199             @ "Path22"
    .set ID_PATH_23, 0x319A             @ "Path23"
    .set ID_UNK_0CEB, 0x0CEB
    .set ID_UNK_0CEC, 0x0CEC
    .set ID_UNK_0CED, 0x0CED
    .set ID_UNK_10B1, 0x10B1
    .set ID_UNK_209C, 0x209C
    .set ID_UNK_32FC, 0x32FC
    .set ID_UNK_3A2C, 0x3A2C
    .set ID_UNK_58B7, 0x58B7
    .set ID_UNK_58B8, 0x58B8
    .set ID_UNK_6368, 0x6368
    .set ID_UNK_66B8, 0x66B8
    .set ID_UNK_6C0D, 0x6C0D
    .set ID_UNK_8278, 0x8278
    .set ID_UNK_84D2, 0x84D2
    .set ID_UNK_8B0E, 0x8B0E
    .set ID_UNK_9E13, 0x9E13
    .set ID_UNK_A6B3, 0xA6B3            @ type-5 target: actor starts on this spline
    .set ID_UNK_A6B4, 0xA6B4            @ type-5 target: actor starts on this spline
    .set ID_UNK_ACBA, 0xACBA
    .set ID_UNK_D1AE, 0xD1AE
    .set ID_UNK_D43A, 0xD43A
    .set ID_UNK_D43B, 0xD43B
    .set ID_UNK_D43C, 0xD43C
    .set ID_UNK_D43D, 0xD43D
    .set ID_UNK_DFB2, 0xDFB2
    .set ID_UNK_F48E, 0xF48E
    .set ID_UNK_F830, 0xF830

    .endif
