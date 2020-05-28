class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    find_post
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
    find_post
    if @post.user != current_user
      redirect_to recipes_path, alert: "不正なアクセスです。"
    end
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end

    def find_post
      @post = Post.find(params[:id])
    end
    
    
end
