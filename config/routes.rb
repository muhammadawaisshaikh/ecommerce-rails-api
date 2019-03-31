Rails.application.routes.draw do

  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :products
    resources :categories
  end  

  constraints subdomain: 'api' do
  end

end
