# adiciona valores usando um contador
# e apontando qual o lugar onde deve se atribuir o valor desejado 

chutes = []
tentativa_chute = 0

chute =50
chutes[tentativa_chute] = chute.to_i
tentativa_chute +=1

chute =150
chutes[tentativa_chute] = chute.to_i
tentativa_chute +=1

chute =300
chutes[tentativa_chute] = chute.to_i
tentativa_chute +=1

puts chutes
puts "\n\n\n\n\n"


#outra forma de adicionar valor na array
# sem usar contador
#detretando o valor de chute e adicionando esse chute para o array

chutes = []
chute = 100
chutes << chute
chute = 300
chutes << chute
chute = 450
chutes << chute
chute = 600
chutes << chute
chute = 12344
chutes << chute
puts chutes.size

puts "\n\n\n"
for chute in chutes
	puts chute
end
