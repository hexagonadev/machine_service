Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users', controller: :users, action: :index
  get '/users/:id/', controller: :users, action: :show

  get '/vehicles', controller: :vehicles, action: :index
  get '/vehicles/:id/', controller: :vehicles, action: :show

  get '/appointments', controller: :appointments, action: :index
  get '/appointments/:id/', controller: :appointments, action: :show

  post '/users', controller: :users, action: :create
  post '/vehicles', controller: :vehicles, action: :create
  post '/appointments', controller: :appointments, action: :create

  put '/users/:id', controller: :users, action: :update
  put '/vehicles/:id', controller: :vehicles, action: :update
  put '/appointments/:id', controller: :appointments, action: :update

#  post
#  put
#  patch
#  delete
end

# http://localhost:3000/users/1

# get [:index, :show]
# post [:create]
# put/patch [:update]
# delete [:destroy]