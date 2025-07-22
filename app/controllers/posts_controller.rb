class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

    if @post.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end
end
