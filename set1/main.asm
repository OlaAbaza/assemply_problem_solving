INCLUDE Irvine32FCIS.inc ;DO NOT CHANGE THIS LINE

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
																					
.DATA					  													
;-------------------------Q1 DATA-----------------------	
	str1 byte 30 dup (?)



;-----------------------Q1 DATA End---------------------	


																					
;-------------------------Q2 DATA-----------------------	

	num dword ?


;-----------------------Q2 DATA End---------------------	



;-------------------------Q3 DATA-----------------------	


;-----------------------Q3 DATA End---------------------	




;-------------------------Q4 DATA-----------------------
str4 byte 50 dup(?)

;-----------------------Q4 DATA End---------------------	




;-------------------------Q5 DATA-----------------------	

str2 byte 30 dup(?)
str3 byte 30 dup (?)


;-----------------------Q5 DATA End---------------------	



;-------------------------Q6 DATA-----------------------
LengthofList dword ? 
List1 byte 50 dup (?)
List2 byte 50 dup (?) 
OutputList byte 100 dup (?)

;-----------------------Q6 DATA End---------------------




;-------------------------Q7 DATA-----------------------	
arr1 dword 1,11,111,1111,11111,111111,1111111,11111111,111111111,1111111111

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
   mov ebx,eax
   dec ebx
   call readdec
   mov esi,eax
   dec esi
   mov edx,offset str1
   mov ecx,lengthof str1
   call readstring 

   mov al,[edx+esi]
   xchg al,[edx+ebx]
   xchg al,[edx+esi]
   call writestring
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
	 call readdec
	mov ebx,eax
	mov edx,ebx
	call readdec
	mov esi,eax
	mov ecx,esi
	l1:
	add ebx ,2
	mov eax,ebx
	call writedec
	mov al," "
	call writechar
	loop l1
	call crlf
	mov ecx,esi
	sub ecx,1
	add edx,1
	mov eax,edx
	call writedec
	mov al," "
	call writechar
	l2:
	add edx,2
	mov eax,edx
	call writedec
	mov al," "
	call writechar
	loop l2
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
	call readdec;
	mov num,eax
	mov eax,0
	mov ecx,num
	l1:
	add eax,num
	loop l1
call writedec
call crlf

	RET

Q3 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question four procedure here
;----------------------------------------------------------
Q4 PROC
	mov edx ,offset str4
	mov ecx,lengthof str4
	call readstring
	mov esi,eax
	call readdec
	mov ecx ,eax
	mov ebx,ecx
	l1:
	mov al,[edx]
	call writechar
    add edx,type str4
	loop l1  
	mov ecx ,ebx
	sub esi,ebx
	mov edx ,offset str4
	l2:
	mov al,[edx+esi]
	call writechar
    add edx,type str4
	loop l2 
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
	mov edx ,offset str2
	mov ecx,lengthof str2
	call readstring
	mov ebx ,eax
	mov edx ,offset str3
	mov ecx,lengthof str3
	call readstring
	call readdec
	mov ecx,eax
	mov esi,ecx
    mov edx ,offset str2
	
	l1:
	mov al,[edx]
	call writechar
    add edx,type str2
	loop l1  
	 mov edx ,offset str3
	call writestring

	mov edx ,offset str2

	sub ebx,esi
	mov ecx ,ebx
	l2:
	mov al,[edx+esi]
	call writechar
	inc esi
	loop l2
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
call readdec
 mov LengthofList, eax
 mov ecx,LengthofList
 mov edx,offset List1
 l1:
 call readchar
 mov [edx],al
 add edx ,type List1
 loop l1
  mov ecx,LengthofList
 mov edx,offset List2
 l2:
 call readchar
 mov [edx],al
 add edx ,type List2
 loop l2

 mov edx,offset List1
 mov ebx,offset List2
 mov esi,offset OutputList

 mov ecx, LengthofList
 add ecx,ecx

 l3:
 mov al,[edx]
 mov [esi],al
 add esi ,type OutputList
 mov al,[ebx]
 mov [esi],al
  add edx ,type List1
  add ebx ,type List2
  add esi ,type OutputList
   loop l3
    mov al,"["
	call writechar
	mov edx , offset OutputList

	mov ecx, LengthofList
 add ecx,ecx
 dec ecx
l4:
	mov al,[edx]
	call writechar
	
mov al,","
call writechar
    add edx,type OutputList
	loop l4 

	mov ebx,LengthofList
	add  ebx,LengthofList
	dec ebx
	mov edx , offset OutputList
mov al,[edx+ebx]
call writechar
mov al,"]"
call writechar
call crlf


	RET

Q6 ENDP

;----------------------------------------------------------
;DO NOT CHANGE THE FUNCTION NAME
;
; Student's procedure
; Question seven procedure here
;----------------------------------------------------------
Q7 PROC
	
	call readdec
	mov ecx,eax
	mov esi,0
	mov edx,0
	l1:
	mov ebx,[arr1+edx]
	add esi,ebx
	add edx, type arr1
	loop l1
	mov eax,esi
	call writedec
	call crlf
	
	RET

Q7 ENDP


END MAIN