#include "common.h"

void onVBlank(void);

void nullsub_37(void);

void nullsub_31(void);

void onTimer1Overflow(void);

const void* const Unk_872CAF4[] = {
    onVBlank, nullsub_37, nullsub_31, nullsub_31, onTimer1Overflow, nullsub_31, nullsub_31,
    nullsub_31, nullsub_31, nullsub_31, nullsub_31, nullsub_31, nullsub_31, nullsub_31,
};

// 872CB2C
const u8 Str_872CB2C[] = "irq %i:\t%i\n";

// 872CB38
const u8 Str_872CB38[] = "________________________________________________________\n";

// 872CB74
const u8 Str_872CB74[] = "Assertion failed: \n";

// 872CB88
const u8 Str_872CB88[] = "\n";

// 872CB8C
const u8 Str_872CB8C[] = "Message:    %s\n";

// 872CB9C
const u8 Str_872CB9C[] = "Expression: %s\n";

// 872CBAC
const u8 Str_872CBAC[] = "In file:    %s\n";

// 872CBBC
const u8 Str_872CBBC[] = "On line:    %d\n";

// 872CBCC
const u8 Str_872CBCC[] = "Error allocating memory for actor motion modifiers\n";

// 872CC00
const u8 Str_872CC00[] = "Error allocating memory for background motion modifiers\n";
