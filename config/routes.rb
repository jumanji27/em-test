TestEm::Application.routes.draw do

  root 'index#index'

  namespace :api do
    namespace :v1 do
      get 'sale', to: 'index#sale'
      get 'rent', to: 'index#rent'
      get 'development', to: 'index#development'
    end
  end

end
