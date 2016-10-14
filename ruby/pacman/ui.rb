def boas_vindas
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "@@@    Benvindo!! @@@"
	puts "@@@@@@@@@@@@@@@@@@@@@"
	puts "Jogo do PACMAN!\n\n"
	puts "qual é o seu nome?"
	#strip é pra cortar os  espaços
	#upcase é para colocar sempre em maiusculo
	nome = gets.strip.upcase
	puts "\nVamos começar o jogo!! #{nome}"
	nome
end

def desenha_mapa mapa
  puts mapa

end

def pede_movimento
  puts "para onde deseja ir?"
  movimento = gets.strip
end
