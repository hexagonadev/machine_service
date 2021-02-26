Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/users', controller: :users, action: :index
  # get '/users/:id/', controller: :users, action: :show
  # post '/users', controller: :users, action: :create
  # put '/users/:id', controller: :users, action: :update
  # patch '/users/:id', controller: :users, action: :update
  # delete 'users/:id', controller: :users, action: :destroy

  resources :users, except: [:new, :edit]
  resources :vehicles, except: [:new, :edit]
  resources :appointments, except: [:new, :edit]


  # def resources(resource)
  #   get "/#{resource}", controller: resource.to_sym, action: :index
  #   get "/#{resource}/id", controller: resource.to_sym, action: :show
  #   post "/#{resource}", controller: resource.to_sym, action: :create
  #   put "/#{resource}/id", controller: resource.to_sym, action: :update
  #   patch "/#{resource}/id", controller: resource.to_sym, action: :update
  #   delete "/#{resource}/id", controller: resource.to_sym, action: :destroy
  # end
  
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