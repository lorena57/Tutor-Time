class SessionsController < ApplicationController
    
  def new
  end

  def create
    if params[:provider] == 'google_oauth2'
      @student = Student.create_by_google_omniauth(auth)
      session[:student_id] = @student.id
      redirect_to student_path(@student)
    else
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      log_in student
       redirect_to student
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
    end
  end

  def omniauth
    @student = Student.create_by_google_omniauth(auth)
    session[:student_id] = @student.id
    redirect_to student_path(student)
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end