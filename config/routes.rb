Ideas::Application.routes.draw do
  root "main#index"
  devise_for :admins
  get '/auth/:provider/callback' => 'authentications#create'

  namespace :api do
    resource :votes
    resource :ideas
    resource :comments
    delete '/comments/:id' => "comments#destroy"
    delete '/ideas/:id' => "ideas#destroy"
  end

end
