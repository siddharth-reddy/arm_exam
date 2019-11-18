     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    VLDR.F32 S0, =0.174532	;i angle in radian
		VLDR.F32 S2, =0.174532
		MOV R5, #35		; NO OF ANGLES
		MOV R4, #0			; ITS COUNTER
		VLDR.F32 S1, =10.0	;j number of terms to be taken in the series
		MOV R6, #10			;terms r2
		VLDR.F32 S3, =0.0	;COUNTER K
		MOV R7, #0		;r3
		VLDR.F32 S4, =0.0	;SUM cos
		VLDR.F32 S5, =1.0	;DEN
		VLDR.F32 S6, =1.0	;ii
		VLDR.F32 S7, =0.0 	;ii/DEN
		VLDR.F32 S8, =1.0	;#1
		VLDR.F32 S9, =0.0	;SUM2 sin
		VLDR.F32 S10, =0.0	;TAN
		VLDR.F32 S11, =1.0	;-VE SIGN
		VLDR.F32 S12, =0.0	;-VE SIGN
		;-----extra
		;VLDR.F32 S12, =0.0087266	; unit angle pi/360
		VLDR.F32 S13, =100.0 		;r
		VLDR.F32 S14, =319.0			;X1
		VLDR.F32 S15, =239.0			;Y1
		VLDR.F32 S16, =0.0			;X
		VLDR.F32 S17, =0.0			;Y
		;-RESTORE
		VLDR.F32 S18, =0.0
		VLDR.F32 S19, =0.0
		VLDR.F32 S20, =0.0
		VLDR.F32 S21, =0.0
	
COMP    CMP R7,R6
		BLT LOOP
		;VDIV.F32 S10,S9,S4	;TAN DIVIDE
		CMP R4,R5
		B PRINT2
PRINT	BLT EXAM
		BEQ stop
		;BGE stop

LOOP	VDIV.F32 S7,S6,S5	;II/DEN
		VMUL.F32 S7,S7,S11	;SIGN
		VADD.F32 S4,S4,S7	;SUM1 cos
		VMUL.F32 S6,S6,S0	;II	
		VADD.F32 S3,S3,S8	;
		VMUL.F32 S5,S5,S3	;DEN
		ADD R7,R7,#1
		B LOOP1

LOOP1	VDIV.F32 S7,S6,S5	;II/DEN
		VMUL.F32 S7,S7,S11	;SIGN
		VADD.F32 S9,S9,S7	;SUM2 sin
		VMUL.F32 S6,S6,S0	;II	
		VADD.F32 S3,S3,S8	;
		VMUL.F32 S5,S5,S3	;DEN
		ADD R7,R7,#1
		VSUB.F32 S11,S12,S11	; CHANGIN
		
		B COMP
		
		;--------------extra
EXAM	VADD.F32 S0,S0,S2 ; INCREASE ANGLE
		MOV R7, #0			;RESET COUNTER
		VLDR.F32 S3, =0.0	;COUNTER K
		VLDR.F32 S4, =0.0	;SUM cos
		VLDR.F32 S5, =1.0	;DEN
		VLDR.F32 S6, =1.0	;ii
		VLDR.F32 S7, =0.0 	;ii/DEN
		VLDR.F32 S8, =1.0	;#1
		VLDR.F32 S9, =0.0	;SUM2 sin
		VLDR.F32 S10, =0.0	;TAN
		VLDR.F32 S11, =1.0	;-VE SIGN
		VLDR.F32 S12, =0.0	;-VE SIGN
		VLDR.F32 S13, =100 			;r
		VLDR.F32 S14, =319			;X1
		VLDR.F32 S15, =239			;Y1
		VLDR.F32 S16, =0			;X
		VLDR.F32 S17, =0			;Y
		ADD R4,R4,#1		;COUNTER INCREASE
		B COMP
		
PRINT2  MOV R0, #0
		MOV R1, #0
		MOV R2, #0
		MOV R3, #0
		VMUL.F32 S4,S13,S4	;COS*R
		VMOV.F32 R2,S0		; THETA
		VADD.F32 S16,S14,S4 ; X= X1+COS*R
		VMOV.F32 R0,S16		; X
		VMUL.F32 S9,S13,S9	;SIN*R
		VMOV.F32 R3,S13		;R
		VADD.F32 S17,S15,S9 ; Y= Y1+SIN*R
		VMOV.F32 R1,S17		;Y
		;STORE
		
		;BL printMsg
		;RESTORE
		
		B PRINT
		
		
stop    B stop ; stop program
     ENDFUNC
     END 