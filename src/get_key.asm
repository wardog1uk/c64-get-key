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

    rts
// ==========================================
