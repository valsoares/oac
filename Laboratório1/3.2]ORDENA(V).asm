.eqv N 20

.data
coordenadas: .word

.text
li a2,N
la t2,coordenadas #peguei o endereÃ§o do vetor onde vou guardar as words coordenadas
sw a2,0(t2) #primeiro elemento Ã© o nÃºmero de elementos no vetor coordenadas

#CODIGO DA VAL

sorteia:
li a7,42 #gera um inteiro aleatorio
li a1,319 #limite superior da escolha do inteiro aleatorio de x
ecall #fez o random do x em a0. Ex: 0x00004444
slli t1,a0,16 #levar o numero para os 4 primeiros numeros de uma word. Ex: 0x44440000

li a1,239 #limite superior da escolha do inteiro aleatorio de y
ecall #fez o random do y em a0. Ex: 0x00005555
or a0,a0,t1 #operaÃ§Ã£o or(x+y) em a0. Ex: 0x44445555
sw a0,4(t2) #armazenamento da coordenada em uma word
addi t2,t2,4 #incrementa 4 em t2 para o armazenamento da proxima word
addi t0,t0,1 #incrementa contador de numeros sorteados
blt t0,a2,sorteia #t0 Ã© o contador de numeros sorteados: if(t0<N) 

#CODIGO XANDINHO

li t5, 4 #alocando um numero em t5
mul a3,a2,t5 #multiplicamos o Nx4
sub t2,t2,a3 #  voltando ao inicio do vetor de tamanho N ( t4 = Nx4)
mv t0,zero
mv t6,t2
#Codigo que faz a serapação de x e y no vetor principal
VECTOR:
lw t1,4(t2) #primeira coordenada
li t3, 0xFFFF0000 #mascara do x
li t4, 0x0000FFFF #mascara do y
and t3,t3,t1 #t3 com valor de x1
srli t3,t3,16 
sw t3,256(t6) #salvar x na memoria para mais tarde!
fcvt.s.w f1,t3 #f1 com valor de x1 em float
and t4,t4,t1 #t4 com valor de y1
sw t4,260(t6) #salvar y na memoria para mais tarde
fcvt.s.w f2,t4 #f2 com valor de y1 em float
#Código que faz o calculo do modulo
fmul.s f1,f1,f1
fmul.s f2,f2,f2
fadd.s f3,f2,f1
fsqrt.s f4,f3 # Colocamos o valor do módulo em f4
addi s0,t2,96 # Valor para o vetor de modulos
fsw f4,0(s0)
addi t2,t2,4
addi t6,t6,8
addi t0,t0,1
blt t0,a2,VECTOR
addi a4,a2,-1 #Calcula o valor de N-1
mul a3,a4,t5 #multiplicamos o (N-1)x4
sub s0,s0,a3 #  voltando ao inicio do vetor de tamanho (N-1)[o primeiro não tem mais!] ( t4 = (N-1)x4)
##Codigo que faz a ordenação do vetor de módulos

MAIN:	mv a0,s0 #mudei aqui para ir para nosso inicio do VETOR DE MODULOS ( cuidado para não enviar a word mas o endereço)
	li a1,N
	jal SHOW

	mv a0,s0 #aqui tambem
	li a1,N
	
	jal SORT # procedimento que se quer medir o tempo
	
	mv a0,s0 #aqui mais uma vez...
	li a1,N
	jal SHOW

	li a7,10
	ecall


SWAP:	slli t1,a1,2
	li t6,2
	mul t6,t1,t6
	add t1,a0,t1
	addi t6,t6,160
	add t6,a0,t6
	lw t0,0(t1) #carrega o modulo da primeira coordenada
	lw t2,4(t1) # carrega o modulo da segunda coordenada
	sw t2,0(t1) #salva o modulo da segunda coordenada no primeiro espaço
	sw t0,4(t1) #salva o modulo da primeira coordenada no segundo espaço
	lw t0,0(t6) # carrega o x0
	lw t2,8(t6) # carrega o x1
	sw t2,0(t6) # salva o x1 no local do x0
	sw t0,8(t6) # salva o x0 no local do x1
	lw t0,4(t6) # carrega o y0
	lw t2,12(t6) # carrega o y1
	sw t2,4(t6) # salva o y1 no local do 0
	sw t0,12(t6) # salva o y0 no local do y1
	ret

SORT:	addi sp,sp,-20
	sw ra,16(sp)
	sw s3,12(sp)
	sw s2,8(sp)
	sw s1,4(sp)
	sw s0,0(sp)
	mv s2,a0
	mv s3,a1
	mv s0,zero
for1:	bge s0,s3,exit1
	addi s1,s0,-1
for2:	blt s1,zero,exit2
	slli t1,s1,2
	add t2,s2,t1
	lw t3,0(t2)
	lw t4,4(t2)
	bge t4,t3,exit2
	mv a0,s2
	mv a1,s1
	jal SWAP
	addi s1,s1,-1
	j for2
exit2:	addi s0,s0,1
	j for1
exit1: 	lw s0,0(sp)
	lw s1,4(sp)
	lw s2,8(sp)
	lw s3,12(sp)
	lw ra,16(sp)
	addi sp,sp,20
	ret

SHOW:	mv t0,a0
	mv t1,a1
	mv t2,zero

loop1: 	beq t2,t1,fim1
	li a7,2 #alterei aqui para li a7, 2 que é imprimir FLOAT
	flw fa0,0(t0) # coloquei aqui para float
	ecall
	li a7,11
	li a0,9
	ecall
	addi t0,t0,4
	addi t2,t2,1
	j loop1

fim1:	li a7,11
	li a0,10
	ecall
	ret

fim:
li a7,10
ecall #exit
