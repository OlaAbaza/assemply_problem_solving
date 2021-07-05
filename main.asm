	
INCLUDE Irvine32FCIS.inc ;DO NOT CHANGE THIS LINE
INCLUDE macros.inc
BUFFER_SIZE = 501
TITLE Keyboard Display           (Keybd.asm)


;##########################################################################################;#
;							AUTOGRADER RELATED DATA										   ;#	  
;				DO NOT MODIFY, DELETE NOR ADD ANY LINE HERE								   ;#
;##########################################################################################;#
.DATA																					   ;#
																						   ;#
	prmpt byte "Please enter a question number 1, 2, 3, 4, 5, 6, 7 or enter 0 to exit: ", 0;#
	wrongChoice byte "Please enter a valid question number!", 0							   ;#
	tmpstr byte 5 dup(?), 0																   ;#
;##########################################################################################;#

;-----------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------

																					
;#######################################################							
;				STUDENTS' .DATA	SECTION     		   #							
;		   THIS SECTION MADE FOR STUDENTS' DATA        #							
;      YOU CAN MODIFY, ADD OR EDIT THIS SECTION        #							
;#######################################################							
																					
.model small
.stack 100h
.data				  													
;-------------------------Q1 DATA-----------------------	



;-----------------------Q1 DATA End---------------------	
 
																					
;-------------------------Q2 DATA-----------------------	


;-----------------------Q2 DATA End---------------------	



;-------------------------Q3 DATA-----------------------	

str1 byte 'Enter K: ',0
str2 byte 'Enter N: ',0
str3 byte 'Enter W: ',0
;-----------------------Q3 DATA End---------------------	




;-------------------------Q4 DATA-----------------------


;-----------------------Q4 DATA End---------------------	




;-------------------------Q5 DATA-----------------------	

 arr dword 30 dup(?)

;-----------------------Q5 DATA End---------------------	



;-------------------------Q6 DATA-----------------------
Q4_Matrix_1 byte 30 dup(?)
Q4_Matrix_2 byte 30 dup(?)
str4 byte 'please, Enter original matrix values : ',0
str5 byte 'The original matrix  : ',0


;-----------------------Q6 DATA End---------------------




;-------------------------Q7 DATA-----------------------	



;-----------------------Q7 DATA End---------------------	
														
														
														
.code													
;########################################################
;			AUTOGRADER RELATED METHOD			       ;#
;			  DO NOT MODIFY, DELETE					   ;#
;			  NOR ADD ANY LINE HERE					   ;#
;########################################################
MAIN PROC											   ;#		  
	PROGLOOP:										   ;#
		MOV EDX, OFFSET PRMPT						   ;#
		CALL WRITESTRING							   ;#
		CALL READDEC								   ;#
		CMP EAX, 0									   ;#
		JE FIN										   ;#
													   ;#
		CMP EAX, 1									   ;#
		JE _Q1										   ;#
		CMP EAX, 2									   ;#
		JE _Q2										   ;#
		CMP EAX, 3									   ;#
		JE _Q3										   ;#
		CMP EAX, 4								  	   ;#
		JE _Q4										   ;#
		CMP EAX, 5								  	   ;#
		JE _Q5										   ;#
		CMP EAX, 6								  	   ;#
		JE _Q6										   ;#
		CMP EAX, 7							  		   ;#
		JE _Q7										   ;#
													   ;#
		JMP WRONG									   ;#
													   ;#
		_Q1:										   ;#
		CALL Q1										   ;#
		JMP CONT									   ;#
													   ;#
		_Q2:										   ;#	
		CALL Q2										   ;#
		JMP CONT									   ;#
													   ;#
		_Q3:										   ;#	
		CALL Q3										   ;#
		JMP CONT									   ;#
													   ;#
		_Q4:										   ;#	
		CALL Q4									  	   ;#
		JMP CONT									   ;#
													   ;#
		_Q5:										   ;#	
		CALL Q5									  	   ;#
		JMP CONT									   ;#
													   ;#
		_Q6:										   ;#	
		CALL Q6							  			   ;#
		JMP CONT									   ;#
													   ;#
		_Q7:										   ;#	
		CALL Q7						  				   ;#
		JMP CONT									   ;#
													   ;#
												       ;#
		WRONG:										   ;#
		MOV EDX, OFFSET wrongChoice					   ;#
		CALL WRITESTRING							   ;#
		CALL CRLF									   ;#
													   ;#
		CONT:										   ;#
		JMP PROGLOOP								   ;#
													   ;#
		FIN:										   ;#
													   ;#
	EXIT											   ;#
