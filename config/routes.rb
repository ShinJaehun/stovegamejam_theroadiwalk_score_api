Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_scores
      #resource :get_high_score
      get 'get_high_score', to: 'user_scores#get_high_score', as: :get_high_score
    end
  end

  #get 'get_high_score', to: 'user_scores#get_high_score', as: :get_high_score
end
