Rails.application.routes.draw do
  resources :museums do 
    resources :paintings 
  end
                       
  resources :paintings
end
