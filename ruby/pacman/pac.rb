require_relative "ui"

def le_mapa(numero)
  arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"

end

def encontra_jogador(mapa)
  nosso_heroi = "H"
  mapa.each_with_index do |linha_atual, linha|
    heroi_esta_aqui = linha_atual.index nosso_heroi
      if heroi_esta_aqui
        return [linha, heroi_esta_aqui]
      end
  end
  #nao achei

end

def calcula_nova_posicao(heroi, direcao)
  case direcao
    when "W"
      heroi[0] -= 1
    when "S"
      heroi[0] += 1
    when "A"
      heroi[1] -= 1
    when "D"
      heroi[1] += 1
    when "w"
      heroi[0] -= 1
    when "s"
      heroi[0] += 1
    when "a"
      heroi[1] -= 1
    when "d"
      heroi[1] += 1
  end
  heroi
end

def posicao_valida? (mapa, posicao)

  linhas = mapa.size
  colunas = mapa[0].size
  atingiu_muro = mapa[posicao[0]][posicao[1]] == "X"
  estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
  estourou_colunas = posicao[1] < 0 || posicao[1] >= colunas

  if estourou_linhas || estourou_colunas
    return false
  end
  if atingiu_muro
    return false
  end
  true
end


def joga(nome)
    mapa = le_mapa 2

    while true
      desenha_mapa mapa
      direcao = pede_movimento
      heroi = encontra_jogador mapa
      heroi_antigo = encontra_jogador mapa
      nova_posicao = calcula_nova_posicao heroi, direcao
        if !posicao_valida? mapa, nova_posicao
          next
        end
        mapa[heroi_antigo[0]] [heroi_antigo[1]] = " "
        mapa[nova_posicao[0]] [nova_posicao[1]] = "H"

    #  mapa[nova_posicao[0]][nova_posicao[1]] = "H"
    end
end

def inicia_pacman
  nome = boas_vindas
  joga nome

end
