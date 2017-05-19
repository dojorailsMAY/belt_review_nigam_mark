Rails.application.routes.draw do

  root 'books#index'

  get 'reviews/new'

  post 'books/reviews/:book_id/create' => 'reviews#create'

  get 'reviews/edit'

  get 'reviews/delete'

  get 'reviews/index'

  get 'books/new'

  get 'books/:id' => 'books#show'


  post 'books' => 'books#create'

  get 'books/edit'

  get 'books/delete'

  get 'authors/:id' => 'books#show_author'

  get 'users' => 'users#new'

  post 'users' => 'users#create'

  post 'users/login' => 'users#login'

  get 'users/logout' => 'users#logout'

  get 'users/edit' => 'users#edit'

  patch 'users/:id/update' => 'users#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
