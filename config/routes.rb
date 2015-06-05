Rails.application.routes.draw do
  # The root will be handled by the
  # planes control
  # get '/', to: "planes#index"
  # a shortcut for the above
  root to: "planes#index"

  # just to be RESTful
  get '/planes', to: "planes#index"

  # it's a 'get' because someone
  # is requesting a page with a
  # form
  get '/planes/new', to: 'planes#new'
  
  # show a single plane.  Order is important
  # it has to be after new, otherwise ROR
  # will assume :id is a new request
  get '/planes/:id', to: 'planes#show'
  
  # edit a plane/id
  get '/planes/:id/edit', to: 'planes#edit'

  # create a plane record
  post '/planes', to: 'planes#create'

  # Route the incoming update using the id
  post '/planes/:id', to: 'planes#update'
  
end
