class ApplicationController < ActionController::Base
  before_action :set_format
  before_action :set_google_client_id # for the future on firebase

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  # add messages to the flash variable to be displayed at the view
  def add_msg(msg, type = :alert)
    flash[type] = [] if flash[type].nil?

    if msg.instance_of?(Array)
      msg.each { |t_msg| flash[type].push t_msg }
    elsif msg.instance_of?(String)
      flash[type].push msg
    else
      raise 'msg type not implemented yet'
    end
  end

  def set_format
    request.format = :json if ['json', 'application/json'].include?(request.headers["Accept"])
  end

  def set_google_client_id
    @google_client_id = Rails.configuration.google_client_id
  end

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def correct_user?
    @user ||= User.find(params[:id])

    unless current_user == @user
      redirect_to users_path
    end
  end
end
