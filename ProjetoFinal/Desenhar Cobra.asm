#Desenhar Cobra
li s1,0xFF000000 #endereço inicial da matriz (esquerda cima)
li s2,0xFF012338 #endereço final da matriz para o quadrado8 (tem que adaptar dependendo do tamanho do quadrado)
li s3,0xFFFFFFFF #preto
li t1,2560
li t6,0
li t2,4
li a0,0xFF0096A0 # endereço do ponto central do mapa 
COBRA:
sw s3,0(a0)
sw s3,4(a0)
sw s3,8(a0)
sw s3,12(a0)
sw s3,16(a0)
sw s3,20(a0)
addi a0,a0,320
addi t6,t6,320
blt t6,t1,COBRA