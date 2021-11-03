class ReservationsController < ApplicationController
  before_action :reservation_chk, only: [:new]
  
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
        redirect_to :reservations
    else
      flash[:notice] = "予約に失敗しました"
      redirect_to room_path(@room)
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約済みroomを削除しました"
    redirect_to :reservations
  end


  private

  def reservation_params
    params.require(:reservation).permit(:user_id,:room_id,:start_date, :end_date, :people,  :total_price)
  end

  def reservation_chk
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(id: @reservation.room_id)
    
    if  @reservation.start_date == nil && @reservation.end_date == nil
      flash[:notice] = "チェックイン日とチェックアウト日が入力されていません"
        render :"rooms/show"
    elsif 
      @reservation.start_date == nil
        flash[:notice] = "チェックアイン日が入力されていません"
        render :"rooms/show"
      elsif
        @reservation.end_date == nil
          flash[:notice] = "チェックアウト日が入力されていません"
          render :"rooms/show"
        elsif
          @reservation.start_date < Date.today
            flash[:notice] = "今日以降の日付を入力してください"
            render :"rooms/show"
          elsif
            @reservation.end_date <= @reservation.start_date
              flash[:notice] = "チェックアウト日にはチェックイン日より後の日付を入力してください"
              render :"rooms/show"
    end
  end


end
