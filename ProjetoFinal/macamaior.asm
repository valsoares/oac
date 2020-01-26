
li s1,0xFF000000 #endereço inicial da matriz (esquerda cima)
#li s2,0xFF012338 #endereço final da matriz para o quadrado8 (tem que adaptar dependendo do tamanho do quadrado)
li s2,0xFF01283C #endereço final da matriz para o quadrado4
li s3,0x07070707 #cor vermelha
li s4,0x11111111 #verde

li t1,0
li t6,0
li t2,4

sorteia:
li a7,42 #gera um inteiro aleatorio
#li a1,18638 #limite superior da escolha do inteiro aleatorio para o quadrado8 (tem que adaptar dependendo do tamanho do quadrado)
li a1,18959 #limite superior da escolha do inteiro aleatorio para o quadrado4
ecall
mul a0,a0,t2 #multiplicar o valor sorteado por 4, pois uma word tem 4 bytes
add t5,s1,a0 #somar o valor multiplicado com o endereço de inicio
lw t2,0(t5) #pegar a cor do pixel do endereço sorteado
beq t2,s4,sorteia #se for verde (a mesma cor da cobra), sorteia de novo
#jal quadrado8 #coloca a cor vermelha no pixel sorteado
jal quadrado4
jal fim

quadrado8: #8x8 bytes
li t1,2560
sw s3,0(t5)
sw s3,4(t5)
addi t5,t5,320
addi t6,t6,320
blt t6,t1,quadrado8
ret

quadrado4: #4x4 bytes
li t1,1280
sw s3,0(t5)
addi t5,t5,320
addi t6,t6,320
blt t6,t1,quadrado4
ret

fim:
li a7,10
ecall
