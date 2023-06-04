Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :payslips_details
      resources :payslips
      resources :salary_details do
        collection do
          get "generic", action: "generic" 
        end
      end
      resources :roles
      resources :employees      
    end
  end

  root 'main_page#index'
  get '/*path' => 'main_page#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
