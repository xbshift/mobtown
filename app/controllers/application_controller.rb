class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_special_events

  def get_special_events
    @special_events = Event.find(:all, :conditions => {:special => true}, :order => 'starts_at ASC')
  end

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
