class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_special_events

  def get_special_events
    @special_events = Event.special.upcoming
  end

  def login
    authenticate
    @events = Event.all
    @dance_classes = DanceClass.all
    @latest_rental_inquiry = RentalInquiry.order('created_at DESC').first.created_at.strftime("%m/%d/%Y")
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == AUTH[:admin_user] && password == AUTH[:admin_password]
      end
    end

end
