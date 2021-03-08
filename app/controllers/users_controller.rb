class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Users#Index </h1>" }
      format.json { render json: users }
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Show </h1>" }
        # format.json { render json: user.to_json }
        # format.json { render 'vehicles/show.json.jbuilder', status: :ok } # EJEMPLO JALADO DE LOS PELOS
        # format.json { render :show, status: :201 }
        format.json
      end
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json #{ render json: @user.errors.full_messages }
      end
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    end

    if @user.update(user_params)
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json { render :create}
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Create </h1>" }
        format.json { render :create}
      end
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user.nil?
      respond_to do |format|
        format.html { render inline: "<h1> Hello Vehicles#Create </h1>", status: :bad_request and return }
        format.json { render json: { user: "Este usuario no existe" }  , status: :bad_request and return }
      end
    end

    if @user.destroy
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Destroy </h1>" }
        format.json
      end
    else
      respond_to do |format|
        format.html { render inline: "<h1> Hello Users#Destroy </h1>" }
        format.json
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email)
  end
end
