	#Arrumando os ecall
	la t0,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endere�o tp
 	csrwi ustatus,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)
#Pintar a tela toda de verde
	mv a0,zero	
	addi a0,a0,56
	li a7,48
	ecall
#Pintar a Borda de Preto
	#primeiro reta
	li a0, 5
	li a1, 5
	li a2, 5
	li a3, 234
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 5
	li a1, 5
	li a2, 314
	li a3, 5
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 314
	li a1, 5
	li a2, 314
	li a3, 235
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 5
	li a1, 234
	li a2, 314
	li a3, 234
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
#segunda camada
	#primeiro reta
	li a0, 0
	li a1, 0
	li a2, 0
	li a3, 239
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 0
	li a1, 0
	li a2, 319
	li a3, 0
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 319
	li a1, 0
	li a2, 319
	li a3, 240
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 0
	li a1, 239
	li a2, 319
	li a3, 239
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
#Terceira camada
	#primeiro reta
	li a0, 1
	li a1, 1
	li a2, 1
	li a3, 238
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 1
	li a1, 1
	li a2, 318
	li a3, 1
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 318
	li a1, 1
	li a2, 318
	li a3, 239
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 1
	li a1, 238
	li a2, 318
	li a3, 238
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
#Quarta camada
	#primeiro reta
	li a0, 4
	li a1, 4
	li a2, 4
	li a3, 235
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 4
	li a1, 4
	li a2, 315
	li a3, 4
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 315
	li a1, 4
	li a2, 315
	li a3, 236
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 4
	li a1, 235
	li a2, 315
	li a3, 235
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
#Quinta camada
	#primeiro reta
	li a0, 2
	li a1, 2
	li a2, 2
	li a3, 237
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 2
	li a1, 2
	li a2, 317
	li a3, 2
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 317
	li a1, 2
	li a2, 317
	li a3, 238
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 2
	li a1, 237
	li a2, 317
	li a3, 237
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
#Sexta camada
	#primeiro reta
	li a0, 3
	li a1, 3
	li a2, 3
	li a3, 236
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 3
	li a1, 3
	li a2, 316
	li a3, 3
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 316
	li a1, 3
	li a2, 316
	li a3, 237
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 3
	li a1, 236
	li a2, 316
	li a3, 236
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
#Setima camada
	#primeiro reta
	li a0, 6
	li a1, 6
	li a2, 6
	li a3, 233
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 6
	li a1, 6
	li a2, 313
	li a3, 6
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 313
	li a1, 6
	li a2, 313
	li a3, 234
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 6
	li a1, 233
	li a2, 313
	li a3, 233
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
#Oitava camada
	#primeiro reta
	li a0, 7
	li a1, 7
	li a2, 7
	li a3, 232
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 7
	li a1, 7
	li a2, 312
	li a3, 7
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 312
	li a1, 7
	li a2, 312
	li a3, 233
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 7
	li a1, 232
	li a2, 312
	li a3, 232
	li a4, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
	
#Para que a Cobra n�o possa tocar na borda fazemos a cada movimento uma compara��o: se a cor do pixel for preto, v� para a fun��o Morte, dessa fomra batsa fazer o corpo da cobra preto que ela morre se comer a s� mesma!

fim:
li a7,10
ecall

.include "SYSTEMv17b.s"
