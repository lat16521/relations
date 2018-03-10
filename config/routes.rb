Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions

  get "quiz/index"
  post "quiz/start"
  get "quiz/question"
  post "quiz/question"
  post "quiz/answer"
  get "quiz/end"
  post "choises/create"
  post "chises/destroy"
end
