Rails.application.routes.draw do
  
  # 従業員サインアップ、サインイン
  devise_for :staff,skip: [:passwords], controllers: {
    registrations: "staff/registrations",
    sessions: 'staff/sessions'
  }
  
  devise_scope :staff do
    # ゲストログイン。ゲストユーザーがなければ新規作成するのでpostとしてます。
    post 'staff/gest_sign_in' => 'staff/sessions#new_gest'
  end
  
  # 管理者サインイン。管理者はサインアップできない想定なので、
  # 今回サインアップ機能はありません。
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  

  namespace :admin do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :staffs, only: [:index, :show, :edit, :update]
  end
  
  # 従業員サイト
  namespace :staff do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :infomations
  end
  
  # サイトトップページ
  root :to => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
