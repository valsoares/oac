.eqv N 3
.eqv A 7

.data
coordenadas: .word

.text
li a2,N
la t2,coordenadas #peguei o endereÃ§o do vetor onde vou guardar as words coordenadas
sw a2,0(t2) #primeiro elemento Ã© o nÃºmero de elementos no vetor coordenadas
li a3,A
sw a3,512(t2)

REPETE:
#zera todos os registradores para nao dar ruim
mv a0,zero
mv a1,zero
mv a2,zero
mv a3,zero
mv a4,zero
mv a5,zero
mv a6,zero
mv a7,zero
mv s0,zero
mv s1,zero
mv s2,zero
mv s3,zero
mv s4,zero
mv s5,zero
mv s6,zero
mv s7,zero
mv s8,zero
mv s9,zero
mv t0,zero
mv t1,zero
mv t2,zero
mv t3,zero
mv t4,zero
mv t5,zero
mv t6,zero


la t2, coordenadas
lw a2,0(t2)

#SORTEIA(N)

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

#Os vetores sorteados estão salvos na memoria 10010000 

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
	la a1, coordenadas
	lw a1,0(a1)
	jal SHOW

	mv a0,s0 #aqui tambem
	la a1, coordenadas
	lw a1,0(a1)
	
	jal SORT # procedimento que se quer medir o tempo
	
	mv a0,s0 #aqui mais uma vez...
	la a1, coordenadas
	lw a1,0(a1)
	jal SHOW
	jal POLIGONO
	


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

	#Os Vetore Ordenados estão salvos em:
		#Vetor de Coordenadas desordenas: 10010000
		#Vetor de Módulos Ordenados: 10010060
		#Vetor de Coordenadas SEPARADAS EM X e Y, ORDENADOS em relação aos MODULOS : 10010100
	#CODIGO KAKOMO
	
POLIGONO:#função que coloca V(coordenadas x e y) e A(cor)
 	la t0,exceptionHandling	# carrega em tp o endereço base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endereço tp
 	csrwi ustatus,1 	# seta o bit de habilitação de interrupção em ustatus (reg 0)
 	
#Preciso manter os registradores a1-->a5 vazios para colocar as funções

	la t2,coordenadas # pegando endereço do Vetor de coordenadas aleatorias
	addi t2,t2,256 # Colocando o endereço do Vetor de Coordenadas x e y ORDENADAS
	la a4, coordenadas
	lw a4,512(a4) #salvando cor em 10010200
	# lw t3,0(coordenadas) #pegar o valor de N lá na memória, primeiro vetora da coordenadas
	la t3, coordenadas
	lw t3,0(t3) # numero de pontos
	addi t3,t3,-1	# (N-1), é o numero de retas que devem ser feitass	
	mv t4,zero  #zerando t4 para que o loop nao pegar lixo
LINHA: 	
	lw s0,0(t2) #colocando em um registrador o valor do primeiro x
	mv a0,s0 #pega o valor de x0 e poe em a0
	lw s0,4(t2)
	mv a1,s0 #pega o valor de y0 e poe em a1
	lw s0,8(t2)
	mv a2,s0 #pega o valor de x1 e poe em a2
	lw s0,12(t2)
	mv a3,s0 #pega o valor de y1 e poe em a3
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall		

	addi t4,t4,1
	addi t2,t2,8 #para que a primeira coordenada tenha uma linha para a segunda coordenada
	blt t4,t3,LINHA # aqui da muito problema com t3 diferente de N
ULTIMALINHA:
	lw s0,0(t2) #colocando em um registrador o valor do primeiro x
	mv a0,s0 #pega o valor de x0 e poe em a0
	lw s0,4(t2)
	mv a1,s0 #pega o valor de y0 e poe em a1
	la t2,coordenadas # pegando endereço do Vetor de coordenadas aleatorias
	addi t2,t2,256 # Colocando o endereço do Vetor de Coordenadas x e y ORDENADAS
	lw s0,0(t2) #colocando em um registrador o valor do primeiro x
	mv a2,s0 #pega o valor de x1 e poe em a0
	lw s0,4(t2)
	mv a3,s0 #pega o valor de y1 e poe em a1
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
PROXIMOPROGRAMA:
	la t0, coordenadas
	lw t1,0(t0)
	addi t1,t1,1 #incrementando N
	sw t1,0(t0) #salvando o novo N
	li t2,21 # variavel para controle
	lw t3,512(t0) #carregando a cor
	addi t3,t3,10 #mundando a cor
	sw t3,512(t0) #salvando a cor
	beq t1,t2,final
LIMPATELA:
	mv a0,zero
	mv a1,zero
	addi a0,a0,255
	li a7,48
	ecall
	mv a0,zero
	li a7,48
	ecall
	jal REPETE
	
	
final:	
	li a7,10
	ecall #exit

.include "SYSTEMv17b.s"

