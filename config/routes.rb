Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 get '/users', controller: :users, action: :index
 get '/users/:id/', controller: :users, action: :show

 post '/users', controller: :users, action: :create
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