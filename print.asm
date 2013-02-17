stk segment stack
		db 128 DUP(?)
		tos label word
stk ends

;declaring array segment
data segment
	array db 1,2,3,4,5,6,7,8
	array_less db 20 DUP(?)
	threshold db 30
	arraylength db ($-array-1)
	prompt1 db "Total number of elements in array: $"
	prompt2 db "Number of elements less than $"
	prompt3 db "Elements are: $"
	prompt4 db "Number of ODD Integers: $"
	prompt5 db "Average of the ODD Integers: $"
	prompt6 db "Number of NON-PRIME Integers: $"
	colon db ":$"
	comma db  ",$"
	newline db 0Dh,0Ah,"$"
	
data ends;


code segment
assume cs:code, ss:stk, ds:data
	

	start: mov ax,stk		;initializing stack
		   mov ss,ax
		   mov sp,offset tos
		   mov ax,data		;intiializing data segment	
		   mov ds,ax
	
;----------------------------------------------Question 1------------------------------------------------------		
	printlength: 
				;printing prompt
				lea dx,prompt1
				mov ah,9
				int 21h
				;printing arraylength
			    mov dl, arraylength
				add dl, 30h
				mov ah, 02
				int 21h
				;going to next line
				lea dx,newline
				mov ah,9
				int 21h
	
	Initializations: 
		   xor ch,ch ; initializing index register
		   mov cl,arraylength ; sent space
		   xor bx,bx
		   

		;printing prompt
		  lea dx,prompt3
		  mov ah,9
		  int 21h	
		print: 
		 ;printing array element
		  mov dl,array[bx]
		  add dl,30h
		  mov ah,02h
		  int 21h
		  ;printing comma
		  lea dx,comma
		  mov ah,9
		  int 21h
		  ;incrementing counter
		  inc bx
		  dec cl
		  jnz print
		  int 21h
		 ;--------------------------------------------Question2-------------------------------------------
				xor bx,bx
				mov ah,threshold
				mov cl,arraylength
		 findloop:
							
				cmp  ah,array[bx]
				jg   printnos
				jl   incrementbx
				cmp  cx,bx
				jnz  findloop
				jz   exit
				
				
		  exit: int 21h
		  incrementbx: inc bx
		  printnos:  ; print prompt
					lea dx,prompt3
					mov ah,9
					int 21h
					;print number
					mov dl,array[bx]
					add dl,30h
					mov ah,02h
					int 21h
					;print comma
					lea dx,comma
					mov ah,9
					int 21h
				
		 
		 
		 
		 
		 
		 
		 
		 
		 
		 exit1: mov ah,4ch
		 int 21h
code ends
end start
		 
		 