Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :records
      resources :items
      resources :users
    end
  end
end
