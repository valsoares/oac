.eqv N 5

.data
coordenadas: .word 
multiplos: .float #vetor de coordenadas que se encaixam nos casos
ordenadohorario: .word #vetor final

.text
li a2,N
la t1,coordenadas #endereço do vetor onde vou guardar as words coordenadas
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

la t1,coordenadas

#ORDENAR AS COORDENADAS NO MESMO VETOR , assim vetor "coordenadas" vai ter as coordenadas ja ordenadas por ser mais proximo da origem

inicializa: #pega primeiro ponto para comparação (ponto mais proximo da origem)
addi t1,t1,4
lw t2,0(t1) #primeira coordenada
li t3, 0xFFFF0000 #mascara do x
li t4, 0x0000FFFF #mascara do y
and t3,t3,t2 #t3 com valor de x1
srli t3,t3,16 
fcvt.s.w f1,t3 #f1 com valor de x1 em float
and t4,t4,t2 #t4 com valor de y1
fcvt.s.w f2,t4 #f2 com valor de y1 em float


la t3,multiplos #endereço de um vetor para múltiplos pontos
la t4,ordenahorario #endereço de um vetor para os pontos ordenados
li a4,0

horario:
beq a4,a2,fim #contador para saber que ele ja comparou todos os pontos que tinham

addi t1,t1,4
lw t2,0(t1) #segunda coordenada
li t5, 0xFFFF0000 #mascara do x
li t6, 0x0000FFFF #mascara do y
and t5,t5,t1 #t5 com valor de x2
srli t5,t5,16 
fcvt.s.w f3,t5 #f3 com valor de x2 em float
and t6,t6,t2 #t6 com valor de y2
fcvt.s.w f4,t6 #f4 com valor de y2 em float 

addi a4,a4,1

primeiro: #primeiro caso
#cima e esquerda (x2<x1 e y2>y1) --- ponto atual x1 e y1
fle.s t0,f3,f1 #x2>x1 se t0 é 0
bgez t0,segundo
fle.s t0,f4,f2 #y2>y1 se t0 é 0
#bota todos x e y do primeiro caso no vetor multiplos
sw f3,0(t3)
sw f4,4(t3)
addi t3,t3,8
#coloca modulo desses pontos em um vetor
#fazer o calculo dos modulos e botar em um vetor
#ordenar o vetor dos modulos
#ver se cruza - chamar a função cruza [j cruza]
#botar o elemento o menor modulo no vetor ordenahorario
bgez t0,horario
addi t4,t4,4 

segundo: #segundo caso
#cima e direita (x2>x1 e y2>y1)
fle.s t0,f1,f3 #x2<x1 se t0 é 0
bgez t0,terceiro
fle.s t0,f4,f2 #y2>y1 se t0 é 0
#bota todos x e y do segundo caso no vetor multiplos
sw f3,0(t3)
sw f4,4(t3)
addi t3,t3,8
#coloca modulo desses pontos em um vetor
#fazer o calculo dos modulos e botar nesse vetor modulos
#ordenar o vetor dos modulos
#ver se cruza - chamar a função cruza [j cruza]
#botar o elemento o menor modulo no vetor ordenahorario
bgez t0,horario
addi t4,t4,4 

terceiro: #terceiro caso
#baixo e direita (x2>x1 e y1>y2)
fle.s t0,f1,f3 #x2<x1 se t0 é 0
bgez t0,quarto
fle.s t0,f2,f4 #y1>y2 se t0 é 0
#bota todos x e y do terceiro caso no vetor multiplos
sw f3,0(t3)
sw f4,4(t3)
addi t3,t3,8
#coloca modulo desses pontos em um vetor
#fazer o calculo dos modulos e botar nesse vetor modulos
#ordenar o vetor dos modulos
#ver se cruza - chamar a função cruza [j cruza]
#botar o elemento o menor modulo no vetor ordenahorario
bgez t0,horario
addi t4,t4,4

