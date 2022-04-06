Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :new, :destroy, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :bands, except: [] do
    resources :album, only: [:new]
  end
  resources :album, only: [:create, :show, :update, :destroy, :edit]
end
