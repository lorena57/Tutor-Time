class StudentsController < ApplicationController
    before_action :current_student, only: [:index, :edit, :update, :destroy]
    # before_action :logged_in_student, only: [:index, :edit, :update, :destroy]
    # before_action :correct_student, only: [:edit, :update]
    # before_action :admin_student, only: :destroy

    def index
        @students = Student.all.soonest_app
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(student_params)
        if @student.save
            log_in @student
            flash[:success]= "Welcome to Tutor-Time!"
            # session[:student_id] = @student.id
            redirect_to @student
        else
            render 'new'
        end
    end

    def show
        @student = Student.find_by_id(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end   
    
    def update
        @student = Student.find(params[:id])
        @student.update(student_params)
        if @student.save
            flash[:success] = 'Profile updated'
            redirect_to @student
        else
            render 'edit'
        end
    end

    # def destroy
    #     Student.find(params[:id]).destroy
    #     flash[:success] = "Student deleted"
    #     redirect_to @student
    # end


    

    private

        def student_params
            params.require(:student).permit(:username, :email, :password, :admin, :tutor_id)
        end


        def correct_student
            @student = Student.find(params[:id])
            redirect_to(root_url) unless current_student?(@student)
        end

        def admin_student
            redirect_to(root_url) unless current_student.admin?
        end
        





end
