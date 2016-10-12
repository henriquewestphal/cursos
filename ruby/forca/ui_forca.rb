def boas_vindas
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "@@@    Benvindo!! @@@"
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "Jogo da forca!\n\n"
	puts "qual é o seu nome?"
	#strip é pra cortar os  espaços
	#upcase é para colocar sempre em maiusculo
	nome = gets.strip.upcase
	puts "Muito prazer, #{nome}"
	puts "\nvamos começar o jogo!!\n\n\n"
	nome

end

def nao_quero_jogar?
	puts "deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

def cabecalho_tentativas(chutes, erros, mascara)
  puts "\n\n\n"
	puts "quantos erros até agora #{erros}"
	puts "chutes até agora: #{chutes}"
  puts mascara
end

def pede_um_chute
	puts "entre com uma letra ou uma palavra"
	chute = gets.strip
	puts "voce chutou: #{chute}."
	chute
end
