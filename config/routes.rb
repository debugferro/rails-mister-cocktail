Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:show, :new, :create, :delete]
    resources :reviews, only: [:new, :create]
  end

  root to: 'cocktails#index'
end


# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   resources :restaurants do
#     resources :reviews, only: [:new, :create]
#   end
#   resources :reviews, only: [:delete]
#   root to: 'restaurants#index'
# end
