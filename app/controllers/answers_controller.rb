class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.post_id = params[:post_id]
    @answer.company_id = current_company.id
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content, :post_id)
  end

end
