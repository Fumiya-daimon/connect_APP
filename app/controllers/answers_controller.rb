class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.company_id = current_company.id
    @answer.post_id = Post.find_by(id: params[:post_id])
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end

end
