class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @vehicles = Vehicle.where(user_id: params[:user_id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Vehicles#Index </h1>" }
      format.json
    end
  end

  def show
    @vehicle = Vehicle.find_by(id: params[:id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Vehicles#Show </h1>" }
      format.json
    end

  end

  def create
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        format.json { render json: "Error", status: 400 and return }
      end
    end
    @vehicle = @user.vehicles.build(vehicle_params)

    # vehicle = Vehicle.new(vehicle_params)
    # vehicle.user_id = user.id
    # vehicle.user = user
    if @vehicle.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>" }
        format.json
      end
    end
  end

  def update
    @vehicle = Vehicle.find_by(id: params[:vehicle_id])

    if @vehicle.update(vehicle_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicle#Create </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicle#Create </h1>" }
        format.json { render json: @vehicle.errors.full_messages }
      end
    end
  end

  def destroy
    vehicle = Vehicle.find_by(id: params[:id])

    if vehicle.destroy
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Destroy </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello vehicles#Destroy </h1>" }
        format.json { render json: vehicle.errors.full_messages }
      end
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :engine_size, :year, :color, :vin, :kind)
  end
end