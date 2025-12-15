*=* "get_key.asm"

// KEYD - Start of keyboard buffer
.const BUFFER = $0277

// NDX - Number of characters in the keyboard buffer
.const BUFFER_SIZE = $c6

// ==========================================
// Wait for keyboard input and store it in A
// ==========================================
get_key:
    // wait for input
    lda BUFFER_SIZE
    beq get_key

    // get first character from the buffer
    lda BUFFER

    // shift buffer up
    jsr shift_buffer

    rts
// ==========================================


// ==========================================
// Move key buffer up one place
// ------------------------------------------
// BUFFER_SIZE must be > 0
// ==========================================
shift_buffer:
    // disable interrupts
    sei

    // save A to Y
    tay

    ldx #0

    // move buffer up
!:  lda BUFFER+1,X
    sta BUFFER,X

    // loop through buffer
    inx
    cpx BUFFER_SIZE
    bne !-

    // decrement buffer size
    dec BUFFER_SIZE

    // restore A from Y
    tya

    // enable interrupts
    cli

    rts
// ==========================================
