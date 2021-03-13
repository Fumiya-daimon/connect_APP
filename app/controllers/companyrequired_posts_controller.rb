class CompanyrequiredPostsController < ApplicationController
  before_action :set_target_companyrequired_post, only: %i[show edit update destroy]

  def index
    @companyrequired_posts = CompanyrequiredPost.page(params[:page])
  end

  def new
    @companyrequired_post = CompanyrequiredPost.new
  end

  def create
    companyrequired_post = CompanyrequiredPost.new(companyrequired_post_params)
    if companyrequired_post.save
      flash[:notice] = "「#{companyrequired_post.title}」の掲示板を作成しました"
      redirect_to companyrequired_post
    else
      redirect_to new_companyrequired_post_path, flash: {
        post: companyrequired_post,
        error_messages: companyrequired_post.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    @companyrequired_post.update(companyrequired_post_params)

    redirect_to @companyrequired_post
  end

  def destroy
    @companyrequired_post.delete
    redirect_to companyrequired_posts_path, flash: { notice: "「#{@companyrequired_post.title}」の掲示板が削除されました"}
  end

  private

  def companyrequired_post_params
    params.require(:companyrequired_post).permit(:title, :required_person, :content).merge(company_id: current_company.id)
  end

  def set_target_companyrequired_post
    @companyrequired_post = CompanyrequiredPost.find(params[:id])
  end
end
