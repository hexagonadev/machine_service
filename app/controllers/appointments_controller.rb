class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @appointments = if params[:search]
                      Appointment.where(vehicle_id: params[:search][:vehicle_id])
                    else
                      Appointment.where(user_id: params[:user_id])
                    end
      respond_to do |format|
      format.html { render inline: "<h1> Hello Appointments#Index </h1>" }
      format.json
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#show </h1>" }
        format.json { render json: "Cita no registrada", status: 400 and return }
      end
    end

    respond_to do |format|
      format.html { render inline: "<h1> Hello Appointments#Show </h1>" }
      format.json
    end
  end

  def create
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello appointments#Create </h1>", status: :bad_request and return }
        format.json { render json: "Error", status: 400 and return }
      end
    end
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: @appointment.errors.full_messages }
      end
    end
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json { render json: "Esta cita no esta registrada", status: 400 and return }
      end
    end

    if @appointment.update(appointment_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello  appointment#update </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: @appointment.errors.full_messages }
      end
    end
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json { render json: "Esta cita no esta registrada", status: 400 and return }
      end
    end

    if @appointment.destroy
      respond_to do |format|
        format.html { render inline: "<h1> Hello appointments#Destroy </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello appointment#Destroy </h1>" }
        format.json { render json: @appointment.errors.full_messages }
      end
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:description, :appointment_date, :vehicle_id)
  end
end