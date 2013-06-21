# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

  resources :projects do
    resources :deliverables do

    end
    resources :requests do 
      resources :hand_ins   
    end
  end

  resources :deliverables, :controller => "admin_deliverables" do
        get :archive, :controller => "admin_deliverables", :action => "archive"
        get :activate, :controller => "admin_deliverables", :action => "activate"
  end