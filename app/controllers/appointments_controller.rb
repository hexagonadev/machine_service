class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    appointment = Appointment.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Appointments#Index </h1>" }
      format.json { render json: appointment }
    end
  end

  def show
    appointment = Appointment.find_by(id: params[:id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Appointments#Show </h1>" }
      format.json { render json: appointment }
    end
  end

  def create
    #user = Appointments.find_by(id: params[:user_id])
    appointment = Appointment.new(appointment_params)

    if appointment.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: appointment }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: appointment.errors.full_messages }
    end
  end

  def update
    appointment = Appointment.find_by(id: params[:id])

    if Appointment.update(appointment_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: appointment }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: appointment.errors.full_messages }
      end
    end
  end

  private

  def appointments_params
    params.require(:appointment).permit(:description, :status)
  end
end