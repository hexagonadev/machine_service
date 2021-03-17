class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @appointments = if params[:search]
                      Appointment.where(vehicle_id: params[:search][:vehicle_id])
                    else
                      Appointment.all
                    end

    if @appointments.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#index </h1>", status: :bad_request and return }
        format.json { render json: { error: "Este vehiculo no tiene cita" }  , status: :bad_request and return }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Index </h1>" }
        format.json
      end
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Update </h1>" }
        format.json { render json: { appointment: "Esta Cita no existe" }  , status: :bad_request and return }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointment#Show </h1>" }
        format.json #{ render json: appointment }
      end
    end
  end

  def create
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    end

    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointment#Create </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json
      end
    end
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Update </h1>" }
        format.json { render json: { appointment: "Esta Cita no existe" }  , status: :bad_request and return }
      end
    end

    if @appointment.update(appointment_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello  appointment#update </h1>" }
        format.json { render :create }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello appointments#update </h1>" }
        format.json { render :create}
      end
    end
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json { render json: { appointment: "Esta Cita no existe" }  , status: :bad_request and return }
      end
    end

    if @appointment.destroy
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json #{ render json: appointment }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json #{ render json: @appointment.errors.full_messages }
      end
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:vehicle_id, :description, :appointment_date)
  end
end