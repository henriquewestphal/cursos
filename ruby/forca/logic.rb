require_relative "ui_forca"

def pede_um_chute_valido (chutes, erros, mascara)
	cabecalho_tentativas chutes, erros, mascara
	loop do
			chute = pede_um_chute
			#include é para verificar se o chute ja esta dentro do chutes
			if chutes.include? chute
				puts "voce ja chutou #{chute}"
				#next é pra retornar ao while mais proximo
			else
				return chute
			end
	end
end

def escolhe_palavra_secreta
	puts "Escolhendo a palavra secreta"
	texto = File.read("dicionario.txt")
	todas_as_palavras = texto.split "\n"
	numero_escolhido = rand(todas_as_palavras.size)
	palavra_secreta = todas_as_palavras[numero_escolhido]
	puts "palavra secreta com #{palavra_secreta.size} letras, escolhida, Boa Sorte"
	palavra_secreta
end



def palavra_mascarada(chutes, palavra_secreta)
	mascara = ""
	for letra in palavra_secreta.chars
		if chutes.include? letra
			 mascara << letra
		else
			mascara << "-"
		end
	end
	mascara
end

def salva_rank(nome, pontos_totais)
 conteudo = "#{nome}\n#{pontos_totais}"
 File.write "rank.txt", conteudo
end

def le_rank
	conteudo = File.read "rank.txt"
	conteudo.split "\n"
end
def joga(nome)
	palavra_secreta = escolhe_palavra_secreta

	erros = 0
	chutes = []
	pontos_ate_agora = 0

	while erros < 10
		mascara = palavra_mascarada chutes, palavra_secreta
		chute = pede_um_chute_valido chutes, erros, mascara
		chutes << chute

		chutou_uma_letra = chute.size == 1
		if chutou_uma_letra
			letra_procurada = chute [0]
			#cont conta quantas vezes a letra_procurada esta dentro da palavra_secreta
			total_encontrado = palavra_secreta.count letra_procurada

				if total_encontrado == 0
					puts "letra nao encontrada."
					erros += 1
				else
					puts "letra encontrada #{total_encontrado} vezes."
				end

		else
			acertou = chute == palavra_secreta
			if acertou
				avisa_acertou_palavra
				pontos_ate_agora +=100
				break
			end
				puts "Infelizmente você errou"
				pontos_ate_agora -= 30
				erros += 1
		end
	end
	pontos_ate_agora
end