quarto: #quarto caso
#baixo e esquerda (x1>x2 e y2>y1)
fle.s t0,f3,f1 #x2>x1 se t0 é 0
bgez t0,primeiro
fle.s t0,f2,f4 #y1>y2 se t0 é 0
#bota todos x e y do quarto caso no vetor multiplos
sw f3,0(t3)
sw f4,4(t3)
addi t3,t3,8
#coloca modulo desses pontos em um vetor
#fazer o calculo dos modulos e botar nesse vetor modulos
#ordenar o vetor dos modulos
#ver se cruza - chamar a função cruza [j cruza]
#botar o elemento o menor modulo no vetor ordenahorario
bgez t0,horario
addi t4,t4,4

cruza:

addi sp,sp,-16 #4 lugares na pilha
jal reta
fsw f5,0(sp) #aloca b
fsw f6,4(sp) #aloca a
addi sp,sp,8
blt a3,a2,reta

#calcula igualdade p saber se as retas se cruzam se o y é igual, x = [(b2-b1)/(a1-a2)]
la t1,coordenadas
addi t1,t1,4
lw t2,0(t1) #primeira coordenada
li t3, 0xFFFF0000 #mascara do x
and t3,t3,t2 #t3 com valor de x1
srli t3,t3,16 
fcvt.s.w f1,t3 #f1 com valor de x1 em float

addi t1,t1,4
lw t2,0(t1) #segunda coordenada
li t5, 0xFFFF0000 #mascara do x
and t5,t5,t2 #t5 com valor de x2
srli t5,t5,16 
fcvt.s.w f3,t5 #f3 com valor de x2 em float

addi sp,sp,-16
flw f5,4(sp) #a1
flw f6,0(sp) #b1
flw f7,12(sp) #a2
flw f8,8(sp) #b2
addi sp,sp,16
fsub.s f8,f8,f6 #(b2-b1)
fsub.s f5,f5,f7 #(a1-a2)
fdiv.s f5,f8,f5 #x
flt.s s0,f3,f1 # se f3>f1 s0 = 0 para saber quem é maior x1 ou x2
beqz s0,checa # se s0 = 0, ou seja, x2>x1 vai pro checa para checar se x está no intervalo x2>x>x1 
#x1>x2 ----> f1>f3 igualdade tem que ser: x1>x>x2
flt.s s0,f3,f5 #s0 é 1 se x>x2 
beqz s0,naocruza #s0 é 0 x<=x2 ,ou seja, nao tem pontos em comum
fle.s s0,f1,f5 #s0 é 0 x1>x ou seja, x1>x>x2, as retas tem ponto em comum 
beqz s0,repete

checa:
#x2>x1 --> f3>f1 igualdade tem que ser: x2>x>x1 
flt.s s0,f5,f3 #s0 é 1 se x2>x
beqz s0,naocruza #s0 é 0 x2<=x ou seja, nao tem pontos em comum
fle.s s0,f5,f1 #s0 é 0 x>x1 ou seja, x2>x>x1, as retas tem ponto em comum
beqz s0,repete

naocruza:
#as retas não se cruzam - voltar para o ponto que chamou a função cruza (fazer o role da pilha pro registrador ra)

repete:
#as retas se cruzam - conectar em outro ponto



reta: 
addi t1,t1,4
lw t2,0(t1) #primeira coordenada
li t3, 0xFFFF0000 #mascara do x
li t4, 0x0000FFFF #mascara do y
and t3,t3,t2 #t3 com valor de x1
srli t3,t3,16 
fcvt.s.w f1,t3 #f1 com valor de x1 em float
and t4,t4,t2 #t4 com valor de y1
fcvt.s.w f2,t4 #f2 com valor de y1 em float

addi t1,t1,4
lw t2,0(t1) #segunda coordenada
li t5, 0xFFFF0000 #mascara do x
li t6, 0x0000FFFF #mascara do y
and t5,t5,t2 #t5 com valor de x2
srli t5,t5,16 
fcvt.s.w f3,t5 #f3 com valor de x2 em float
and t6,t6,t2 #t6 com valor de y2
fcvt.s.w f4,t6 #f4 com valor de y2 em float 

fsub.s f5,f3,f1 #xoxo
fsub.s f6,f4,f2 #yoyo
fdiv.s f6,f6,f5 #a (ax + b = y)

fmul.s f5,f6,f3
fsub.s f5,f4,f5 #b (ax + b = y)

addi a3,a3,1

ret #volta pra cruza pq é o unico lugar da função que chamou 

fim:
li a7,10
ecall

