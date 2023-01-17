Rails.application.routes.draw do
  
  # 従業員サインアップ、サインイン
  devise_for :staff,skip: [:passwords], controllers: {
    registrations: "staff/registrations",
    sessions: 'staff/sessions'
  }
  
  # 従業員側deviseを継承してゲスト機能を作成してます。
  devise_scope :staff do
    # ゲストログイン。ゲストユーザーがなければ新規作成するのでpostとしてます。
    post 'staff/gest_sign_in' => 'staff/sessions#new_gest'
  end
  
  # 管理者サインイン。管理者はサインアップできない想定なので、
  # 今回サインアップ機能はありません。
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  # 管理者サイト
  namespace :admin do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :staffs, only: [:index, :show, :edit, :update]
  end
  
  # 従業員サイト
  namespace :staff do
    get 'homes/top' => 'homes#top', as: 'top'
    get 'bookmarks/index' => 'bookmarks#index', as: 'bookmarks_index'
    resources :infomations do
      resource :bookmarks, only: [:create, :destroy]
      resource :reads, only: [:create, :destroy]
      resources :notifications, only: [:index, :update]
      resources :infomation_comments, only: [:create, :destroy]
    end
  end
  
  # サイトトップページ
  root :to => "homes#top"
  
  #キーワード検索結果出力ページ
  get '/search', to: 'searches#search_keyword'
  
  #タグ検索結果出力ページ
  get '/search/tag', to: 'searches#search_tag', as: 'search_tag'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
