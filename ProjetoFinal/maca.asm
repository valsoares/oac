#cores decodificadas com o blue: http://manderc.com/apps/karograph/help/colors_en.php

li s1,0xFF000000 #endereço inicial da matriz (esquerda cima)
li s2,0xFF012BFF #endereço inicial da maça - final da matriz
li s3,0x07 #cor vermelha
li s4,0x11 #verde

comeu:
#codigo para crescer a cobra
#j sorteia



sorteia:
li a7,42 #gera um inteiro aleatorio
li a1,76799 #limite superior da escolha do inteiro aleatorio (320x240 = 76800 - 1 = 76799 pq começa do zero)
ecall #valor sorteado vai para o a0
add t1,s1,a0 #somar o valor sorteado com o endereço de inicio
lb t2,0(t1) #pegar a cor do pixel do endereço sorteado
beq t2,s4,sorteia #se for verde (a mesma cor da cobra), sorteia de novo
sb s3,0(t1) #coloca a cor vermelha no pixel sorteado
#ret

li a7,10
ecall
