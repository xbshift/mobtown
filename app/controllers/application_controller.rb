class ApplicationController < ActionController::Base
  protect_from_forgery

  def login
    authenticate
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == USER_ID && password == PASSWORD
      end
    end

end
