.data
corpo: .word
ponto: .string "SCORE:"
.text
#Arrumando os ecall
	la t0,exceptionHandling	# carrega em tp o endereço base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endereço tp
 	csrwi ustatus,1 	# seta o bit de habilitação de interrupção em ustatus (reg 0)

# escrevendo score ao lado da pontuação
la a0,ponto
li a1,200
li a2,0
li a3,0xFF
li a4,0

li a7,104
ecall

#Setando o vetor da cobra
li t4, 100 	
la s0,corpo
li t2, 3
sw t2, 0(s0) #Por algum motivo se eu colocar um li a7, 104 aqui em baixo ele buga

#colocando o valor do tamanho da cobra no score
LOOP:
lw a0,0(s0)
addi a0,a0,-3
li a1, 250		  # x = 250
li a2, 0		  # y = 0
li a3, 0xFF               # Cor
li a4, 0

li a7, 101 		  # imprime o valor da soma na tela 
ecall

#dormir por 1 segundo
li a0, 10

li a7, 32
ecall

# incremento para o loop
addi t2,t2,1
sw, t2,0(s0)
blt t2,t4,LOOP

fim: 
li a7,10
ecall
.include "SYSTEMv17b.s"
