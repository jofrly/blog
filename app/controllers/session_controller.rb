class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by("username like ?", session_params[:username])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id

      redirect_to root_path
    else
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
