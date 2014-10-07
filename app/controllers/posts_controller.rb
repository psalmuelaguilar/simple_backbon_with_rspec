class PostsController < ApplicationController
  respond_to :json, except: [:index, :show]
  # def index
  #   posts = Post.includes([:author, posttags: :tag]).order('id')
  #   parsed_posts = posts.collect do |post|
  #     Presenter::Post.parse(post)
  #   end
  #   render json: parsed_posts

  #   # respond_with Post.all
  # end
  PER_PAGE_RECORDS = 3
  def index
    if params[:tags].nil?
      posts = Post.includes([:author, posttags: :tag]).order('created_at DESC').page(params[:page]).per(PER_PAGE_RECORDS)
    else
      puts params[:tags]
      posts = Post.includes([:author, posttags: :tag]).tags_search(params[:tags]).page(params[:page]).per(PER_PAGE_RECORDS)
    end
    # binding.pry
    parsed_posts = posts.collect do |post|
      Presenter::Post.parse(post)
    end
    # binding.pry
    respond_to do |format|
      format.json{render json: {models: parsed_posts, current_page: params[:page].to_i, total_pages: posts.num_pages}}
    end

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
