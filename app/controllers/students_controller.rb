class StudentsController < ApplicationController

    before_action :logged_in_student, only: [:index, :edit, :update, :destroy]
    before_action :correct_student, only: [:edit, :update]
    before_action :admin_student, only: :destroy

    def index
        @students = Student.all
    end

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

    end

    def edit
        @student = Student.find(params[:id])
    end   
    
    def update
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
            flash[:success] = 'Profile updated'
            redirect_to @student
        else
            render 'edit'
        end
    end

    def destroy
        Student.find(params[:id]).destroy
        flash[:success] = "Student deleted"
        redirect_to students_url
    end


    

    private

        def student_params
            params.require(:student).permit(:username, :email, :password)
        end

        def logged_in_student
            unless logged_in?
                flash[:danger] = "Please log in."
                redirect_to login_url
             end
        end

        def correct_student
            @student = Student.find(params[:id])
            redirect_to(root_url) unless current_student?(@student)
        end

        def admin_student
            redirect_to(root_url) unless current_student.admin?
        end
        





end
