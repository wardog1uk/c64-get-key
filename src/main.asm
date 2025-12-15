// ==========================================
// C64 Key Input Test by Jonathan Mathews
// ==========================================
BasicUpstart2(main)
jmp main

#import "get_key.asm"


*=* "Main"
// ==========================================
main:
    jsr get_key
    rts
// ==========================================
