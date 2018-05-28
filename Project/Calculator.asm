;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;                  Simple Calculator                  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;                                                     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;               Section: G                   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;                                                                                  ;;;;;;;;;;;;;;;        
;;;;;;;;;;;;                                 Group number 03                                  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;                                                                                  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;                 Showmik,MD. Jannatul Baki       15-28584-1                       ;;;;;;;;;;;;;;;
;;;;;;;;;;;;                 Saha,Projna                     15-28566-1                       ;;;;;;;;;;;;;;;
;;;;;;;;;;;;                 Naser,Dia Tasneem               15-28672-1                       ;;;;;;;;;;;;;;;
;;;;;;;;;;;;                                                                                  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;                                                                                   ;;;;;;;;;;;;;;
;;;;;;;;;;;;                       Course Instructor: MD. Samawat Ullah                        ;;;;;;;;;;;;;;
;;;;;;;;;;;;                                                                                   ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                                                           ;
;           acknowlegement  ---------AKASH,MD.ANISUR RAHMAN                                                 ;
;                           ---------KAZI,FAISAL                                                            ;
;                           ---------ASSEMBLY LANGUAGE PROGRAMMING BY YU MARUT(CHAP-8)                      ;
;                                                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;                                                                                                           ;
;              PROJECT IN DETAILS :                                                                         ;
;                                                                                                           ;
;             -This simple calculator gets two numbers from the user,                                       ; 
;             -Then it will give user to choice what he wants to do???:                                     ;
;              +,-,*,/,power,factorial,absolute number                                                      ;
;             -Then it calculates the + or - or * or / or power or factorial or absolute of these numbers,  ; 
;             -Then it will print out the result,                                                           ;
;             -Then the calculator will go back to the loop for input,                                      ;
;             -If the user wants to get the last result,pressing esc user can get the last result and       ;
;              will break down the program.                                                                 ;
;                                                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 
;-----------------------------------------------------------------------------------------------------------;
;;;;;;;;; ---------      method calling-these functions are copied from emu8086.inc        --------- ;;;;;;;;
;-----------------------------------------------------------------------------------------------------------;

include 'emu8086.inc'

.model small
.stack 100h
.data

;;;;;;   define variables  ;;;;;;

str1 db 'INPUT1 = $'
str2 db 'INPUT2 = $'
str3 db  '                |       1. ADDITION                        | $'
str9 db  '                |       2. SUBSTRACTION                    | $'
str10 db '                |       3. MULTIPLICATION                  | $'
str11 db '                |       4. DIVISION                        | $'
str4 db  '                |       5. POWER                           | $'
str12 db '                |       6. ABSOLUTE                        | $'
str13 db '                |       7. FACTORIAL or esc to exit        | $' 
str5 db '                              LAST RESULT = $'
str6 db 20h,20h,20h,20h,20h,20h,20h,20h,'                         QUOTIENT=  $                   '
str7 db 20h,20h,20h,20h,20h,20h,20h,20h,'                         REMAINDER= $                   ' 
str8 db  '                 !!!!!!  OVERFLOW OCCURED. TRY AGAIN. !!!!!! $'
str14 db '                -------------------------------------------- $'
str15 db '                                RESULT = $'
str16 db '->  please ENTER your desired operation :                 $'
str17 db '          ( note:You must enter a number in range -32767 to 32767 ) $'
str18 db '                                    MENU                       $'
str19 db '  (^)  = $'    
str20 db ' undefined $'
str21 db 'you must enter a positive value $'  
str22 db 'no factorial for negative number $'
 
a dw 0                    ;1st input to store
b dw 0                    ;2nd input to store
result dw 0               ;result to store
rem dw 0
.code                     ;begining to code
mov ax,@data
mov ds,ax

proc main
    take:
     mov ah,2
    mov dl,10
    int 21h 
    mov dl,13    
    int 21h
     mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str18           ;print menu
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h 
     lea dx,str14          ;print '------------'
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str3            ;print addition
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str9            ;print substraction
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str10           ;print multiplication
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h     
    lea dx,str11           ;print division
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str4            ;print power
    mov ah,9
    int 21h 
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str12           ;print absolute
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h     
    lea dx,str13           ;print factorial ,esc
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
     lea dx,str14          ;print '---------'
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str17           ;print input number range 
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    
     mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h 
    
    lea dx,str16            ;print user choice
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
           
    mov ah,1                ;takes a choice from user
    int 21h
    
    cmp al,031h
    je call addition        ;1 for addition
    
    cmp al,032h
    je call substraction    ;2 for substraction
    
    cmp al,033h
    je call multipication   ;3 for multipication
    
    cmp al,034h
    je call division        ;4 for division
    
    cmp al,035h
    je call power           ;5 for power
    
    cmp al,036h
    je call absolute        ;6 for absolute
    
    cmp al,037h
    je call factorial       ;7 for factorial
    
   
    
    cmp al,01bh
    je call last            ;esc for ending
    jne take
    
    end:
    mov ax,4ch
    int 21h
endp main


;-----------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                     FACTORIAL                  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-----------------------------------------------------------------------------------------------------------;

proc factorial 
    check_fact:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,str22           ;no factprial for neg input
    mov ah,9
    int 21h
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    call input1            ;calls for input1
    mov cx,a   
    cmp cx,0
    jge fact_start
    jl check_fact
    
    
    fact_start:
    mov ax,1
    mov bx,1
    
    fact_s:
    cmp bx,cx              ;compare bx and cx
    jle fact
    jg fact_end
    
    fact:
    mul bx 
    jo call overflow       ;jumps if overflow occurs
    inc bx
    jmp fact_s
    
    fact_end:
    mov result,ax          ;puts value in result
    call print    
    jmp take
