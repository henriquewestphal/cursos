require_relative "logic"


nome = boas_vindas
pontos_totais = 0
avisa_campeao_atual le_rank
loop do
	joga nome
	pontos_totais += joga nome
	avisa_pontos_totais pontos_totais
		if le_rank[1].to_i < pontos_totais
			salva_rank nome, pontos_totais
		end
	break if nao_quero_jogar?
end
