Rails.application.routes.draw do
  devise_for :u_sers
  root "drivers#index"
  resources :drivers do
    member do
      get "download_pdf"
      get "restore"
    end
  end
  get "/trash" , to: "drivers#trash"
end
