.eqv N 5

.data
coordenadas: .word

.text
li a2,N
la t1,coordenadas #peguei o endereço do vetor onde vou guardar as words coordenadas
sw a2,0(t1) #primeiro elemento é o número de elementos no vetor coordenadas

sorteia:
li a7,42 #gera um inteiro aleatorio
li a1,319 #limite superior da escolha do inteiro aleatorio de x
ecall #fez o random do x em a0. Ex: 0x00004444
slli t2,a0,16 #levar o numero para os 4 primeiros numeros de uma word. Ex: 0x44440000

li a1,239 #limite superior da escolha do inteiro aleatorio de y
ecall #fez o random do y em a0. Ex: 0x00005555
or a0,a0,t2 #operação or(x+y) em a0. Ex: 0x44445555
sw a0,4(t1) #armazenamento da coordenada em uma word

addi t1,t1,4 #incrementa 4 em t2 para o armazenamento da proxima word

addi t0,t0,1 #incrementa contador de numeros sorteados
blt t0,a2,sorteia #t0 é o contador de numeros sorteados: if(t0<N) 

fim:
li a7,10
ecall #exit
