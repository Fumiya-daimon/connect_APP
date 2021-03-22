class CompanyroomsController < ApplicationController

  def create
    if user_signed_in?
      #userがログインしてたらuser_idを, companyがログインしてたらcompany_idを@roomにいれる
      @room = Companyroom.new(room_company_params)
      @room.user_id = current_user.id
    elsif company_signed_in?
      @room = Companyroom.new(room_user_params)
      @room.company_id = current_company.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  def show
    @room = Companyroom.find(params[:id]) #ルーム情報の取得
    @message = Companymessage.new #新規メッセージ投稿
    @messages = @room.companymessages #このルームのメッセージを全て取得
    if user_signed_in?
      if @room.user.id == current_user.id
          @company = @room.company
      else
        redirect_to "/"
      end
    elsif company_signed_in?
      if @room.company.id == current_company.id
          @user = @room.user
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
  end

  private
  def room_company_params
    params.require(:companyroom).permit(:company_id)
  end

  def room_user_params
    params.require(:companyroom).permit(:user_id)
  end

end
