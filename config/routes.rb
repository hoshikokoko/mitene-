Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :staffs, only: [:index, :show, :edit, :update]
  end
  namespace :staff do
    get 'homes/top' => 'homes#top', as: 'top'
  end
  devise_for :staff,skip: [:passwords], controllers: {
    registrations: "staff/registrations",
    sessions: 'staff/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  root :to => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
