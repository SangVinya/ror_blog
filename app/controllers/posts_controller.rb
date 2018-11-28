class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # http_basic_authenticate_with name: "vinya", password: "secret", except: [:index, :show]

  def index
    @posts = Post.all
    if cookies[:views].present?
      cookies[:views] = cookies[:views].to_i + 1
    else
      1
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.first
    if @post.save
      # add post to table
    else
      # some alert
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :text, :image)
    end
end
