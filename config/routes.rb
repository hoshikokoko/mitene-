Rails.application.routes.draw do
  namespace :staff do
    get 'homes/top'
  end
  devise_for :staffs,skip: [:passwords], controllers: {
    registrations: "staff/registrations",
    sessions: 'staff/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root :to => "staff/homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
