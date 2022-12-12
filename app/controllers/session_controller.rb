class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by("lower(username) = ?", session_params[:username].downcase)

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id

      redirect_to root_path
    else
      @error = "Ungültiger Benutzername oder Passwort!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
