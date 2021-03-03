class AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    appointments = Appointment.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Vehicles#Index </h1>" }
      format.json { render json: appointments }
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])

    respond_to do |format|
      format.html { render inline: "<h1> Hello Appointment#Show </h1>" }
      format.json #{ render json: appointment }
    end
  end

  def create
    user = User.find_by(id: params[:user_id])
    if user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        format.json { render json: "Error", status: 400 and return }
      end
    end

    @appointment = user.appointment.build(appointment_params)

    if @appointment.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointment#Create </h1>" }
        format.json #{ render json: appointment }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Create </h1>" }
        format.json { render json: appointment.errors.full_messages }
      end
    end
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])

    if @appointment.update(appointment_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello  appointment#update </h1>" }
        format.json #{ render json: appointment }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello appointments#update </h1>" }
        format.json { render json: appointment.errors.full_messages }
      end
    end
  end

  def destroy
    appointment = Appointment.find_by(id: params[:id])

    if appointment.destroy
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json { render json: appointment }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Appointments#Destroy </h1>" }
        format.json { render json: appointment.errors.full_messages }
      end
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:vehicle_id, :description, :appointment_date)
  end
end