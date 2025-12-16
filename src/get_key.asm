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

    // shift buffer up
    jsr shift_buffer

    rts
// ==========================================


// ==========================================
// Move key buffer up one place
// ------------------------------------------
// Returns first buffer character in A
// BUFFER_SIZE must be > 0
// ==========================================
shift_buffer:
    // disable interrupts
    sei

    // get first character from the buffer
    ldy BUFFER

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

    // move character to A
    tya

    // enable interrupts
    cli

    rts
// ==========================================
