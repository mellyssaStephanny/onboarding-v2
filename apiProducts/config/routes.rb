Rails.application.routes.draw do
  resources :products, except: %i[new edit]
end
