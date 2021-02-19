class UsersController < ApplicationController

  def index
    users = User.all

    respond_to do |format|
      format.html { render inline: "<h1> Hello Rails </h1>" }
      format.json { render json: users }
    end
  end
end
