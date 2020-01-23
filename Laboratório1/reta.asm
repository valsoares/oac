.data
coordenadas: .word 0x00000005, 0x00020005, 0x00010007, 0x00000003, 0x00040008, 0x00dd001c

.text

la t1,coordenadas
li a2,2

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

ret


naocruza:
#as retas não se cruzam


repete:
#as retas se cruzam

fim:
li a7,10
ecall
