Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 get '/users', controller: :users, action: :index
#  post
#  put
#  patch
#  delete
end


# get [:index, :show]
# post [:create]
# put/patch [:update]
# delete [:destroy]