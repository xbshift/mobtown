class DanceClassesController < ApplicationController
  def new
  end

  def index
    @dance_classes = DanceClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dance_classes }
    end
  end
end
