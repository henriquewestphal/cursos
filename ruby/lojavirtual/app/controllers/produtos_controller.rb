class ProdutosController < ApplicationController
  def index
    @produtos_por_nome = Produto.order :nome
  end
  def new
    @produto = Produto.new

  end



  def create
    valores = params.require(:produto).permit :nome, :descricao, :quantidade, :preco
    @produto = Produto.new valores
    if @produto.save
      flash[:notice] = "produto salvo com sucesso"
      redirect_to root_url
    else
      render :new
    end
  end
  def busca
    @nome_a_buscar = params[:nome]
    @produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
  end

  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
  end
end
