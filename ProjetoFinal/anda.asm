.data

corpo: .word

.text

#Arrumando os ecall
la t0,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
csrw t0,utvec 		# seta utvec para o endere�o tp
csrwi ustatus,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)



li s1,0xFF000000 #endere�o inicial da matriz (esquerda cima)
li s2,0xFF012338 #endere�o final da matriz para o quadrado8 (tem que adaptar dependendo do tamanho do quadrado)
li s3,0xFFFFFFFF #cor da cobra
li s4,0x00000000 #cor do fundo
li a6,0xFF0096A0 # endere�o do ponto central do mapa

li t2,3 #tamanho de quadrados que a cobra vai ter ao começar

#colocar minha cobra inicial no vetor
la s0,corpo #peguei o endereço do vetor onde vou guardar as coordenadas da cobra
sw t2,0(s0) #primeiro elemento do vetor é o tamanho da cobra
li t6,0	    #contador
inicial: #segundo elemento do vetor corpo - rabo da cobra
sw a6,4(s0)
addi s0,s0,4
addi a6,a6,8
addi t6,t6,1
blt t6,t2,inicial

#Desenhar Cobra
li t6,0 #contator para fazer 1 quadrado 8x8
li t1,0 #inicializando t1
li t3,0 #contator para fazer N quadrados 8x8
li a6,0xFF0096A0 #atualizando endereço do inicio

COBRA:
li t1,2560 #t1 = (320x8) = 8 camadas
sw s3,0(a6)
sw s3,4(a6)
addi a6,a6,320
addi t6,t6,320
blt t6,t1,COBRA
addi a6,a6,-1000
addi a6,a6,-1552
addi t3,t3,1
li t6,0
blt t3,t2,COBRA

la s0,corpo #botando em s0 o inicio do meu vetor cobra

#Andando

li a2,100 #d na tabela ascii
li a3,97  #a na tabela ascii
li a4,119 #w na tabela ascii
li a5,115 #s na tabela ascii

anda:
li t1,0xFF200000		# carrega o endere�o de controle do KDMMIO
lw t0,0(t1)			# Le bit de Controle Teclado
andi t0,t0,0x0001		# mascara o bit menos significativo
beq t0,zero,anda  	   	# Se n�o h� tecla pressionada ent�o vai para FIM
lw t2,4(t1)  			# le o valor da tecla tecla
sw t2,12(t1)  			# escreve a tecla pressionada no display

beq t2,a2,direita
beq t2,a3,esquerda
beq t2,a4,cima
beq t2,a5,baixo
j anda

direita:
li t6,0
li t3,0
lw t3,4(s0) #pegando o endereço da cobra do vetor corpo
d:
li t1,2560
sw s3,0(a6) #pintando a nova cabeça da cor da cobra
sw s3,4(a6) #pintando a nova cabeça da cor da cobra
sw s4,0(t3) #pintando o rabo da cor do fundo
sw s4,4(t3) #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,d
addi a6,a6,-1000
addi a6,a6,-1552
jal atualiza
j anda

esquerda:
li t6,0
addi a6,a6,-16
lw t3,4(s0) #pegando o endereço da cobra do vetor corpo
a:
li t1,2560
sw s3,0(a6) #pintando a nova cabeça da cor da cobra
sw s3,4(a6) #pintando a nova cabeça da cor da cobra
sw s4,0(t3) #pintando o rabo da cor do fundo
sw s4,4(t3) #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,a
addi a6,a6,-1000
addi a6,a6,-1552
jal atualiza
j anda

baixo:
li t6,0
addi a6,a6,1000
addi a6,a6,1552
lw t3,4(s0) #pegando o endereço da cobra do vetor corpo
s:
li t1,2560
sw s3,0(a6) #pintando a nova cabeça da cor da cobra
sw s3,4(a6) #pintando a nova cabeça da cor da cobra
sw s4,0(t3) #pintando o rabo da cor do fundo
sw s4,4(t3) #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,s
addi a6,a6,-1000
addi a6,a6,-1552
jal atualiza
j anda

cima:
li t6,0
addi a6,a6,-1000
addi a6,a6,-1568
lw t3,4(s0) #pegando o endereço da cobra do vetor corpo
w:
li t1,2560
sw s3,0(a6) #pintando a nova cabeça da cor da cobra
sw s3,4(a6) #pintando a nova cabeça da cor da cobra
sw s4,0(t3) #pintando o rabo da cor do fundo
sw s4,4(t3) #pintando o rabo da cor do fundo
addi a6,a6,320
addi t3,t3,320
addi t6,t6,320
blt t6,t1,w
addi a6,a6,-1000
addi a6,a6,-1552
sw s4,4(s0) #pintando o rabo da cor do fundo
jal atualiza
j anda

#Atualiza as posições da cobra para ficarem sempre no inicio do vetor
atualiza:
li t1,0
li t2,4
li t3,4
li t4,0
la s0,corpo #botando em s0 o inicio do meu vetor cobra
lw t1,0(s0) #tamanho da cobra
mul t1,t1,t2
add t1,t1,s0
add t3,t3,s0 #endereço atual da primeira parte da cobra (segundo elemento do vetor corpo)
desloca:
lw t4,4(t3)
sw t4,0(t3)
addi t3,t3,4
blt t3,t1,desloca
addi t1,a6,-8
sw t1,0(t3)
ret

fim:
li a7,10
ecall

.include "SYSTEMv17b.s"
