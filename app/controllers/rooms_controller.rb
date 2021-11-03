class RoomsController < ApplicationController
  before_action :baria_user, only: [:edit, :update, :destroy]
  before_action :login_check, only: [:edit, :update, :destroy,:show,:create]
  
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :rooms
    else
      render :"new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: @room.user_id)
    @reservation = Reservation.new
    if @reservation.start_date == nil
      render :"show"
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to :rooms
    else
      render :edit
    end
  end



  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "登録済みroomを削除しました"
    redirect_to :rooms
  end
  

  private

  def room_params
    params.require(:room).permit(:room_name, :introduction, :price, :adress, :room_image)
  end

  def baria_user
    unless Room.find(params[:id]).user.id.to_i == current_user.id
        redirect_to rooms_path(current_user)
    end
  end

  def login_check
    unless user_signed_in? 
      redirect_to new_user_session_path
    end
  end

end
