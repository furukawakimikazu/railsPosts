class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  
  def edit
    if @post.user != current_user
      redirect_to posts_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to @post.user, notice: "投稿を削除しました。"
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
