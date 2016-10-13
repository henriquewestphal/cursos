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

def avisa_acertou_palavra
        puts "\nParabéns, você ganhou!"
        puts

        puts "       ___________      "
        puts "      '._==_==_=_.'     "
        puts "      .-\\:      /-.    "
        puts "     | (|:.     |) |    "
        puts "      '-|:.     |-'     "
        puts "        \\::.    /      "
        puts "         '::. .'        "
        puts "           ) (          "
        puts "         _.' '._        "
        puts "        '-------'       "
        puts
end



def desenha_forca(erros)
    cabeca = "   "
    corpo = " "
    pernas = "   "
    bracos = "   "
    if erros >= 1
        cabeca = "(--)"
    end
    if erros >= 2
        bracos = " || "
		end
		if erros >= 3
        corpo = "||"
    end
    if erros >= 4
        bracos = "/|| "
    end
    if erros >= 5
        bracos = "/||\\"
    end
		if erros >= 6
			pernas = "   / "
		end
		if erros >= 7
			pernas = "   /\\"
		end

    puts "  _______       "
    puts " |/      |      "
    puts " |      #{cabeca}  "
    puts " |      #{bracos}  "
    puts " |       #{corpo}  "
    puts " |    #{pernas}  "
    puts " |              "
    puts "_|___           "
    puts

end

def avisa_pontos_totais(pontos_totais)
	puts "voce possui #{pontos_totais}"
end

def avisa_campeao_atual(dados)
	puts "nosso campeao atual é #{dados[0]} com #{dados[1]} pontos"

end

def nao_quero_jogar?
	puts "deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

def cabecalho_tentativas(chutes, erros, mascara)
  puts "\n\n\n"
	desenha_forca erros
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
