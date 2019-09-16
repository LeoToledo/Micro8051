;LEONARDO VINICIUS DE OLIVEIRA TOLEDO
;LABORATÓRIO 3 DE MICROPROCESSADORES E APLICAÇÕES
;LINK PARA O LAB: http://iris.sel.eesc.usp.br/sel614/lab3-A.pdf
;
;
;LAB 3.1
;		ORG	0
;
;INICIO:		
;		CLR	P3.0	 	;seta o bit p3.0 em 1
;		SETB	P3.1		;seta o bit p3.1 em 1
;		
;ROTINA:		MOV	R2, #002h	;Rotina de atraso 50ms
;		MOV	R1, #0C6h	;Rotina de atraso 50ms
;		MOV	R0, #034h	;Rotina de atraso 50ms
;		NOP			;Rotina de atraso 50ms
;		DJNZ	R0, $		;Rotina de atraso 50ms
;		DJNZ	R1, $-5		;Rotina de atraso 50ms	
;		DJNZ	R2, $-9		;Rotina de atraso 50ms
;		MOV	R1, #007h	;Rotina de atraso 50ms
;		MOV	R0, #0EAh	;Rotina de atraso 50ms	
;		NOP			;Rotina de atraso 50ms
;		DJNZ	R0, $		;Rotina de atraso 50ms
;		DJNZ	R1, $-5		;Rotina de atraso 50ms
;
;		CPL	P3.0		;Complementa o bit p3.0
;		CPL	P3.1		;Complementa o bit p3.1
;		LJMP	ROTINA
;		END

;LAB 3.2
;		ORG	0
;		SJMP	SET1
;
;		ORG	0003H
;		LJMP	SET2
;
;		ORG	0013H
;		LJMP	SET1
;SET1:		;Onda de 1hz
		;programando a interrupção externa 0
;		SETB	EA		;Habilita o uso de todas as interrupções
;		SETB	IE.0		;Habilita a interrupção externa 0
;		SETB	IT0		;Define que a interrupção é sensível à descida de borda	
;
;		CPL	P3.0		;Complementa o bit p3.0
;
;		;rotina de delay
;		MOV	R2, #004h	;Rotina de atraso 0.5s
;		MOV	R1, #0E8h	;Rotina de atraso 0.5s
;		MOV	R0, #0F6h	;Rotina de atraso 0.5s
;		NOP			;Rotina de atraso 0.5s
;		DJNZ	R0, $		;Rotina de atraso 0.5s
;		DJNZ	R1, $-5		;Rotina de atraso 0.5s
;		DJNZ	R2, $-9		;Rotina de atraso 0.5s
;		MOV	R0, #0F9h	;Rotina de atraso 0.5s	
;		DJNZ	R0, $		;Rotina de atraso 0.5s
;		NOP			;Rotina de atraso 0.5s
;		MOV	R0, #0E4h	;Rotina de atraso 500us
;		NOP			;Rotina de atraso 500us
;		DJNZ	R0, $		;Rotina de atraso 500us
;		NOP			;Rotina de atraso 500us
;		NOP			 ;Rotina de atraso 500us
;		NOP			;Rotina de atraso 500us
;		LJMP	SET1
;
;SET2:		;Onda de 4hz
;		;Programando a interrupção externa 1
;		SETB	EA		;Habilita o uso de interrupções
;		SETB	IE.1		;Habilita a interrupção externa 1
;		SETB	IT1		;Define que a IE.1 é sensível à descida de borda
;
;		CPL	P3.0		;Complementa o port p3.0
;
;		;Rotina de delay
;		MOV	R1, #0EFh	;Rotina de atraso 0.125s
;		MOV	R0, #0EFh	;Rotina de atraso 0.125s
;		NOP			;Rotina de atraso 0.125s
;		DJNZ	R0, $		;Rotina de atraso 0.125s
;		DJNZ	R1, $-5		;Rotina de atraso 0.125s
;		NOP			;Rotina de atraso 0.125s
;		NOP			;Rotina de atraso 0.125s
;		MOV	R0, #038h	;Rotina de atraso 125us
;		NOP			;Rotina de atraso 125us
;		DJNZ	R0, $		;Rotina de atraso 125us
;		NOP			;Rotina de atraso 125us	
;		NOP			;Rotina de atraso 125us
;		LJMP	SET2
;		RETI
;		END			
