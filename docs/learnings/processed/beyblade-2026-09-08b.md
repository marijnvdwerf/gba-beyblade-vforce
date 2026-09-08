# Beyblade getter matching notes

## sub_805741C (0x0805741C)

The function matches with `return _807C960[getLanguage()][arg0];` and the table declaration `extern const unk8** _807C960[];`. The target performs the language lookup, scales language and index by four, and loads the selected pointer; `unk32 arg0` and the existing `const unk8*` return prototype remain unchanged. The language temporary was fold-tested and removed without changing any instructions or ROM bytes, so no temporary is byte-required. `cmake --build build --target compare` passed before finalizing, and the dump was removed.

## sub_805743C (0x0805743C)

The function matches with `return _807CE24[getLanguage()][arg0];` and the table declaration `extern const unk8** _807CE24[];`. The existing `unk32` parameter and `const unk8*` return prototype are unchanged. The generated body is the same language-then-index table lookup as sub_805741C, with the table relocation targeting `_807CE24`; no temporary is present or byte-required. The instruction diff is exact and the full-ROM compare passed before finalizing.

## sub_805745C (0x0805745C)

The function matches with `return _807D2E8[getLanguage()][arg0];` and the table declaration `extern const unk8** _807D2E8[];`. The existing `unk32` parameter and `const unk8*` return prototype are unchanged. The generated body is the same language-then-index table lookup as the preceding getters, with the table relocation targeting `_807D2E8`; no temporary is present or byte-required. The instruction diff is exact and the full-ROM compare passed before finalizing.
