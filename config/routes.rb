Rails.application.routes.draw do
	root to: 'tasks#index'
  devise_for :users
  resources :tasks
  get 'tags/:tag', to: 'tasks#index', as: "tag"
  get 'tasks/:important', to: 'tasks#index', as: "important"
  get 'tasks/:starred', to: 'tasks#index', as: "starred"
  get 'tasks/:finished', to: 'tasks#index', as: "finished"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
