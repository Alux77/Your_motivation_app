Rails.application.routes.draw do

  get 'users/new'

  root 'static_pages#home'

  get  '/plan',       to: 'static_pages#plan'

  get  '/nutrition',  to: 'static_pages#nutrition'

  get  '/motivation', to: 'static_pages#motivation'

  get  '/gallery',    to: 'static_pages#gallery'

  get  '/contact',    to: 'static_pages#contact'

end