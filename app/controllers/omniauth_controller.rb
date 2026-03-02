class OmniauthController < ApplicationController
  def create
    twitter_account = current_user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      image: auth.info.image,
      token: auth.credentials.token,
      refresh_token: auth.credentials.refresh_token,
      expires_at: auth.credentials.expires_at
    )

    redirect_to twitter_accounts_path, notice: "Successfully connected your account"
  end

  def auth
    request.env['omniauth.auth']
  end
end
