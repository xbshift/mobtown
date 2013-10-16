class RentalInquiriesController < ApplicationController

  before_filter :authenticate, :except => [:create, :new]

  def new
    @rental_inquiry = RentalInquiry.new
  end

  def create
    r = RentalInquiry.new(params[:rental_inquiry])
    r.save
  end

  def index
    @rental_inquiries = RentalInquiry.order('created_at DESC').all
  end
end
