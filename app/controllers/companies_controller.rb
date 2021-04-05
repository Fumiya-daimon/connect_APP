class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    if user_signed_in?
      @company = Company.find(params[:id])
      @user = current_user
      rooms = current_user.companyrooms
      @company_ids = []
      rooms.each do |r|
        @company_ids << r.company_id
      end
    elsif company_signed_in?
      @company = Company.find(params[:id])
    end
  end
end
