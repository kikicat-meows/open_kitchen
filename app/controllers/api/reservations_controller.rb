class Api::ReservationsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    @reservations = user.reservations
    @image_urls = []
    @kitchen_names = []
    
    @reservations.each do |reservation|
      kitchen = Kitchen.find_by(id: reservation.kitchen_id)
      @kitchen_names.push(kitchen.name)
      @image_urls.push(kitchen.photos.where(profile_photo: true).pluck(:image_url)[0])
    end

    render :index
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    
    unless Reservation.is_possible?(@reservation)
      render json: ["Sorry this time is no longer available"], status: 422
      return
    end
 
    if @reservation.save
      render :show
    else
      render json: @reservation.errors.full_messages, status: 422
    end
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])

    if @reservation
      kitchen = Kitchen.find_by(id: @reservation.kitchen_id)
      @kitchen_name = kitchen.name
      @profile_img = kitchen.photos[0].image_url
      @time = Timeslot.find_by(id: @reservation.timeslot_id).time
      
      render :show
    else
      render json: ["No reservation found"], status: 404
    end
  end

  def update
    @reservation = Reservation.find_by(id: params[:id])

    if @reservation.update(reservation_params)
      render :show
    else
      render json: @reservation.errors.full_messages, status: 422
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :user_id, 
      :kitchen_id, 
      :timeslot_id, 
      :date, 
      :party_size, 
      :state,
      :optional_request
    )
  end
end
