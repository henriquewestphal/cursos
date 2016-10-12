require_relative "logic"
nome = boas_vindas

loop do
	joga nome

	if nao_quero_jogar?
		break
	end
end
