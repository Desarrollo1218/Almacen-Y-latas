class UsuariosController < ApplicationController
    #GET /usuarios
    def index
        @users = Usuario.all
    end
    #GET /usuarios/:id
    def show
        @usuario = Usuario.find(params[:id])
    end

    # Inserta un usuario
    def new
        @usuario = Usuario.new
    end

    def edit
        @usuario = Usuario.find(params[:id])
    end

    def create
        @usuario = Usuario.new(usuario_params)
        if @usuario.save
            redirect_to usuarios_path
        else
            render :new
        end
    end

    def update
        @usuario = Usuario.find(params[:id])
        if @usuario.update(usuario_params)
            redirect_to @usuario
        else
            render :edit
        end
    end

    def destroy
        @usuario = Usuario.find(params[:id])
        @usuario.destroy
        #edirect_to usuarios_path
        render :index
    end

    def usuario_params
        params.require(:usuario).permit(:nombre,:email,:password)
    end

end