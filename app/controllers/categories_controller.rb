class CategoriesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category= Category.find(params[:id])
 
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html  { redirect_to(dance_classes_path,
                      :notice => 'Category was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @category.errors,
                      :status => :unprocessable_entity }
      end
    end
  end


  def create
    @category = Category.new(params[:category])
 
    respond_to do |format|
      if @category.save
        format.html  { redirect_to(dance_classes_path,
                      :notice => 'Category was successfully created.') }
        format.json  { render :json => @category,
                      :status => :created, :location => @category }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @category.errors,
                    :status => :unprocessable_entity }
      end
    end
  end

end
