dosseg
.model small
.stack 100h
.data
	str1 db "Current Time:- $"
.code
main proc
	mov ax,@data
	mov ds,ax
	
	LEA dx,str1				;Printing String
	mov ah,09h
	int 21h
	
	mov ah,2ch				;Interrupt for checking current time 
	int 21h
	
	mov ax,0
	mov al,ch				;Hours in ch
	CALL printTwoDigitNo	;Printing Hours
	
	mov ah,02h
	mov dl,':'
	int 21h
		
	mov ax,0
	mov al,cl				;Minutes in cl
	CALL printTwoDigitNo	;Printing Minutes
	
	mov ah,02h
	mov dl,':'
	int 21h

	mov ax,0
	mov al,dh				;Seconds in dh
	CALL printTwoDigitNo	;Printing Seconds

	mov ah,04ch				;Interrupt to return control
	int 21h

main ENDP

;=========Procedure for printing two digit number==========;

printTwoDigitNo proc
	mov bl,10
	DIV bl
	
	mov bl,ah
	
	mov ah,02h
	mov dl,al
	add dl,48
	int 21h
	
	mov ah,02h
	mov dl,bl
	add dl,48
	int 21h
	
	RET

printTwoDigitNo ENDP

end main
