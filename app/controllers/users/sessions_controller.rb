# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_out_path_for(_resource_or_scope)
    root_path # Change this line to customize the redirect path
  end
end
