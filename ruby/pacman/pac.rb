require_relative "ui"
require_relative "heroi"
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
        jogador = Heroi.new
        jogador.linha = linha
        jogador.coluna = heroi_esta_aqui
        return jogador
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


def posicao_valida?(mapa, posicao_atual)
  linhas = mapa.size
  colunas = mapa[0].size
  atingiu_muro = mapa[posicao_atual[0]][posicao_atual[1]] == "X"
  atingiu_fantasma = mapa[posicao_atual[0]][posicao_atual[1]] == "F"
  estourou_linhas = posicao_atual[0] < 0 || posicao_atual[0] >= linhas
  estourou_colunas = posicao_atual[1] < 0 || posicao_atual[1] >= colunas

  if estourou_linhas || estourou_colunas
    return false
  end
  if atingiu_muro || atingiu_fantasma
    return false
  end
  true
end

def executa_remocao(mapa, posicao, quantidade)
  if mapa[posicao.linha][posicao.coluna] == "X"
    return
  end
  #mapa[posicao.linha][posicao.coluna] = " "
  posicao.remove_do mapa
  remove mapa, posicao, quantidade - 1
end

def remove(mapa, posicao, quantidade)
    if quantidade == 0
      return
    end
    executa_remocao mapa, posicao.direita, quantidade
    executa_remocao mapa, posicao.cima, quantidade
    executa_remocao mapa, posicao.esquerda, quantidade
    executa_remocao mapa, posicao.baixo, quantidade
end

def joga(nome)
    mapa = le_mapa 3

    while true
      desenha_mapa mapa
      direcao = pede_movimento
      heroi = encontra_jogador mapa
      nova_posicao = heroi.calcula_nova_posicao direcao
        if !posicao_valida? mapa, nova_posicao.to_array
          next
        end
        heroi.remove_do mapa
        if mapa[nova_posicao.linha][nova_posicao.coluna] == "*"
          remove mapa, nova_posicao, 4
        end
        nova_posicao.coloca_no mapa

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
