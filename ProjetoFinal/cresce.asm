.data
tecla: .string

.text


#Desenhar Cobra
li s1,0xFF000000 #endere�o inicial da matriz (esquerda cima)
li s2,0xFF012338 #endere�o final da matriz para o quadrado8 (tem que adaptar dependendo do tamanho do quadrado)
li s3,0xFFFFFFFF #branco
li a0,0xFF0096A0 # endere�o do ponto central do mapa 
li t6,0

li a2,1
li a3,2
li a4,3
li a5,4

li t2,3
li t1,0
li t3,0

COBRA:
li t1,2560
sw s3,0(a0)
sw s3,4(a0)
addi a0,a0,320
addi t6,t6,320
blt t6,t1,COBRA
addi a0,a0,-1000
addi a0,a0,-1552
addi t3,t3,1
li t6,0
blt t3,t2,COBRA

#Crescendo
li t3, 3 #direita=1,esquerda=2.cima=3.baixo=4

cresce:
beq t3,a2,direita
beq t3,a3,esquerda
beq t3,a4,cima
beq t3,a5,baixo

direita:
li t6,0
d:
li t1,2560
sw s3,0(a0)
sw s3,4(a0)
addi a0,a0,320
addi t6,t6,320
blt t6,t1,d
bge t6,t1,fim

esquerda:
li t6,0
addi a0,a0,-8
a:
li t1,2560
sw s3,0(a0)
sw s3,4(a0)
addi a0,a0,320
addi t6,t6,320
blt t6,t1,a
bge t6,t1,fim

baixo: 
li t6,0
addi a0,a0,1000
addi a0,a0,1552
s:
li t1,2560
sw s3,0(a0)
sw s3,4(a0)
addi a0,a0,320
addi t6,t6,320
blt t6,t1,s
bge t6,t1,fim

cima:
li t6,0
addi a0,a0,-1000
addi a0,a0,-1568
w:
li t1,2560
sw s3,0(a0)
sw s3,4(a0)
addi a0,a0,320
addi t6,t6,320
blt t6,t1,w
bge t6,t1,fim

fim:
li a7,10
ecall

