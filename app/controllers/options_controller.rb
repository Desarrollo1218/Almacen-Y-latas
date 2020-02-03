class OptionsController < ApplicationController
    def index
        @optiones = Option.all
    end

    def  show
        @option = Option.find(params[:id])
    end

    def edit
        @option = Option.find(params[:id])
    end

    def new 
        @option = Option.new()
    end

    def update
        @option = Option.find(params[:id])
        if @option.update(options_params)
            redirect_to options_path
        else
            render :new
        end
    end

    def create
        @option = Option.new(options_params)
        if @option.save
            redirect_to options_path
        else 
            render :new
        end
    end

    def destroy
        opcion = Option.find(params[:id])
        #opcion.estado = "I"
        if opcion.update(estado:"I")
            redirect_to options_path
        else
            render :edit
        end
    end

    def activate
        opcion =  Option.find(params[:id])
        opcion.update(estado:"A")
        redirect_to options_path
    end
    
    def options_params
        params.require(:option).permit(:nombre,:estado,:direccion,:orden)
    end
    
end
