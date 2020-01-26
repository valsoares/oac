	#Arrumando os ecall
	la t0,exceptionHandling	# carrega em tp o endereço base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endereço tp
 	csrwi ustatus,1 	# seta o bit de habilitação de interrupção em ustatus (reg 0)
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
	li a3, 234
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
	li a3, 239
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
	li a3, 238
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
	li a3, 235
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
	
#Para que a Cobra não possa tocar na borda fazemos a cada movimento uma comparação: se a cor do pixel for preto, vá para a função Morte, dessa fomra batsa fazer o corpo da cobra preto que ela morre se comer a sí mesma!

#Codigo da Val
#cores decodificadas com o blue: http://manderc.com/apps/karograph/help/colors_en.php

li s1,0xFF000000 #endereço inicial da matriz (esquerda cima)
li s2,0xFF012BFF #endereço inicial da maça - final da matriz
li s3,0x07 #cor vermelha
li s4,0x00 #preto

comeu:
#codigo para crescer a cobra
#j sorteia



sorteia:
li a7,42 #gera um inteiro aleatorio
li a1,76799 #limite superior da escolha do inteiro aleatorio (320x240 = 76800 - 1 = 76799 pq começa do zero)
ecall #valor sorteado vai para o a0
add t1,s1,a0 #somar o valor sorteado com o endereço de inicio
lb t2,0(t1) #pegar a cor do pixel do endereço sorteado
beq t2,s4,sorteia #se for preto (a mesma cor da cobra e da borda), sorteia de novo
sb s3,0(t1) #coloca a cor vermelha no pixel sorteado
sb s3,1(t1) #pinta o pixel a frente do sorteado
sb s3,320(t1) #pinta o pixel a baixo do sorteado
sb s3,321(t1) #pinta o pixel a baixo e a frente do sorteado	
#ret

#Finaliza
li a7, 10
ecall

.include "SYSTEMv17b.s"
