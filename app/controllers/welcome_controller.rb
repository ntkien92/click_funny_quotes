class WelcomeController < ApplicationController
  def index
  end

  def create
  	oauth_access_token =  env["omniauth.auth"].credentials.token

  	@graph = Koala::Facebook::API.new(oauth_access_token)
  	profile = @graph.get_object("me")

  	@name = profile['name']
  end
end
