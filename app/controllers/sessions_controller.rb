class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy] # cant login twice

  # GET /sign_in
  def new
    @user = User.find_by(email: params[:session].try(:email).to_s.downcase)

    if @user && user.authenticate(params[:session][:password])
      sign_in @user
    end
  end

  # POST /sign_in
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  # DELETE /sign_out
  def destroy
    sign_out
    redirect_to root_url
  end
end
