Rails.application.routes.draw do
  resources :paintings
  resources :museums

  resources :museums do 
    resources :paintings
  end
end
