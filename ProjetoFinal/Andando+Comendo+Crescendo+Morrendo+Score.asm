.data
ponto: .string "SCORE:"
corpo: .word

.text

#Ideias de implementações futuras
#1)Para que a Cobra não possa tocar na borda fazemos a cada movimento uma comparação: se a cor do pixel for preto, vá para a função Morte, dessa fomra batsa fazer o corpo da cobra preto que ela morre se comer a sí mesma!
desenho:
#Arrumando os ecall
	la t0,exceptionHandling	# carrega em tp o endereço base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endereço tp
 	csrwi ustatus,1 	# seta o bit de habilitação de interrupção em ustatus (reg 0)

#################################################################
#			Desenhar Mapa				#
################################################################# 	
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
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 5
	li a1, 5
	li a2, 314
	li a3, 5
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 314
	li a1, 5
	li a2, 314
	li a3, 235
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 5
	li a1, 234
	li a2, 314
	li a3, 234
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
#segunda camada
	#primeiro reta
	li a0, 0
	li a1, 0
	li a2, 0
	li a3, 239
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#segunda reta
	li a0, 0
	li a1, 0
	li a2, 319
	li a3, 0
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#terceira reta
	li a0, 319
	li a1, 0
	li a2, 319
	li a3, 240
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#quarta reta
	li a0, 0
	li a1, 239
	li a2, 319
	li a3, 239
	li a4, 0
	li a5, 0
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
#Terceira camada
	#primeiro reta
	li a0, 1
	li a1, 1
	li a2, 1
	li a3, 238
	li a4, 0
	li a5, 0
	
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
	
	# escrevendo score ao lado da pontuação
	la a0,ponto
	li a1,200
	li a2,0
	li a3,0xFF
	li a4,0

	li a7,104
 	ecall

#########################################################################
#			Configuração inicial				#
#########################################################################

#Infos:
#1)endereço final da matriz para o quadrado 8x8 é 0xFF012338 = endereço limite que pode pintar
#2)Não utilizar os registradores s1,s2,s3,s4,s5, pois eles guardam as cores
#3)Não utilizar o registrador a6, pois ele é essencial para a movimentação e está sempre sendo utilizado para esse fim

li s1,0xFF000000 #endereço inicial da matriz (esquerda cima)
li s2,0x00000000 #registrador não utilizado no momento que pode ser utilizado para colocar outra cor
li s3,0x00000000 #cor da cobra: preto
li s4,0x38383838 #cor do fundo: verde
li s5,0x07070707 #cor da maça: vermelho
li a6,0xFF0096A0 #endereço do ponto central do mapa = inicio da cobra

#################################################################################
#		Coloca cobra inicial no vetor corpo				#
#################################################################################

li t2,3 #tamanho de quadrados que a cobra vai ter ao começar

#Infos:
#1)Esse vetor contem os endereços iniciais da cobra
#2)Primeiro elemento do vetor corpo é o tamanho da cobra
#3)Segundo elemento do vetor corpo é o rabo da cobra
#4)A cabeça é o ultimo elemento do vetor

la s0,corpo #s0 = endereço do vetor corpo
sw t2,0(s0) #t2 = tamanho da cobra
li t6,0	    #contador
#alocando os N primeiros quadrados da cobra no vetor corpo
inicial:    
sw a6,4(s0)
addi s0,s0,4
addi a6,a6,8
addi t6,t6,1
blt t6,t2,inicial

#################################################################
#			Desenha cobra 				#
#################################################################

#Infos:
#1)Os quadrados sao feitos em camadas: de cima para baixo
#2)Desenha-se 1 quadrado por vez da esquerda para a direita
#3)No final a posição de a6 é atualizada para cima esquerda

li t1,0 
li t3,0 	 #contator para fazer N quadrados 8x8
li t6,0 	 #contator para fazer 1 quadrado 8x8
li a6,0xFF0096A0 #atualizando endereço do inicio

cobra:
li t1,2560 	 #t1 = (320x8) = 8 camadas
sw s3,0(a6)
sw s3,4(a6)
addi a6,a6,320
addi t6,t6,320
blt t6,t1,cobra
addi a6,a6,-1000 #atualizando o valor de a6
addi a6,a6,-1552 #atualizando o valor de a6
addi t3,t3,1
li t6,0
blt t3,t2,cobra

#################################################################
#		Sorteia local da maça 				#
#################################################################

