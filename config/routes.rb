Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    scope :twitter do
      get '/user/:user_name' => 'twitter#show'
      get '/tweets' => 'twitter#tweets'
      get '/compare' => 'twitter#compare'
    end
  end
  get '*path' => 'sites#main'

  root to: 'sites#main'
end
