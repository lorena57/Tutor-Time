class AppointmentsController < ApplicationController

    before_action :logged_in_student, only: [:create, :destroy]

    def index
        if params[:student_id]
            @student = Student.find(params[:student_id])
            @appointments = current_student.appointments
        else
            redirect_to root_url
        end
    end

    def new
        @student = Student.find(params[:student_id])
        @appointment = @student.appointments.new
    end


    def create
        @appointment = current_student.appointments.build(appointment_params)
        if @appointment.save
            flash[:success]= "Appointment created"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    # def create
    #     @student = Student.find(params[:student_id])
    #     @appointment = @student.appointments.new(appointment_params)
    #     @appointment.student = Student.find_by(id: params[:student_id])
    #     if @appointment.save
    #         flash[:success]= "Appointment created"
    #         redirect_to student_appointments_path(@student)
    #     else
    #         flash[:danger] = "Appointment could not be made."
    #         render :new
    # end

    def show
        # @appointment = Appointment.find(params[:id])
        @appointment = @student.appointments.find(params[:id])

    end




    # def edit
    #     @appointment = Appointment.find(params[:id])
    # end

    def edit
        @appointment = current_student.appointments.find(params[:id])
        @student = Student.find(params[:student_id])
    end

    # def update
    #     @appointment = Appointment.find(params[:id])
    #     @appointment.update(appointment_params)
    #     redirect_to student_appointment(@appointment)
    # end

    def update
        @student = Student.find(params[:student_id])
        @appointment = Appointment.find(params[:id])
        
    end

    # def destroy
    #     Appointment.find(params[:id]).destroy
    #     flash[:success] = "Appointment deleted"
    #     redirect_to appointment_url
    # end




    private

    def appointment_params
        params.require(:appointment).permit(:appointment_time)
    end
end
