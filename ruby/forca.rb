def boas_vindas
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "@@@    Benvindo!! @@@"
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "Jogo da forca!\n\n"
	puts "qual é o seu nome?"
	nome = gets.strip.upcase
	puts "Muito prazer, #{nome}"
	puts "\nvamos começar o jogo!!\n\n\n"
	nome
	
end

def escolhe_palavra_secreta
	puts "Escolhendo a palavra secreta"
	palavra_secreta = "programador"
	puts "palavra secreta com #{palavra_secreta.size} letras, escolhida, Boa Sorte"
	palavra_secreta
end

def nao_quero_jogar?
	puts "deseja jogar noevamente?"
	quero_jogar = gets.strip	
	nao_quero_jogar = quero_jogar.upcase == "N"
end

def pede_um_chute(chutes, erros)
	puts "\n\n\n\n"
	puts "quantos erros até agora #{erros}"
	puts "chutes até agora: #{chutes}"
	puts "entre com uma letra ou uma palavra"
	chute = gets.strip
	puts "voce chutou: #{chute}."
	chute	
end

def joga(nome)
	palavra_secreta = escolhe_palavra_secreta

	erros = 0
	chutes = []
	pontos_ate_agora = 0

	while erros < 5
		chute = pede_um_chute chutes, erros
		chutes << chute
		erros += 1	

		chutou_uma_letra = chute.size == 1
		if chutou_uma_letra
			
		else
			acertou = chute == palavra_secreta
			if acertou	
				puts "Parabens, voce acertou!"
				pontos_ate_agora +=100
				break
			end
				puts "Infelizmente você errou"
				pontos_ate_agora -= 30
				erros += 1
		end


	end


	puts "voce ganhous #{pontos_ate_agora} pontos."
	
end

nome = boas_vindas

loop do
	joga nome

	if nao_quero_jogar?
		break
	end
end

