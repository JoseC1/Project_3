;
; file: asm_main.asm
%include "asm_io.inc"


; initialized data is put in the .data segment
segment .data

;Greeting msg
Gmsg: db "Welcome to my program, my name is Jose",10,0

;Age messages 
Amsg: db "I am currently ",0
Amsg_2: db " years old",10,0

;Age
num: dd 19;


;Favorite Letter Msg
Lmsg: db "And my favorite letter is: ",0 

;Favorite Letter
char: db "J",0


;Questions 
Q1: db "Now Please Enter Your Favorite Letter",10,0
Q2: db "And Please Enter Your Age",10,0

;Leaving Msg 
Bmsg: db "Thank you for playing Good Bye :)",10,0


; uninitialized data is put in the .bss segment
segment .bss


input1: resd 1 ;This will save The answer to there
               ;first question

input2: resd 1 ;This will save the answer to there
               ;Second Question


; code is put in the .text segment
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
        
        mov eax, 0 ;Zeroing out eax 
        
        mov eax, Gmsg ;Moving the Address of my Greeting Msg
                      ;Into my eax register
     
        call print_string ;This will print my greeting msg 
                          ;On to the screen
        call print_nl     ;Adds a New line 

        mov eax, Amsg ;This moves the address of my Age Msg
                      ;Into my eax register
        
        call print_string ;This prints the first part of my
                          ;Age msg onto the screen
        
        mov eax, DWORD[num] ;This moves the context of my num
                            ;Variable into my eax register
        
        call print_int ;This will print my age onto the screen
        
        mov eax, Amsg_2 ;This will move the address of the
                        ;Second part Age msg into eax register

        call print_string ;This will print the second part of 
                          ;the Age msg on to the screen
        call print_nl     ;This will print a NEWLINE

       
       
       mov eax, Lmsg ;This moves the address of the 
                      ;Favorite Letter Msg into eax

        call print_string ;This will print My Favorite
                          ;Letter Msg on to the screen

        mov eax, [char] ;This will move the context of my char
                        ;variable into eax (putting J in eax)
        ;Note Char contains my favorite letter

       

       call print_char ;This will print my Favorite letter 
                        ;On to the screen
        call print_nl
        call print_nl ;Printing a Double NewLine To look cleaner
        


        ;This part of the code Ask the questions to the user:    

        mov eax, Q1 ;This will move the address of the first
                    ;Question into Eax 

        call print_string ;This will print the first_Question
        
        call read_char ;This will read in their data and save
                       ;Its ASCHII CODE in the eax register
        
        mov [input1], eax ;This saves their answer in the
                          ;input1 variable

        mov eax, Q2 ;This will moves the address of the second
                    ;Question into Eax 

        call print_string ;This prints the Second Question 

        call read_int ;This will read in the integer they
                      ;Enter and save it in eax

        mov [input2], eax ;This Save their Answer in the 
                          ;Input2 Variable
        
        mov eax, Bmsg ;This moves the context of the Adress
                      ;Of the bye msg into eax 

        call print_string ;This prints the Bye msg to Screen
        call print_nl


        popa
        mov     eax, 0            ; return back to C
        leave
        ret
