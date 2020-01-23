.text
 	la t0,exceptionHandling	# carrega em tp o endereço base das rotinas do sistema ECALL
 	csrw t0,utvec 		# seta utvec para o endereço tp
 	csrwi ustatus,1 	# seta o bit de habilitação de interrupção em ustatus (reg 0)
C: 	
#Quantos pontos tem? (olhar a2 = numero de coordenadas, fazer uma condição em que t0 = a2 sai do loop)
	#1
	li a0,10 #x0
	li a1,70 #y0
	li a2,10 #x1
	li a3,170 #y1
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#2
	li a0,10
	li a1,70
	li a2,80
	li a3,70
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#3
	li a0,10
	li a1,170
	li a2,80
	li a3,170
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#4
	li a0,80
	li a1,70
	li a2,80
	li a3,95
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#5
	li a0,80 #x0
	li a1,170 #y0
	li a2,80 #x1
	li a3,145 #y1
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#6
	li a0,35 #x0
	li a1,95 #y0
	li a2,35 #x1
	li a3,145 #y1
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#7
	li a0,80 #x0
	li a1,95 #y0
	li a2,35 #x1
	li a3,95 #y1
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#8
	li a0,80 #x0
	li a1,145 #y0
	li a2,35 #x1
	li a3,145 #y1
	li a4,255
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
A: 	
	#1
	li a0,90 #x0
	li a1,70 #y0
	li a2,90 #x1
	li a3,170 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#2
	li a0,90
	li a1,70
	li a2,160
	li a3,70
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#3
	li a0,160
	li a1,70
	li a2,160
	li a3,170
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#4
	li a0,90
	li a1,170
	li a2,110
	li a3,170
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#5
	li a0,160 #x0
	li a1,170 #y0
	li a2,140 #x1
	li a3,170 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#6
	li a0,140 #x0
	li a1,95 #y0
	li a2,110 #x1
	li a3,95 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#7
	li a0,110 #x0
	li a1,95 #y0
	li a2,110 #x1
	li a3,170 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#8
	li a0,140 #x0
	li a1,95 #y0
	li a2,140 #x1
	li a3,170 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#9
	li a0,110 #x0
	li a1,125 #y0
	li a2,140 #x1
	li a3,125 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#10
	li a0,110 #x0
	li a1,115 #y0
	li a2,140 #x1
	li a3,115 #y1
	li a4,7
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
I: 	
	#1
	li a0,170 #x0
	li a1,105 #y0
	li a2,170 #x1
	li a3,170 #y1
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#2
	li a0,170
	li a1,105
	li a2,195
	li a3,105
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#3
	li a0,195
	li a1,105
	li a2,195
	li a3,170
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#4
	li a0,195
	li a1,170
	li a2,170
	li a3,170
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#5
	li a0,170 #x0
	li a1,70 #y0
	li a2,195 #x1
	li a3,70 #y1
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#6
	li a0,170 #x0
	li a1,70 #y0
	li a2,170 #x1
	li a3,95 #y1
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#7
	li a0,170 #x0
	li a1,95 #y0
	li a2,195 #x1
	li a3,95 #y1
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#8
	li a0,195 #x0
	li a1,70 #y0
	li a2,195 #x1
	li a3,95 #y1
	li a4,56
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
O: 	
	#1
	li a0,205 #x0
	li a1,70 #y0
	li a2,205 #x1
	li a3,170 #y1
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#2
	li a0,205
	li a1,70
	li a2,305
	li a3,70
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#3
	li a0,305
	li a1,70
	li a2,305
	li a3,170
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#4
	li a0,305
	li a1,170
	li a2,205
	li a3,170
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#5
	li a0,230 #x0
	li a1,95 #y0
	li a2,230 #x1
	li a3,145 #y1
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#6
	li a0,230 #x0
	li a1,95 #y0
	li a2,280 #x1
	li a3,95 #y1
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#7
	li a0,280 #x0
	li a1,95 #y0
	li a2,280 #x1
	li a3,145 #y1
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	#8
	li a0,280 #x0
	li a1,145 #y0
	li a2,230 #x1
	li a3,145 #y1
	li a4,192
	
	li a7, 47 #desenha na tela os valores x0=a0, y0=a1 , x1=a2 , y1=a3 , cor= a4, a5= frame 
	ecall
	
	li a7, 10 #chamada de saida, para não dar tela azul!
	ecall
	
	
.include "SYSTEMv17b.s"
