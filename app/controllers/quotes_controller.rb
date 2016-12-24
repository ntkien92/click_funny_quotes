class QuotesController < ApplicationController
  def index
  end

  def show
    @quote = Quote.friendly.find(params[:id])
    @main_quote = @quote.main_quote
  end

  def result
    p params
    # @quote = Quote.friendly.find(params[:id])
    # p @quote
    # oauth_access_token =  env["omniauth.auth"].credentials.token
    # koala_user = Koala::Facebook::API.new(oauth_access_token)
    # @result = quote.get_answer(koala_user)

    # p @result

    # # @graph.put_connections("me", "feed", message: "I am writing on my wall!")
    # render "answers/" + @result[:layout]
  end
end