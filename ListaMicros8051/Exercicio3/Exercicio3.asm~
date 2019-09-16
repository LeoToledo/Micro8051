		ORG	0
		LJMP	PROG

		ORG	000BH
		LJMP	SET1

PROG:		
		MOV	R0, #100d		;Contará 100 vezes para fazer durar 5s
		SETB	EA			;Habilita o uso de interrupções
		SETB	ET0			;Habilita o uso do timer 0
		MOV	TMOD, #00000001		;Timer 0 no modo 1, disparo por software

		;Para setar o tempo do temporizador, sabemos que o timer 1 tem 16 bits -> (2^16)d
		;Queremos um atraso de 0,05s = 50000us. Cada us tem o tempo de 1 ciclo de máquina
		;Para tal, fazemos 2^16 = 65536 - 50000 = 15536d
		;Convertendo para hex, temos 3CAF
		;Para modo 1, a primeira parte vai para TH0 e a segunda parte vai para TL0
		MOV	TH0, #3CH
		MOV	TL0, #0AFH
		
		SETB	TR0			;Dispara o timer 0
FINAL:		SJMP	 FINAL

SET1:		
		CLR EA				;Impede a interrupção das interrupções
		
		DJNZ	R0, CONTINUA
TERMINA:	LJMP	FINAL
CONTINUA:	
		MOV	TH0, #3CH
		MOV	TL0, #0AFH 
		SETB EA				;Reabilita o uso de interrupções
		RETI 

		END