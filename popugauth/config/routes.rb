Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "doorkeeper/applications#index"
end
