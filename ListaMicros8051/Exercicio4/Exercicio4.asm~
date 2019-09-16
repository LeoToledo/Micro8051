;LEONARDO VINICIUS DE OLIVEIRA TOLEDO
;LISTA DE EXERCICIOS MICROPROCESSADORES E APLICAÇÕES
;LINK DA LISTA: http://iris.sel.eesc.usp.br/sel614/Lista1.pdf
;EXERCÍCIO 4

		ORG	0
		LJMP 	PROG

		ORG	0003H		;Interrupção externa 0
		LJMP	SET1

		ORG	000BH		;Interrupção Timer 0
		LJMP	SET3

		ORG	0013H		;Interrupção externa 1
		LJMP	SET2


PROG:		
		MOV	IE, #10000111b	;Ativados: EA, EX1(interrupção externa 1), ET0(interrupção timer 0), EX0(int ext 0)
		MOV	TMOD, #00000000b ;Gate = 0(disparo por software), Temporizador(0), Modo 0
		MOV	IP, #000101b	;Prioridade na interrupção externa 0
		SETB	IT0		;IT0 sensível a borda de descida
		SETB	IT1		;IT1 sensível a borda de descida

		;No modo 0, TL0 conta até 32(dura 32us). Com TH0 em 10(TH0 conta até 255), teremos 320us
		MOV	TH0, #245d
		MOV	TL0, #0d
		SETB	TR0		;Dispara a contagem do temporizador
		SJMP	$

SET1:	
		CLR	A		;Evita a interrupção da interrupção
		MOV	DPTR, #4000H	;Move o valor 4000h para dptr
		MOVX	A, @DPTR	;Move o conteúdo apontado por dptr
		MOV	DPTR, #4200H	;Move o valor 4200h para dptr
		MOVX	@DPTR, A	;Move o conteúdo de A para a posição 4200H da ram externa
		SETB	EA		;Reabilita o uso de interrupções
		RETI

SET2:
		CLR	A		;Evita a interrupção da interrupção
		MOV	DPTR, #4200H	;Move o valor 4200h para dptr
		MOVX	A, @DPTR	;Move o conteúdo de 4200h para o acumulador
		MOV	P1, A		;Move o conteúdo do acumulador para P1
		SETB	EA		;Reabilita o uso de interrupções
		RETI

SET3:		
		CLR	A		;Evita a interrupção da interrupção
		MOV	A, P2		;Move o conteúdo de P2 para o acumulador
		MOV	DPTR, #4000H	;Move o valor 4000h para o dptr
		MOVX	@DPTR, A	;Move o conteúdo do acumulador para a posição 4000h da ram externa
		
		MOV	TH0, #245d	;Recarrega os valores de TL0 e TH0
		MOV	TL0, #0d
		SETB	EA		;Reabilita o uso de interrupções
		RETI

		END
		