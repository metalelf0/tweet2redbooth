class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def redbooth
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication # this will throw if @user is not activated
      fetch_bearer_token params[:code]
      set_flash_message(:notice, :success, :kind => 'redbooth') if is_navigational_format?
    else
      session['devise.redbooth_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  private

  def fetch_bearer_token code
    request_params = {
      client_id:     ENV['REDBOOTH_APP_ID'],
      client_secret: ENV['REDBOOTH_APP_SECRET'],
      code: code,
      grant_type: 'authorization_code',
      redirect_uri: 'http://localhost:5000/users/auth/redbooth/callback'
    }

    token_data = RestClient.post "https://redbooth.com/oauth2/token", request_params
  end
end

