;LEONARDO VINICIUS DE OLIVEIRA TOLEDO
;LISTA DE EXERCICIOS MICROPROCESSADORES E APLICAÇÕES
;LINK DA LISTA: http://iris.sel.eesc.usp.br/sel614/Lista1.pdf
;EXERCICIO6


		ORG	0
		LJMP	PROG

		ORG	0003H			;Interrupção externa 0
		LJMP	SET1

		ORG	0013H			;Interrupçãp externa 1
		LJMP	SET2

PROG:		
		MOV	IE, #10000111b		;EA, EX1, ET0, EX0
		MOV	TMOD, #00000001b	;Disparo por software, temporizador, modo 1
		SETB	IT0			;Externa 0 sensível a descida de borda
		SETB	IT1			;Exerna 1 sensível a descida de borda

		SETB	P2.7			;Ligado enquanto está descendo
		SETB	P2.6			;Liga o motor para descer o recipiente

		MOV	R7, #3d			;Contador usado para o ciclo de repetir 3 vezes
FINAL:		SJMP	FINAL

DELAY:		
		MOV 	R2, #1d
LOOP1:		MOV	R1, #10d
LOOP:		MOV	R0, #250d
		DJNZ	R0, $
		DJNZ	R1, LOOP
		DJNZ	R2, LOOP1
		RET

SET1:		;Relativo ao sensor 1
		CLR	P2.6			;Desliga o motor
		DJNZ	R7, CONTINUA		;Checa se o ciclo já se repetiu 3 vezes
		RETI
		
CONTINUA:	SETB	P1.2			;Liga o aquecimento do forno
		ACALL	DELAY
		CLR	P1.2			;Desliga o aquecimento
		CLR	P2.7			;Inverte o sentido do motor
		SETB	P2.6			;Liga o motor
		RETI

SET2:		;Relativo ao sensor 2
		CLR	P2.6			;Desliga o motor
		SETB	P1.0			;Liga o resfriamento
		ACALL	DELAY
		CLR	P1.0			;Desliga o resfriamento
		SETB	P2.7			;Inverte o sentido do motor
		SETB	P2.6			;Liga o motor	
		RETI

		END
		