class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.with_username(session_params[:username])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, locals: { error: true }
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
