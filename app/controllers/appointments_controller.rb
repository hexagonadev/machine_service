class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Appointments#Index </h1>" }
      format.json
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Appointments#Show </h1>" }
      format.json
    end
  end

  def create
    @appointment = Appointment.new(appointment_params)

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
    params.require(:appointment).permit(:description, :appointment_date)
  end
end