class PosttagsController < ApplicationController
    respond_to :json
  
  def index
    respond_with Posttag.all
  end
  
  def show
    respond_with Posttag.find(params[:id])
  end
  
  def create
    respond_with Posttag.create(params[:posttag])
  end
  
  def update
    respond_with Posttag.update(params[:id], params[:posttag])
  end
  
  def destroy
    respond_with Posttag.destroy(params[:id])
  end
end
