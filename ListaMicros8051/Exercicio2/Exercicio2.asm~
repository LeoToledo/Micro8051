;LEONARDO VINICIUS DE OLIVEIRA TOLEDO
;LISTA DE EXERCICIOS MICROPROCESSADORES E APLICAÇÕES
;LINK DA LISTA: http://iris.sel.eesc.usp.br/sel614/Lista1.pdf
;EXERCÍCIO 2

		ORG	0
		LJMP	PROG

		ORG	000BH
		LJMP	SET1

PROG:		
		CLR	P1.7
		MOV	IE, #10000010B		;Habilita EA e ET0(timer 0)
		MOV	TMOD, #00000000B		;Gate 0(disparo por software), Temporizador, Modo 0
		;Queremos 1,28ms. Para isso, teremos 1280 ciclos de máquina
		;Cada ciclo de máquina possui 1us, então queremos 1280 ciclos
		;TL0 = 32d e TH0 = 40d
		;TL0 = 32d - 32d = 0d e TH0 = 255d - 40d = 215d
		MOV	TH0, #215d
		MOV	TL0, #0d
			
		SETB	TR0			;Dispara o contador 0
		SJMP	$

SET1:		
		CPL	P1.7			;Complementa p1.7
		CLR	EA			;Impede a interrupção da interrupção
		MOV	TH0, #215d		;Recarrega TH0 e TL0
		MOV	TL0, #0d
		SETB	EA			;Reabilita o uso de interrupções
		RETI
					
		END