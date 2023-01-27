# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  # ログイン後に管理者トップページへ遷移
  def after_sign_in_path_for(resource)
    admin_top_path
  end
  
  # ログアウト後に共通トップページへ遷移
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def new_gest
    
    gest = Admin.gest
  
    sign_in gest
    redirect_to admin_top_path, notics: "ゲストとしてログインしました"
  end
end
