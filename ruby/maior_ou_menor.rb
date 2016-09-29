puts  "Jogo da adivinhação!\n\n"

puts "qual é o seu nome?"
$nome = gets

puts "muito prazer, " + $nome
puts "\nvamos começar o jogo\n\n\n"
puts "escolhendo um numero secreto  de 0 a 200"
$numero_escolhido = 20
puts "escolhido\n\n\n"

$numero_tentativas = 3
for $tentativas in 1..$numero_tentativas
	
	puts "tentariva:  " + $tentativas.to_s + " de  " + $numero_tentativas.to_s

	puts "\n\n\n\ntente adivinhar o numero escolhido?"
	$chute = gets


	puts "\nvoce chutou, " + $chute

	$acertou = $numero_escolhido.to_i == $chute.to_i

	if $acertou
	 	puts "Parabens!! Voce acertou"
	 	break
	 else
	 	puts "Infelizmente voce errou"

	 	if $numero_escolhido.to_i > $chute.to_i
	 		puts "\n\no numeor segreto é maior\n\n"
	 	else
	 		puts  "\n\no numero segreto é menor\n\n"

	 	end 

	 end 
end




