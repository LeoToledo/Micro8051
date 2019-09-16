;LEONARDO VINICIUS DE OLIVEIRA TOLEDO
;LISTA DE EXERCICIOS MICROPROCESSADORES E APLICAÇÕES
;LINK DA LISTA: http://iris.sel.eesc.usp.br/sel614/Lista1.pdf
;EXERCICIO 5

		ORG	0
		LJMP	PROG

		ORG	0003H			;Interrupção externa 0(Ativa S1)
		LJMP	SET1

		ORG	000BH			;Interrupção Timer 0
		LJMP	SET2

		ORG	0013H			;Interrupção externa 1 (Ativa S2)
		LJMP	SET3


PROG:
		MOV	IE, #10000111b		;EA, EX1, ET0, EX0 habilitados
		MOV	TMOD, #00000001b	;Timer ativado por software, modo 1, temporizador
		SETB	IT0			;Interrupção externa 0 sensível à descida de borda
		SETB	IT1			;Interrupção externa 1 sensível à descida de borda
		SETB	P1.1			;Abre v2
		;Faremos uma contagem de 0 até 2^16 = 65536d
		MOV	TH0, #0d		;TH0 começa a contar de 0
		MOV	TL0, #0d		;TL0 começa a contar em 0
	
		SJMP	$


SET1:		;Começa a contar quando o sensor S1 é ativado
		CLR	EA
		SETB	TR0			;Dispara o contador do timer 0
		SETB	EA
		RETI

SET3:		;Dispara S2 e indica que a valvula 1 deve ser aberta para abaixar o nível de água
		;obs: note que 6412 = 64 12. Se dividirmos cada parte por 2, temos 32 06 = 3206 = 6412/2
		CLR	TR0
		CLR	EA			;Impede a interrupção da interrupção
		CLR	P1.1			;Fecha v2
		SETB	P1.0			;Abre v1
		MOV	A, TH0			;Move o valor no qual S2 disparou para R0
		MOV	B, #2d			;Vamos dividir por 2
		DIV	AB			;Divide A por B. Guarda o valor inteiro em A
		MOV	R0, A			;Move o conteúdo de A para o registrador R0

		MOV	A, TL0			;Move o conteúdo de TL0 para o acumulador
		MOV	B, #2d			;Dividiremos por 2
		DIV	AB			;Divide A por B. Guarda o valor inteiro em A
		MOV	R1, A			;Move o conteúdo de A para o registrador R0

		SETB	EA			;Reabilita o uso de interrupções
		;Agora, devemos esvaziar a metade que foi contada
		;TH0 e TL0 tem valor máximo de 255 no modo 1
		;Logo, vamos esvaziar 255 - R0 e 255 - R1
		MOV	A, #255d
		SUBB	A, R0			;Subtrai o valor de R0 de A
		MOV	R0, A			;Atualiza R0 com o valor que TH0 deve ter

		MOV	A, #255d	
		SUBB	A, R1			;Subtrai o valor de R1 de A
		MOV	R1, A			;Atualiza R1 com o valor que TH1 deve ter

		;Vamos atualizar os valores de TH0 e TL0 e redisparar o contador
		MOV	TH0, R0
		MOV	TL0, R1
		SETB	TR0
		RETI

SET2:		
		CLR	EA
		CLR	P1.0			;Fecha p1.0
		SETB	EA
		RETI
		
		END

		