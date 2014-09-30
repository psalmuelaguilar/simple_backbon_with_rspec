class AuthorsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Author.all
  end
  
  def show
    respond_with Author.find(params[:id])
  end
  
  def create
    respond_with Author.create(params[:author])
  end
  
  def update
    respond_with Author.update(params[:id], params[:author])
  end
  
  def destroy
    respond_with Author.destroy(params[:id])
  end
end
