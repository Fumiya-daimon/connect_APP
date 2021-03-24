class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show edit update destroy]

  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      flash[:notice] = "「#{post.title}」の掲示板を作成しました"
      redirect_to post
    else
      redirect_to new_post_path, flash: {
        post: post,
        error_messages: post.errors.full_messages
      }
    end
  end

  def show
    @answers = @post.answers
    @answer = Answer.new
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to @post
  end

  def destroy
    @post.delete
    redirect_to posts_path, flash: { notice: "「#{@post.title}」の掲示板が削除されました"}
  end

  private

  def post_params
    params.require(:post).permit(:title, :tag, :content, :image).merge(user_id: current_user.id)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
