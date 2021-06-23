Rails.application.routes.draw do
  root "items#index"

  resources :items do
    resources :notes
    collection do
      get :archive_toggle
    end
  end
end