MAIN ENDP											   ;#
;#######################################################


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question one procedure here
;----------------------------------------------------------
Q1 PROC
  call readdec
  mov ecx,eax
  mov ebx,1
  mov edx,1
   l1:
   mov esi,ecx
   mov ecx,ebx
   l2:
   mov eax,edx
   call writedec
   mov al ," "
   call writechar
   inc edx
   loop l2
   call crlf
   mov ecx,esi
   inc ebx
  loop l1

	RET

Q1 ENDP


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question two procedure here
;----------------------------------------------------------
Q2 PROC
  call readdec
  mov ecx,eax
  dec ecx
  mov ebx,0
  mov edx,1
  mov eax,0
  call writedec
  call crlf
  mov eax,1
  call writedec
  call crlf
 
  l1:
  add ebx,edx
  mov eax,ebx
  call writedec
  call crlf
  mov esi,ebx
  mov ebx,edx
  mov edx,esi
 
  loop l1

	RET

Q2 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question three procedure here
;----------------------------------------------------------
Q3 PROC
	mov edx,offset str1
	call writestring

	call readdec
	mov edi,eax

	mov edx,offset str2
	call writestring

	call readdec
	mov ebx,eax

	mov edx,offset str3
	call writestring

	call readdec
	mov ecx,eax

	mov edx,1
	mov eax,0
	l1:
	mov esi,ecx
	mov ecx,edx
	l2:
	add eax,edi
	loop l2
	mov ecx,esi
	inc edx
	loop l1
	sub eax,ebx
	call writeint
	call crlf

ret


Q3 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question four procedure here
;----------------------------------------------------------
Q4 PROC
  call readdec
  mov ecx,eax
  sub ecx,2
  mov ebx,2
  mov edx,1
  mov eax,2
  call writedec
  mov al ," "
  call writechar
  mov eax,1
  call writedec
  mov al ," "
  call writechar

  l1:
  add ebx,edx
  mov eax,ebx
  call writedec
  mov al ," "
  call writechar
 
  mov esi,ebx
  mov ebx,edx
  mov edx,esi
  loop l1
  call crlf
	RET

Q4 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question five procedure here
;----------------------------------------------------------
Q5 PROC
call readdec
mov ecx,eax
mov edi,eax
mov edx,offset arr
	l3:
	call readdec
	mov [edx],eax
	add edx,type arr
	loop l3
mov ebx,1
mov edx,offset arr
mov esi,0
mov ecx,edi
l1:
	mov edi,ecx
	mov ecx,ebx
	l2:
	add esi,[edx]
	loop l2
	mov ecx,edi
	inc ebx
	add edx,type arr
	loop l1
call crlf
	mov eax,esi
	call writedec
	call crlf

	RET

Q5 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question six procedure here
;----------------------------------------------------------
Q6 PROC
mov edx,offset str4
call writestring
call crlf

mov edx,offset Q4_Matrix_1


mov ecx,6
l1:
call readchar
mov [edx],al
add edx,type Q4_Matrix_1
loop l1

mov ecx,3
mov edi,1


mov edx,offset str5
call writestring
mov edx,offset Q4_Matrix_1
l2:
mov ebx,ecx
mov ecx,edi
l3:
mov al,[edx]
call writechar
mov al ," "
call writechar
add edx ,type Q4_Matrix_1
loop l3

call crlf
mov ecx,ebx
inc edi
loop l2
;--------------------------
mov edx,offset str5
call writestring
call crlf

mov ecx,3
mov edi,1
mov edx,offset Q4_Matrix_1
mov esi,offset Q4_Matrix_2

mov al ,[edx]
mov [esi],al

mov al ,[edx+1]
mov [esi+2],al

mov al ,[edx+2]
mov [esi+1],al

mov al ,[edx+4]
mov [esi+4],al

mov al ,[edx+3]
mov [esi+5],al

mov al ,[edx+5]
mov [esi+3],al

mov ecx,3
mov edi,1
l4:
mov ebx,ecx
mov ecx,edi
l5:
mov al,[esi]
call writechar
mov al ," "
call writechar
add esi ,type Q4_Matrix_1
loop l5

call crlf
mov ecx,ebx
inc edi
loop l4


Q6 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question seven procedure here
;----------------------------------------------------------
Q7 PROC


	RET

Q7 ENDP
;---------------------------------------------------------------------

END MAIN