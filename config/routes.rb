Pickardayune::Application.routes.draw do
  match ":year/:month", :to => 'edition#index', :as => :edition, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  get "edition/index"
  root :to => "edition#current"
end
