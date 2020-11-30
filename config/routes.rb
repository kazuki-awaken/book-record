Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:index] 
  
  resources :books, except: [:index] do
    collection do
      get :own
      get :notyet
    end
  end
end
