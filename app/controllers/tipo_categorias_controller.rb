class TipoCategoriasController < ApplicationController
    def index
        @tipocategorias = TipoCategoria.all
    end
    def show
        @tipocategoria = TipoCategoria.find(params[:id])
    end
    def edit
        @tipocategoriasopciones = TipoCategoriaOption.all
        @tipocategoria = TipoCategoria.find(params[:id])
    end
    def new
        @tipocategoriasopciones = TipoCategoriaOption.all
        @tipocategoria = TipoCategoria.new
    end
    def destroy
        tipocategoria = TipoCategoria.find(params[:id])
        tipocategoria.update(estado:"I")
        redirect_to tipo_categorias_path
    end
    def activate
        tipocategoria = TipoCategoria.find(params[:id])
        tipocategoria.update(estado:"A")
        redirect_to tipo_categorias_path
    end
    def create 
        tipocategoria = TipoCategoria.new(tipo_categoria_params) do |tc|
            tc.id_tipo_categoria = params[:id_tipo_categoria]
        end
        if tipocategoria.save
            redirect_to tipo_categorias_path
        else
            render :new
        end
    end

    def tipo_categoria_params
        params.require(:tipo_categoria).permit(:nombre,:id_tipo_categoria)
    end
end
