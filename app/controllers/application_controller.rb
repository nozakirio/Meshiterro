class ApplicationController < ActionController::Base
  # before_actionメソッドは、このコントローラが動作する前に実行される
  # ログイン認証されていなければ、ログイン画面へリダイレクトする
  before_action :authenticate_user!
  # devise利用の機能が使われる場合、その前にconfigure_permitted_parametersが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可される
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
