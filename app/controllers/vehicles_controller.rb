class VehiclesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @vehicles = if params[:search]
                  Vehicle.where(vin: params[:search][:vin])
                else
                  Vehicle.where(user_id: params[:user_id])
               end

    if @vehicles.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Update </h1>" }
        format.json { render json: { error: "Este Vehiculo no existe" }  , status: :bad_request and return }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Index </h1>" }
        format.json
      end
    end
  end

  def show
    @vehicle = Vehicle.find_by(id: params[:id])

    if @vehicle.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Update </h1>" }
        format.json { render json: { error: "Este Vehiculo no existe" }  , status: :bad_request and return }
      end
    else

      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Show </h1>" }
        format.json #{ render json: vehicle }
      end
    end
  end

  def create
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        # format.json { render 'vehicles/show.json.jbuilder' }
        # format.json { render 'users/find_user_error.json.jbuilder', status: :bad_request and return }
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    end
    @vehicle = @user.vehicles.build(vehicle_params)

    # vehicle = Vehicle.new(vehicle_params)
    # vehicle.user_id = user.id
    # vehicle.user = user
    #puts "AHASDASDASDASD => #{@vehicle}"
    if @vehicle.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>" }
        format.json #{ render :show }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>" }
        format.json #{ render json: @vehicle.errors.full_messages}
      end
    end
  end

  def update
    @vehicle = Vehicle.find_by(id: params[:id])

    if @vehicle.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Update </h1>" }
        format.json { render json: { vehicle: "Este Vehiculo no existe" }  , status: :bad_request and return }
      end
    end

    if @vehicle.update(vehicle_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello  vehicles#update </h1>" }
        format.json { render :create}
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello vehicles#update </h1>" }
        format.json { render :create }
      end
    end
  end

  def destroy
    @vehicle = Vehicle.find_by(id: params[:id])

    if @vehicle.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Destroy </h1>" }
        format.json { render json: { vehicle: "Este Vehiculo no existe" }  , status: :bad_request and return }
      end
    end

    if @vehicle.destroy
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Destroy </h1>" }
        format.json #{ render json: vehicle }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Destroy </h1>" }
        format.json #{ render json: @vehicle.errors.full_messages }
      end
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:kind, :brand, :model, :engine_size, :year, :color, :vin)
  end
end