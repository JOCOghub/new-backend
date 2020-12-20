Rails.application.routes.draw do
  resources :museums do 
    resources :paintings #add :only here? look at labs again  
  end
                       
  resources :paintings
end
