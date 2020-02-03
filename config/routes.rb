Rails.application.routes.draw do
  resources :usuarios
  resources :options
  resources :tipo_categorias
  resources :mercancias
  get "/option/activate/:id" , to: "options#activate", as: "activate_option"
  get "/tipo_categoria/activate/:id" , to: "tipo_categorias#activate", as: "activate_categoria"
  root 'principal#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end