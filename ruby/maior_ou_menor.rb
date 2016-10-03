def boas_vindas
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "@@@    Benvindo!! @@@"
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "Jogo da adivinhação!\n\n"
	puts "qual é o seu nome?"
	nome = gets.strip.upcase
	puts "Muito prazer, #{nome}"
	puts "\nvamos começar o jogo!!\n\n\n"
	nome
end

def escolhendo_numero_secreto (dificudade)
	case dificudade
	when 1 
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end	
	puts "escolhendo um numero secreto  de 0 a #{maximo}"
	numero_escolhido = rand(maximo)
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

def pede_dificudade
	puts "Escolha o nivel de dificudade"
	puts "sendo: (1)-muito facil, (2)-facil, (3)-medio, (4)-dificil, (5)-muito dificil"
	dificudade = gets.to_i
end

def joga (nome, dificudade)

	numero_secreto = escolhendo_numero_secreto dificudade
	pontos = 1000
	numero_tentativas = 5
	chutes = []

	for tentativas in 1..numero_tentativas
		
		chute = pede_um_numero chutes, tentativas, numero_tentativas
		chutes << chute

		if nome == "henrique"
			puts "Parabens!! Voce acertou"
			break
		end

		perde_pontos = (chute - numero_secreto).abs / 2.0
		pontos -= perde_pontos

		break if verifica_se_acertou numero_secreto, chute
	end
	puts "você ganhou: #{pontos} pontos."	

	if verifica_se_acertou = false
		puts "o numero secreto é #{numero_secreto}"
	end
	
end

def nao_quero_jogar?
	puts "Deseja jogar novamente (S/N)"
	nao_quero_jogar = gets.strip
	nao_quero_jogar.upcase  == "N"	
end



nome = boas_vindas
loop do
	dificudade = pede_dificudade 
	joga nome, dificudade

	break if nao_quero_jogar?
	end
	
end