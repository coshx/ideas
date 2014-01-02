Ideas::Application.routes.draw do
  get "main/index"

  devise_for :admins

  namespace :api do
    resource :votes
  end

end