#Infos:
#1)O local está sendo sorteado de forma que a maça sempre fique alinhada com a cobra
#2)Está sendo sorteado 2 valores: 1 que corresponde a linha e outro a coluna
#3)A linha tem que ser no máximo 30, pois 240/8 = 30 (quadrado 8x8), mas como tem as bodas 30 - 2 = 28
#4)A coluna tem que ser no máximo 320, pois o bitmap possui 320 de comprimento, mas como tem as bordas 320 - 16 = 304
#5)A coluna deve ser múltiplo de 8
#6)O cálculo feito é: endereço_inicial + [(320*8)*linha + coluna]

la s0,corpo #botando em s0 o inicio do meu vetor cobra

botamaca:
li t1,0
li t2,8
li t3,0
li t5,0
li t6,2560 #320*8

sorteia:
li a7,42 	  #gera um inteiro aleatorio
li a1,28 	  #maximo numero de linhas
ecall 		  #a0 = numero da linha que a maça vai ser desenhada
mul t6,t6,a0 	  #t6 = 2560 * linha
li a1,304	  #maximo numero de colunas
ecall 		  #numero da coluna que a maça vai ser desenhada
remu t1,a0,t2     #resto da divisao por 8 do numero sorteado 
sub a0,a0,t1      #tira o resto do numero sorteado para a coluna ser divisivel por 8
add a0,a0,t6      #(2560 * linha) + coluna
add t5,s1,a0 	  #somar o valor acima com o endereço de inicio
lw t3,0(t5) 	  #pegar a cor do pixel do endereço sorteado
bne t3,s4,sorteia #se for não for verde (a mesma cor do mapa), sorteia de novo
li t6,0
jal score
jal quadrado8
jal anda

#################################################################
#			Desenha maça 				#
#################################################################

#Infos:
#1)Desenha um quadrado de 8x8 pixels no local sorteado 

quadrado8:
li t1,2560
sw s5,0(t5)
sw s5,4(t5)
addi t5,t5,320
addi t6,t6,320
blt t6,t1,quadrado8
ret
#################################################################
#			Atualiza o Score			#
#################################################################
#Infos:
#1) pegando o tamanho da cobra salvo na memoria e desenhando la em cima na tela
#2) HÁ UM BUG QUE A MAÇÃ PODE SER ESCRITA EM CIMA DO SCORE :P
#colocando o valor do tamanho da cobra no score
score:
lw a0,0(s0)
addi a0,a0,-3
li a1, 250		  # x = 250
li a2, 0		  # y = 10
li a3, 0xFF               # Cor
li a4, 0
li a7, 101 		  # imprime o valor da soma na tela 
ecall
ret

#################################################################
#			Andando 				#
#################################################################

#Infos:
#1)Primeiramente foi feita a configuração do teclado para pegar o dígito
#2)Dependendo de qual tecla for pressionada (wasd), vai para outra função para desenhar a cabeça na direção correta
#3)O rabo está sempre sendo apagado

anda:
li a2,100 #d na tabela ascii
li a3,97  #a na tabela ascii
li a4,119 #w na tabela ascii
li a5,115 #s na tabela ascii

li t1,0xFF200000	# carrega o endere?o de controle do KDMMIO
lw t0,0(t1)		# Le bit de Controle Teclado
andi t0,t0,0x0001	# mascara o bit menos significativo
beq t0,zero,anda  	# Se n?o h? tecla pressionada ent?o vai para FIM
lw t2,4(t1)  		# le o valor da tecla
sw t2,12(t1)  		# escreve a tecla pressionada no display

beq t2,a2,direita
beq t2,a3,esquerda
beq t2,a4,cima
beq t2,a5,baixo
j anda

direita:
li t6,0
li t3,0
lw t3,4(s0)	 #pegando o endereço do rebo do vetor corpo
jal comeu	 #funcao para saber se comeu
d:
li t1,2560
sw s3,0(a6)  	 #pintando a nova cabeça da cor da cobra
sw s3,4(a6)  	 #pintando a nova cabeça da cor da cobra
sw s4,0(t3)  	 #pintando o rabo da cor do fundo
sw s4,4(t3)  	 #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,d
addi a6,a6,-1000 #atualizando o valor de a6 para a nova cabeça
addi a6,a6,-1552 #atualizando o valor de a6 para a nova cabeça
jal atualiza	 #funcao para atualizar a posição da cobra no vetor corpo
j anda

esquerda:
li t6,0
addi a6,a6,-16	 #atualizando o valor de a6 para desenhar o proximo quadrado
lw t3,4(s0)	 #pegando o endereço da cobra do vetor corpo
jal comeu	 #funcao para saber se comeu
a:
li t1,2560
sw s3,0(a6)	 #pintando a nova cabeça da cor da cobra
sw s3,4(a6) 	 #pintando a nova cabeça da cor da cobra
sw s4,0(t3) 	 #pintando o rabo da cor do fundo
sw s4,4(t3) 	 #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,a
addi a6,a6,-1000 #atualizando o valor de a6 para a nova cabeça
addi a6,a6,-1552 #atualizando o valor de a6 para a nova cabeça
jal atualiza	 #funcao para atualizar a posição da cobra no vetor corpo
j anda

