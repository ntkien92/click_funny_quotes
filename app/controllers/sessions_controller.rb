class SessionsController < ApplicationController
  def new
    redirect_to '/auth/facebook'
  end

  def create
    params[:quote_id] = Quote.first.id
    quote = Quote.find(params[:quote_id])

    oauth_access_token =  env["omniauth.auth"].credentials.token
    koala_user = Koala::Facebook::API.new(oauth_access_token)
    @result = quote.get_answer(koala_user)

    p @result

    # @graph.put_connections("me", "feed", message: "I am writing on my wall!")
    render "answers/" + @result[:layout]
  end

end