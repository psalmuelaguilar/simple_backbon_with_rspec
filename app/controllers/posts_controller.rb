class PostsController < ApplicationController
  respond_to :json, except: [:index, :show]
  def index
    posts = Post.includes([:author, posttags: :tag])
    parsed_posts = posts.collect do |post|
      Presenter::Post.parse(post)
    end
    render json: parsed_posts

    # respond_with Post.all
  end
  
  def show
    # respond_with Post.find(params[:id])
    post = Post.includes([:author, posttags: :tag]).find(params[:id])
    render json: Presenter::Post.parse(post)
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
