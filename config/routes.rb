Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :records, except: %i[new]
      resources :items, except: %i[new]
      resources :users, only: %i[show create]
      resources :login, only: %i[create]
      resources :auto_login, only: %i[create]
    end
  end
end
