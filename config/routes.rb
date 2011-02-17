Pickardayune::Application.routes.draw do
  match ":year/:month", :to => 'edition#index', :as => :edition
  get "edition/index"
  root :to => "edition#current"
end
