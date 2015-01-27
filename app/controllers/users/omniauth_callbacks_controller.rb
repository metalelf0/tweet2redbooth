class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def redbooth
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session['redbooth_token'] = request.env['omniauth.auth'].credentials.token

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => 'redbooth') if is_navigational_format?
    else
      session['devise.redbooth_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

end

