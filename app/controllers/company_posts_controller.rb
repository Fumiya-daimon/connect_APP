class CompanyPostsController < ApplicationController
  before_action :set_target_company_post, only: %i[show edit update destroy]

  def index
    @company_posts = CompanyPost.page(params[:page])
  end

  def new
    @company_post = CompanyPost.new
  end

  def create
    company_post = CompanyPost.new(company_post_params)
    if company_post.save
      flash[:notice] = "「#{company_post.title}」の掲示板を作成しました"
      redirect_to company_post
    else
      redirect_to new_company_post_path, flash: {
        post: company_post,
        error_messages: company_post.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    @company_post.update(company_post_params)

    redirect_to @company_post
  end

  def destroy
    @company_post.delete
    redirect_to company_posts_path, flash: { notice: "「#{@company_post.title}」の掲示板が削除されました"}
  end

  private

  def company_post_params
    params.require(:company_post).permit(:title, :content).merge(company_id: current_company.id)
  end

  def set_target_company_post
    @company_post = CompanyPost.find(params[:id])
  end
end
