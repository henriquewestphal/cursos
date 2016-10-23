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
  nil
end

def soma_vetor(vetor1, vetor2)
  [vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

def posicoes_validas_em(mapa, novo_mapa, posicao)
  posicoes = []
  movimentos = [[+1, 0], [0, +1], [-1, 0], [0, -1]]
  movimentos.each do |movimento|
    nova_posicao = soma_vetor(movimento, posicao)
    if posicao_valida?(mapa, nova_posicao) && posicao_valida?(novo_mapa, nova_posicao)
      posicoes << nova_posicao
    end
  end
  posicoes
end
  #intigo esquema de movimentacao dos fantasmas
  #baixo = [posicao[0] + 1, posicao[1]]
  #if posicao_valida?(mapa, baixo) && posicao_valida?(novo_mapa, baixo)
  #  posicoes << baixo
  #end
  #cima = [posicao[0] - 1, posicao[1]]
  #if posicao_valida?(mapa, cima) && posicao_valida?(novo_mapa, cima)
  #  posicoes << cima
  #end
  #esquerda = [posicao[0],posicao[1] - 1]
  #if posicao_valida?(mapa, esquerda) && posicao_valida?(novo_mapa, esquerda)
  #  posicoes << esquerda
  #end
  #direita = [posicao[0],posicao[1] + 1]
  #if posicao_valida?(mapa, direita) && posicao_valida?(novo_mapa, direita)
  #  posicoes << direita
  #end
  #posicoes

def copia_mapa(mapa)
  novo_mapa = mapa.join("\n").tr("F", " ").split "\n"

  return novo_mapa
end


def move_fantasma(mapa, novo_mapa, linha, coluna)
  posicoes = posicoes_validas_em mapa, novo_mapa, [linha, coluna]

  return if posicoes.empty?
    aleatorio = rand posicoes.size
    posicao = posicoes[aleatorio]
    mapa[linha][coluna] = " "
    novo_mapa[posicao[0]][posicao[1]] = "F"
end

def move_fantasmas(mapa)
  caractere_do_fantasma = "F"
  novo_mapa = copia_mapa mapa
  mapa.each_with_index do |linha_atual, linha|
    linha_atual.chars.each_with_index do |caractere_atual, coluna|
      eh_fantasma = caractere_atual == caractere_do_fantasma
      if eh_fantasma
        move_fantasma mapa, novo_mapa, linha, coluna
      end
    end
  end
  novo_mapa
end


def calcula_nova_posicao(heroi, direcao)
#array associativo
  movimentos = {
    "W" => [-1, 0],
    "S" => [+1, 0],
    "A" => [0, -1],
    "D" => [0, +1],
    "w" => [-1, 0],
    "s" => [+1, 0],
    "a" => [0, -1],
    "d" => [0, +1]
  }
  movimento = movimentos[direcao]
  heroi[0] += movimento[0]
  heroi[1] += movimento[1]
  heroi
end

def posicao_valida? (mapa, posicao)

  linhas = mapa.size
  colunas = mapa[0].size
  atingiu_muro = mapa[posicao[0]] [posicao[1]] == "X"
  atingiu_fantasma = mapa[posicao[0]] [posicao[1]] == "F"
  estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
  estourou_colunas = posicao[1] < 0 || posicao[1] >= colunas

  if estourou_linhas || estourou_colunas
    return false
  end
  if atingiu_muro || atingiu_fantasma
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
        mapa = move_fantasmas mapa
        if !encontra_jogador(mapa)
          game_over
          break
        end
    end
end

def inicia_pacman
  nome = boas_vindas
  joga nome

end
