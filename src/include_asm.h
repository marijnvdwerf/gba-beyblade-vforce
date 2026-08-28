#ifndef INCLUDE_ASM_H
#define INCLUDE_ASM_H

#if defined(M2CTX) || defined(PERMUTER)

#define INCLUDE_ASM(path)
#else
#define INCLUDE_ASM(path) __asm__(".text\n.include \"" path "\"")
#endif

#endif
