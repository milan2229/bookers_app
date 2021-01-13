Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/top'
  get 'books/' => 'books#index'
  get 'books/:id' => 'books#show' ,as: 'book'
  get 'books/:id/edit' => 'books#edit' ,as: 'edit_book'
  # ↑コントローラー作成時に４アクションの設定値が自動的に追記されたやつ
  # resources :books
  post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'delete'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
