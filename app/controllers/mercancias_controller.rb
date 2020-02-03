class MercanciasController < ApplicationController
    def index
        @mercancias = Mercancia.all
    end
    def show
        @mercancia = Mercancia.find(params[:id])
    end
    def new
        @mercancia = Mercancia.new
    end
    def edit
        @mercancia = Mercancia.find(params[:id])
    end
    def create
        @mercancia = Mercancia.new(validation_params)
        if @mercancia.save
            redirect_to mercancias_path
        else
            render :new
        end
    end

    def validation_params
        params.require(:mercancia).permit(:codigo,:proveedor,:fecha,:total)
    end
end
