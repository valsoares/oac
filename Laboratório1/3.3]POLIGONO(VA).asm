.eqv A 7
.data  
V:  .word 5,5,5,234,314,234,314,5,20,5,20,219,299,219,299,20,40,20,40,199,279,199,279,40,60,40,60,179,259,179

.text
 	la t0,exceptionHandling	# carrega em tp o endereço base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endereço tp
 	csrwi ustatus,1 	# seta o bit de habilitação de interrupção em ustatus (reg 0)
 	
#Preciso manter os registradores a1-->a5 vazios para colocar as funções
POLIGONO:#função que coloca V(coordenadas x e y) e A(cor)
	la t2,V # pegando endereço do Vetor V
	li a4,A #pegando a COR 
	# lw t3,0(coordenadas) #pegar o valor de N lá na memória, primeiro vetora da coordenadas
	li t3,14 # (N/2) -1, é o numero de retas que devem ser feitass	
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
	bne t4,t3,LINHA
	li a7, 10 #chamada de saida, para não dar tela azul!
	ecall
	
.include "SYSTEMv17b.s"
