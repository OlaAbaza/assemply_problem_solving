INCLUDE Irvine32FCIS.inc ;DO NOT CHANGE THIS LINE

;##########################################################################################;#
;							AUTOGRADER RELATED DATA										   ;#	  
;				DO NOT MODIFY, DELETE NOR ADD ANY LINE HERE								   ;#
;##########################################################################################;#
.DATA																					   ;#
																						   ;#
	prmpt byte "Please enter a question number 1, 2, 3 or enter 0 to exit: ", 0			   ;#
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
																					
.DATA					  													
;-------------------------Q1 DATA-----------------------	

    start dword 50 dup (?)
	end1 dword 50 dup (?)

;-----------------------Q1 DATA End---------------------	


																					
;-------------------------Q2 DATA-----------------------	

	str1 dword 10 dup (?)
	str2 byte 'Max numbers are:',0
	str3 byte 'Min numbers are:',0

;-----------------------Q2 DATA End---------------------	



;-------------------------Q3 DATA-----------------------	
	str4 dword 50 dup (?)
	i dword ?

	
	
;-----------------------Q3 DATA End---------------------	


														
														
														
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
	mov edx,offset start
	mov esi,offset end1
	mov ecx, eax
	mov ebx,eax
	l1:
	call readdec
	mov [edx],eax
	call readdec
	mov [esi],eax
	add edx,type start
	add esi,type end1
	loop l1
	mov ecx,ebx
	call readdec
	mov ebx,eax
	mov edi ,0
	mov edx,offset start
	mov esi,offset end1
	l2:
	cmp [edx],ebx
	ja next
	cmp [esi],ebx
	jb next
	inc edi
	next:
	add edx,type start
	add esi,type end1
	loop l2
	mov eax,edi
	call writedec
	call crlf


	RET

Q1 ENDP


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question two procedure here
;----------------------------------------------------------
Q2 PROC

mov ecx,10
mov ebx,-1000 ;max element
mov edx,-1000 ;second max element
mov esi,1000 ; min element
mov edi,1000 ;second min element
mov ebp ,offset str1
l2:
call readint
mov [ebp],eax
add ebp,type str1
loop l2

mov ecx,10
mov ebp ,offset str1
l1:
cmp [ebp] ,ebx
jle next
mov edx,ebx
mov ebx,[ebp]
next:
cmp [ebp],edx
jle exit1
cmp [ebp],ebx
je exit1
mov edx,[ebp]
exit1:
add ebp,type str1
loop l1


  mov ecx,edx
  mov edx,offset str2
  call writestring
   mov al," "
  call writechar
  mov eax,ecx
  call writeint
    mov al," "
  call writechar
   mov eax,ebx
  call writeint
  call crlf

  mov ecx,10
mov ebp ,offset str1
  l3:
  cmp [ebp],esi
  jge n1
  mov edi,esi
  mov esi,[ebp]
  n1:
  cmp [ebp],edi
  jge e1
  cmp [ebp],esi
  je e1
  mov edi,[ebp]
  e1:
  add ebp,type str1
  loop l3
    mov edx,offset str3
  call writestring
  mov al," "
  call writechar
	mov eax,esi
  call writeint
   mov al," "
  call writechar
   mov eax,edi
  call writeint
  call crlf
	
	RET

Q2 ENDP


;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question three procedure here
;----------------------------------------------------------
Q3 PROC
	
call readdec
	mov ecx,eax
	mov ebx,eax
	mov edx,offset str4
	l1:
	call readdec
	mov [edx],eax
	add edx,type str4
	loop l1

mov ecx,ebx
mov i,0
mov edx,offset str4
mov ebp,0
l2:
mov ebx,ecx
mov edi,i
mov esi,0

l3:
or esi,[edx+edi]
add ebp,esi
add edi,4
loop l3

add i,4
mov ecx,ebx
loop l2
mov eax,ebp
call writeint
call crlf
	RET

Q3 ENDP






END MAIN