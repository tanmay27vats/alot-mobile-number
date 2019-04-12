Rails.application.routes.draw do
  get '/phones' => 'mobile_numbers#list'
  post '/phones' => 'mobile_numbers#alot_number'

  put '/phones/(:phone)' => 'mobile_numbers#alot_specific_number'

  #match 'phones(/:phone)' => 'mobile_numbers#alot_specific_number', via: :put
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
