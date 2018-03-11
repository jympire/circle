Rails.application.routes.draw do
  root 'pages#home'
  
  get 'host' , to: 'pages#host'
  get 'terms' , to: 'pages#terms'
  get '/terms/privacy_policy' , to: 'pages#privacy'
  get '/terms/nondiscrimination_policy' , to: 'pages#nondiscrimination'
  get '/terms/payments_terms' , to: 'pages#payments'
  get '/terms/host_guarantee' , to: 'pages#host_guarantee'
  get '/terms/guest_refund_policy' , to: 'pages#guest_refund'
  get '/terms/copyright_policy' , to: 'pages#copyright'
  get '/terms/cookie_policy' , to: 'pages#cookie'
  get '/terms/guest_waiver' , to: 'pages#guest_waiver'
  get '/how_it_works' , to: 'pages#how_it_works'
  get '/how_it_works/for_gyms' , to: 'pages#for_gyms'
  get '/how_it_works/for_trainers' , to: 'pages#for_trainers'
  get '/how_it_works/for_clients_and_guests' , to: 'pages#for_clients_and_guests'

  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit: 'edit', sign_up: 'register'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  
  resources :users, only: [:show] do
    member do
      post '/verify_phone_number' => 'users#verify_phone_number'
      patch '/update_phone_number' => 'users#update_phone_number'
    end
  end
  
  resources :gyms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
    resources :calendars
  end
  
  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]
  
  get '/your_bookings' => 'reservations#your_bookings'
  get '/your_reservations' => 'reservations#your_reservations'
  
  get 'search' => 'pages#search'
  get 'dashboard' => 'dashboards#index'
  
  resources :reservations, only: [:approve, :decline] do
    member do
      post '/approve' => "reservations#approve"
      post '/decline' => "reservations#decline"
    end
  end
  
  resources :revenues, only: [:index]
  
  resources :conversations, only: [:index, :create]  do
    resources :messages, only: [:index, :create]
  end
  
  get '/host_calendar' => "calendars#host"
  get '/payment_method' => "users#payment"
  get '/payout_method' => "users#payout"
  post '/add_card' => "users#add_card"
  
  get '/notification_settings' => 'settings#edit'
  post '/notification_settings' => 'settings#update'
end
