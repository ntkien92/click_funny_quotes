class SessionsController < ApplicationController
  def new
    p 55555555555555555555555555
    p params
    p 55555555555555555555555555
    redirect_to "/auth/facebook?app_data=#{params[:app_data]}"
  end

end