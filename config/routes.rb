Rails.application.routes.draw do

  get 'information/weight_106' => 'information#weight_106'

  get 'information/weight_113' => 'information#weight_113'

  get 'information/weight_120' => 'information#weight_120'

  get 'information/weight_126' => 'information#weight_126'

  get 'information/weight_132' => 'information#weight_132'

  get 'information/weight_138' => 'information#weight_138'

  get 'information/weight_145' => 'information#weight_145'

  get 'information/weight_152' => 'information#weight_152'

  get 'information/weight_160' => 'information#weight_160'

  get 'information/weight_170' => 'information#weight_170'

  get 'information/weight_182' => 'information#weight_182'

  get 'information/weight_195' => 'information#weight_195'

  get 'information/weight_220' => 'information#weight_220'

  get 'information/weight_285' => 'information#weight_285'

  get 'information/team_scores' => 'information#team_scores'

  get 'information/brackets' => 'information#brackets'

  get 'information/about' => 'information#about'

  get 'information/teams_entered' => 'information#teams_entered'

  get 'information/schedule' => 'information#schedule'

  get 'information/entry_information' => 'information#entry_information'

  get 'information/map_to_msj' => 'information#map_to_msj'

  get 'information/place_winners_2014' => 'information#place_winners_2014'

  get 'information/hotels' => 'information#hotels'

  get 'information/results_prior_years' => 'information#results_prior_years'

  get 'public/MSJ_2015_Champions.pdf' => 'information#champions_1990_to_2013'

  get 'wrestlers/sort_by_school' => 'wrestlers#sort_by_school'

  get 'wrestlers/sort_by_state_place' => 'wrestlers#sort_by_state_place'

  get 'users/home' => 'users#home'

  get 'users/send' => 'users#send', as: :send_welcome_mail

  get 'users/all_teams_no_entry' => 'users#all_teams_no_entry', action:  'all_teams_no_entry'


  # get 'users/:id/no_entry' => 'users/wrestlers/#no_entry', as: :no_entry

  post 'create_user' => 'users#create', as: :create_user

  devise_for :users
  root 'welcome#index'


  resources :users, except: :create do

    get 'no_entry', action: 'no_entry'
    resources :wrestlers, controller: "users/wrestlers"
    resources :tournaments, controller: "users/tournaments"
  end

  resources :teams, only: [:index]

  resources :tournaments, only: [:index, :edit, :update]

  resources :wrestlers, only: [:index, :edit, :show, :update]

  resources :applicants

  controller :tournaments do
    delete '/tournaments/:id',      action: 'destroy'
  end

  controller :applicants do
    delete '/applicants/:id',      action: 'destroy'
  end

  controller :wrestlers do
    delete '/wrestlers/:id',      action: 'destroy'
  end

  controller :users do
    delete '/users/:id',      action: 'destroy'
  end

end
