// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// pseudocode:
//             dispcnt = 8192
// LOOP:
//             if (KBD == 0) goto LIGHT
//             if (KBD != 0) goto DARK
// LIGHT:
//             i = 0
//             goto DRAW_LIGHT
// DARK:
//             i = 0
//             goto DRAW_DARK
// DRAW_LIGHT:
//             if (i == dispcnt) goto LOOP
//             *(SCREEN + i) = 0
//             i = i + 1
//             goto DRAW_LIGHT
// DRAW_DARK:
//             if (i == dispcnt) goto LOOP
//             *(SCREEN + i) = -1
//             i = i + 1
//             goto DRAW_DARK
// END:

                // dispcnt = 8192
                @8192
                D = A
                @dispcnt
                M = D
(LOOP)
                // if (KBD == 0) goto LIGHT
                @KBD
                D = M
                @LIGHT
                D; JEQ
                // if (KBD != 0) goto DARK
                @KBD
                D = M
                @DARK
                D; JNE
(LIGHT)
                // i = 0
                @i
                M = 0
                // goto DRAW_LIGHT
                @DRAW_LIGHT
                D; JMP
(DARK)
                // i = 0
                @i
                M = 0
                // goto DRAW_DARK
                @DRAW_DARK
                D; JMP
(DRAW_LIGHT)
                // if (i == dispcnt) goto LOOP
                @dispcnt
                D = M
                @i
                D = D - M
                @LOOP
                D; JEQ
                // *(SCREEN + i) = 0
                @SCREEN
                D = A
                @i
                A = D + M
                M = 0
                // i = i + 1
                @i
                M = M + 1
                // goto DRAW_LIGHT
                @DRAW_LIGHT
                D; JMP
(DRAW_DARK)
                // if (i == dispcnt) goto LOOP
                @dispcnt
                D = M
                @i
                D = D - M
                @LOOP
                D; JEQ
                // *(SCREEN + i) = -1
                @SCREEN
                D = A
                @i
                A = D + M
                M = -1
                // i = i + 1
                @i
                M = M + 1
                // goto DRAW_DARK
                @DRAW_DARK
                D; JMP
(END)
                @END
                0; JMP
