class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    if user_signed_in?
      @user = User.find(params[:id])
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    elsif company_signed_in?
      @user = User.find(params[:id])
      rooms = current_company.companyrooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
