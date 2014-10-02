class PostsController < ApplicationController
  respond_to :json, except: :index
  def index
    posts = Post.includes(:author)
    parsed_posts = posts.collect do |post|
      Presenter::Post.parse(post)
    end
    render json: parsed_posts

    # respond_with Post.all
  end
  
  def show
    respond_with Post.find(params[:id])
  end
  
  def create
    puts "$" * 100
    puts params[:post]
    respond_with Post.create!(params[:post])
  end
  
  def update
    respond_with Post.update(params[:id], params[:post])
  end
  
  def destroy
    respond_with Post.destroy(params[:id])
  end
end
