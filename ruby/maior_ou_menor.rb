def boas_vindas
	puts  "Jogo da adivinhação!\n\n"
	puts "qual é o seu nome?"
	nome = gets
	puts "muito prazer, " + nome
	puts "\nvamos começar o jogo\n\n\n"
end

def escolhendo_numero_secreto
	puts "escolhendo um numero secreto  de 0 a 200"
	numero_escolhido = 20
	puts "escolhido\n\n\n"	
	numero_escolhido
end

def pede_um_numero (tentativas, numero_tentativas)

	puts "tentariva:  " + tentativas.to_s + " de  " + numero_tentativas.to_s
	puts "\n\n\n\ntente adivinhar o numero escolhido?"
	chute = gets
	puts "\nvoce chutou, " + chute
	chute.to_i
end

def verifica_se_acertou (numero_secreto, chute)
	acertou = numero_secreto == chute

	if acertou
	 	puts "Parabens!! Voce acertou"
	 	return true
	end

	puts "Infelizmente voce errou"
	if numero_secreto > chute
	 	puts "\n\no numeor segreto é maior\n\n"
	else
		puts  "\n\no numero segreto é menor\n\n"
	end  
	false
end

boas_vindas
numero_secreto = escolhendo_numero_secreto

numero_tentativas = 3
for tentativas in 1..numero_tentativas
	
	chute = pede_um_numero tentativas, numero_tentativas
	break if verifica_se_acertou numero_secreto, chute
end
