def boas_vindas
	puts  "\n\n         Benvindo, \n   Jogo da adivinhação!\n\n"
	puts "qual é o seu nome?"
	nome = gets.strip
	puts "muito prazer, #{nome}"
	puts "\nvamos começar o jogo\n\n\n"
end

def escolhendo_numero_secreto
	puts "escolhendo um numero secreto  de 0 a 200"
	numero_escolhido = 20
	puts "escolhido\n\n\n"	
	numero_escolhido
end

def pede_um_numero (chutes, tentativas, numero_tentativas)
	puts "tentativa: #{tentativas} de #{numero_tentativas}"
	puts "chutes até agora: #{chutes}"
	puts "\ntente adivinhar o numero escolhido?"
	chute = gets.strip
	puts "\nvoce chutou, #{chute}"
	chute.to_i
end

def verifica_se_acertou (numero_secreto, chute)
	acertou = numero_secreto == chute

	if acertou
	 	puts "Parabens!! Voce acertou"
	 	return true
	end

	puts "\n\nInfelizmente voce errou"
	if numero_secreto > chute
	 	puts "\no numeor segreto é maior\n"
	else
		puts  "\n o numero segreto é menor\n"
	end  
	false
end

boas_vindas
numero_secreto = escolhendo_numero_secreto

numero_tentativas = 5
chutes = []

for tentativas in 1..numero_tentativas
	
	chute = pede_um_numero chutes, tentativas, numero_tentativas
	chutes << chute.to_i

	break if verifica_se_acertou numero_secreto, chute
end

