class PostController < ApplicationController
  def index
  	@post = Post.all
  end
end
