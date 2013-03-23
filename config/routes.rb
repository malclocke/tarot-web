TarotWeb::Application.routes.draw do

  match 'night_images/next' => 'night_images#next'
  root :to => 'blinks#index'

end