endp factorial


;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             ABSOLUTE VALUE             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;


proc absolute
    call input1
    mov ax,a
    cmp ax,0               ;compares result with 0
    jge p
    jl n
    
    p:
    mov result,ax          ;no changes for positive value
    call print   
    jmp take   
    
    n:
    mov bx,-1
    mul bx                 ;changes negative to positive
    mov result,ax 
    call print
    jmp take
        
endp mod

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 POWER                  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;
   
proc power
     check:
      mov ah,2
    mov dl,13            ;CRET
    int 21h
    mov ah,2
    mov dl,10            ;NEWLINE
    int 21h
      lea dx,str21
    mov ah,9
    int 21h
     mov ah,2
    mov dl,13            ;CRET
    int 21h
    mov ah,2
    mov dl,10            ;NEWLINE
    int 21h
    call input1          ;calls input1   
               
    mov ah,2
    mov dl,13            ;CRET
    int 21h
    mov ah,2
    mov dl,10            ;NEWLINE
    int 21h
    
    call input2          ;calls input2
    mov ax,a
    mov bx,b   
    
    cmp ax,0
    jge check_a
    jl check
    
    check_a:
    cmp bx,1
    jge check_b
    jl check_zero
    
    check_zero:
    cmp bx,0
    je zero
    jl check
    
    zero:
    mov ax,1
    mov result,ax
    jmp po_end
    
    check_b:
    dec bx
    mov cx,1
    
    po_s:
    mov dx,a
    cmp cx,bx
    je po
    jge po_end
           
    po:
    mul dx
    jo call overflow     ;jumps if overflow occurs
    inc cx
    jmp po_s
           
    po_end:
    mov result,ax
    call print    
    jmp take
endp power


;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 INPUT 1                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc input1
    mov ah,2
    mov dl,13            ;CRET
    int 21h
    mov ah,2
    mov dl,10            ;NEWLINE
    int 21h
     mov ah,2
    mov dl,10
    int 21h 
    mov dl,13
    int 21h
    lea dx,str1
    mov ah,9
    int 21h     
    call scan_num        ;taking an input
    mov a,cx             ;storing value in a
    ret                  ;back to the call source    
endp input1

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                 INPUT 2                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc input2
    mov ah,2
    mov dl,13            ;CRET
    int 21h
    mov ah,2
    mov dl,10            ;NEWLINE
    int 21h
    lea dx,str2
    mov ah,9
    int 21h
    call scan_num        ;taking an input
    mov b,cx             ;storing value in b
    ret                  ;GO BACK TO THE CALL SORCE         
endp input2 

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                ADDITION                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc addition
    call input1
    call input2
    mov ax,a
    mov bx,b
    add ax,bx  
    jo call overflow     ;jumps if overflow occurs
    mov result,ax
    call print 
    jmp take   
endp addition

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;              SUBSTRACTION              ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc substraction  
    call input1
    call input2
    mov ax,a
    mov bx,b
    sub ax,bx 
    jo call overflow      ;jumps if overflow occurs
    mov result,ax   
    call print   
    jmp take
endp substraction 

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             MULTIPLICATION             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc multipication 
    call input1
    call input2
    mov ax,a
    mov bx,b
    mul bx
    ;jo call overflow       ;jumps if overflow occurs
    mov result,ax  
    call print
    jmp take   
endp multipication 

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                DIVISION                ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc division
    call input1
    take_div:
    call input2   
   
    mov ax,a
    mov bx,b    
    
    cmp ax,0
    jge div_1
    jl call overflow
    
    div_1:
    cmp bx,1
    jge div_start
    jl check_div
    
    check_div:
    cmp bx,0
    je call undifined
    jl call overflow
    
    div_start:
    mov dx,0
    div bx 
    jo call overflow       ;jumps if overflow occurs
    mov result,ax 
    mov rem,dx 
    call print_div
    jmp take
endp division
 
proc undifined
    lea dx,str20
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov ah,2
    mov dl,10              ;NEWLINE
    int 21h
    jmp take_div    
endp undifined

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  PRINT                 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc print
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov ah,2
    mov dl,10              ;NEWLINE
    int 21h
    lea dx,str15
    mov ah,9
    int 21h
    mov ax,result          ;moving result in ax
    call print_num         ;showing value to screen
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov ah,2
    mov dl,10              ;NEWLINE
    int 21h
    ret
endp print

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;            QUOTIENT ,REMAINDER         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc print_div 
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov dl,10              ;NEWLINE
    int 21h
    lea dx,str6
    mov ah,9
    int 21h    
    mov ax,result          ;quotient
    call print_num
    
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov dl,10              ;NEWLINE
    int 21h
    lea dx,str7
    mov ah,9
    int 21h                ;remainder
    mov ax,rem
    call print_num
    
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov dl,10              ;NEWLINE
    int 21h
    ret    
endp print_div

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             LAST RESULT OR esc             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc last
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov ah,2
    mov dl,10              ;NEWLINE
    int 21h
    lea dx,str5
    mov ah,9
    int 21h     
    mov ax,result 
    call print_num    
    jmp end
endp last 

;------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                  OVERFLOW                 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------;

proc overflow  
    
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov ah,2
    mov dl,10              ;NEWLINE
    int 21h
    lea dx,str8
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,13              ;CRET
    int 21h
    mov ah,2
    mov dl,10              ;NEWLINE
    int 21h   
    jmp take
endp overflow

;-------------------------------------------------------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;             TO IMPORT IT INTO THE CODE           ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------------------------------------------------------;

define_scan_num            ;difining scan number
define_print_num           ;difining the number that will be printed
define_print_num_uns       