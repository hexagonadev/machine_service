class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    vehicles = Vehicle.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Vehicles#Index </h1>" }
      format.json { render json: vehicles }
    end
  end

  def show
    vehicle = Vehicle.find_by(id: params[:id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Vehicles#Show </h1>" }
      format.json { render json: vehicle }
    end
  end

  def create
    vehicle = Vehicle.new(vehicle_params)

    if vehicle.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>" }
        format.json { render json: vehicle }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>" }
        format.json { render json: vehicle.errors.full_messages }
      end
    end
  end

  def update
    vehicle = Vehicle.find_by(id: params[:id])

    if vehicle.update!(vehicle_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello  vehicles#update </h1>" }
        format.json { render json: vehicle }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello vehicles#update </h1>" }
        format.json { render json: vehicle.errors.full_messages }
      end
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:user_id, :king, :brand, :module, :engine_size, :year, :color, :vin)
  end
end