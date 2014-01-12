Ideas::Application.routes.draw do
  root "main#index"
  devise_for :admins
  get '/auth/:provider/callback' => 'authentications#create'
  get '/wrong_domain' => "main#wrong_domain"
  get '/ideas/:id' => "ideas#show"
  get '/new' => "main#index", show_new_idea: true
  get '/tags/:tag' => "main#index"

  namespace :api do
    resource :votes
    resource :ideas
    resource :comments
    delete '/comments/:id' => "comments#destroy"
    delete '/ideas/:id' => "ideas#destroy"
    post '/ideas/:id/change_status/:status_id' => "ideas#change_status"
  end

end
