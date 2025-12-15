// ==========================================
// C64 Key Input Test by Jonathan Mathews
// ==========================================
BasicUpstart2(main)
jmp main

#import "get_key.asm"

.const RETURN_KEY = $0d


*=* "Main"
// ==========================================
main:
    jsr get_key
    jsr $ffd2
    cmp #RETURN_KEY
    bne main
    rts
// ==========================================
