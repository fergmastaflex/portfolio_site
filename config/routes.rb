PortfolioSite::Application.routes.draw do
  devise_for :users
  root :to => 'projects#index'
  resources :projects
  get "contact-us", to: 'contact#new', as: :contact
  post "contact-us", to: 'contact#create', as: :contact
end
