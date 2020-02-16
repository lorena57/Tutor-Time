class StudentsController < ApplicationController

    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            log_in @student
            flash[:success]= "Welcome to Tutor-Time!"
            # session[:student_id] = @student.id
            redirect_to @student
        else
            render 'new'
        end

    def edit
        @student = Student.find(params[:id])
    end    

    end

    private

        def student_params
            params.require(:student).permit(:username, :email, :password)
        end



end
