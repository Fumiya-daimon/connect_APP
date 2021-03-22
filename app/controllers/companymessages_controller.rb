class CompanymessagesController < ApplicationController

  def create
    @room = Companyroom.find(params[:companyroom_id])
    @message = Companymessage.new(message_params)
    #メッセージがuserによるものだったらis_user=true, shopによるものだったらis_user=false
    if user_signed_in?
      @message.is_user = true
    elsif company_signed_in?
      @message.is_user = false
    end
    @message.companyroom_id = @room.id
    if @message.save
      redirect_to companyroom_url(@room)
    else
      redirect_to companyroom_url(@room)
    end
  end

  private
  def message_params
    params.require(:companymessage).permit(:content)
  end
end
