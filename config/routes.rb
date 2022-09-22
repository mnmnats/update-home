Rails.application.routes.draw do
  devise_for :admin, controllers:{
    sessions: "admin/sessions"
  }
  
  
  devise_for :users, controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: 'public' do
    resources :users, only:[:show, :update, :edit]
    resources :posts, only:[:index, :show, :new, :create, :edit]
    get "/about" => "homes#about", as: "about"
    
    root "homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
