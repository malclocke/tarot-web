TarotWeb::Application.routes.draw do

  match 'night_images/next' => 'night_images#next'
  resources :night_images do
    collection do
      get :next
    end
  end
  root :to => 'blinks#index'

end
