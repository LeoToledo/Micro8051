;LEONARDO VINICIUS DE OLIVEIRA TOLEDO
;LISTA 1 DE MICROPROCESSADORES E APLICAÇÕES
;LINK PARA A LISTA: http://iris.sel.eesc.usp.br/sel614/Lista1.pdf
;EXERCICIO 1

		ORG	0
		LJMP	PROG

		ORG	001BH
		LJMP	SET1	

PROG:		
		MOV	P1, #00000000B
		MOV	A, #10001000B		;Habilita EA(Habilita o uso de interrupções) e ET1(interrupção do timer 1)
		MOV	IE, A			;Passa o conteúdo do acumulador para IE
		MOV	TMOD, #00000000B	;Gate1 = 0(disparo por software), Modo 0, Usamos temporizador(pois contamos ciclos de maquina)

		;Para contar até 640, usaremos o TH1 e TL1. O TH1 conta até 255d no modo 0
		;O TL1 conta até 32d no modo 0. No final, multiplicamos um pelo outro
		;Com isso, podemos fazer TL1 = 32d * TH1 = 20d
		;TH0 = 255d - 20d = 235d
		MOV	TH1, #235d
		MOV	TL1, #000d

		SETB	TR1			;Dispara o contador 1
		SJMP	$
SET1:		
		INC	P1			;Incrementa o P1
		CLR	EA			;Impede a interrupção da interrupção
		MOV	TH1, #235d		;Reseta os valores de TH1 e TL1. Quando eles acabam de contar uma vez, 
		MOV	TL1, #000d		;eles zeram. Por isso, é necessário realocar os valores
		SETB	EA			;Reabilita o uso de interrupções
		RETI

		END