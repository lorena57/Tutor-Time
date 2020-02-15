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
            session[:student_id] = @student.id
            redirect_to @student
        else
            render :new
        end
    end

    private

    def student_params
        params.require(:student).permit(:username, :email, :password)
    end



end
