// ==========================================
// C64 Key Input Test by Jonathan Mathews
// ==========================================
.const RETURN_KEY = $0d

// ==========================================
BasicUpstart2(main)
jmp main
// ==========================================

#import "get_key.asm"

// ==========================================
*=* "Main"
main:
    // enable cursor blink
    lda #0
    sta $cc

    jsr get_key

    // output character to screen
    jsr $ffd2

    // loop until return key is pressed
    cmp #RETURN_KEY
    bne main
    
    rts
// ==========================================