baixo:
li t6,0
addi a6,a6,1000  #atualizando o valor de a6 para desenhar o proximo quadrado
addi a6,a6,1552  #atualizando o valor de a6 para desenhar o proximo quadrado
lw t3,4(s0) 	 #pegando o endereço da cobra do vetor corpo
jal comeu   	 #funcao para saber se comeu
s:
li t1,2560
sw s3,0(a6)	 #pintando a nova cabeça da cor da cobra
sw s3,4(a6)	 #pintando a nova cabeça da cor da cobra
sw s4,0(t3)	 #pintando o rabo da cor do fundo
sw s4,4(t3)	 #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,s
addi a6,a6,-1000 #atualizando o valor de a6 para a nova cabeça
addi a6,a6,-1552 #atualizando o valor de a6 para a nova cabeça
jal atualiza	 #funcao para atualizar a posição da cobra no vetor corpo
j anda

cima:
li t6,0
addi a6,a6,-1000 #atualizando o valor de a6 para desenhar o proximo quadrado
addi a6,a6,-1568 #atualizando o valor de a6 para desenhar o proximo quadrado
lw t3,4(s0)	 #pegando o endereço da cobra do vetor corpo
jal comeu	 #funcao para saber se comeu
w:
li t1,2560
sw s3,0(a6)	 #pintando a nova cabeça da cor da cobra
sw s3,4(a6)	 #pintando a nova cabeça da cor da cobra
sw s4,0(t3)	 #pintando o rabo da cor do fundo
sw s4,4(t3)	 #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,w
addi a6,a6,-1000 #atualizando o valor de a6 para a nova cabeça
addi a6,a6,-1552 #atualizando o valor de a6 para a nova cabeça
jal atualiza	 #funcao para atualizar a posição da cobra no vetor corpo
j anda

#################################################################
#		Atualiza posição da cobra 			#
#################################################################

#Infos:
#1)Atualiza as posições da cobra para ficarem sempre no inicio do vetor
#2)Esquemático de como acontece a atualização: ABC -> BBC -> BCC -> BCD

atualiza:
li t1,0
li t2,4
li t3,4
li t4,0
la s0,corpo	#botando em s0 o inicio do meu vetor cobra
lw t1,0(s0) 	#tamanho da cobra
mul t1,t1,t2
add t1,t1,s0
add t3,t3,s0 	#endereço atual da primeira parte da cobra (segundo elemento do vetor corpo)
desloca:
lw t4,4(t3)
sw t4,0(t3)
addi t3,t3,4
blt t3,t1,desloca
addi t1,a6,-8
sw t1,0(t3)
ret

#########################################################
#			Comeu a maça 			#
#########################################################

#Infos:
#1)Se o proximo endereço que a cobra irá for vermelho, então cresce

comeu:
li t1,0
lw t1,0(a6)
beq t1,s5,cresce
beq t1,s3,morreu #sempre que come , veja se não faz mal:
ret

cresce:
li t1,2560
sw s3,0(a6)	#pinta nova cabeça
sw s3,4(a6)	#pinta nova cabeça
addi a6,a6,320
addi t6,t6,320
blt t6,t1,cresce
#atualizando o tamanho da cobra
li t1,0
la s0,corpo	#botando em s0 o inicio do meu vetor cobra
lw t1,0(s0)	#pega o tamanho atual da minha cobra
addi t1,t1,1	#incrementa o tamanho
sw t1,0(s0)	#coloca o novo tamanho da cobra no vetor corpo
#calculo do endereço da nova cabeça da cobra: s0 + 4*tamanho
li t2,4
li t3,0
mul t2,t2,t1	 #4*tamanho
add t2,t2,s0	 #s0 + 4*tamanho
addi a6,a6,-1000 #atualizando o valor de a6 para a nova cabeça
addi a6,a6,-1552 #atualizando o valor de a6 para a nova cabeça
addi t1,a6,-8
sw t1,0(t2) 	 #colocando o endereço da nova parte da minha cobra no final do meu vetor
j botamaca	 #colocando uma nova maça no mapa

#########################################################
#			Morreu a Cobra 			#
#########################################################
morreu:
mv a0,zero#Printa a tela de Preto
mv a1,zero
addi a0,a0,254
li a7,48
ecall
mv a0,zero
li a7,48
ecall

addi a0,a0,2000
li a7,32 #delay de 2 segundos
ecall

j desenho

fim:
li a7,10
ecall

.include "SYSTEMv17b.s"

