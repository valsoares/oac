.data
corpo: .word

.text
#Arrumando os ecall
	la t0,exceptionHandling	# carrega em tp o endere�o base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endere�o tp
 	csrwi ustatus,1 	# seta o bit de habilita��o de interrup��o em ustatus (reg 0)

li t4, 100 	
la s0,corpo
li t2, 3
sw t2, 0(s0)
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
li a0, 1000
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