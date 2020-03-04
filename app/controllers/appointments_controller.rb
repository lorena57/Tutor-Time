class AppointmentsController < ApplicationController


    def index
        if params[:student_id]
            @student = Student.find(params[:student_id])
            @appointments = current_student.appointments
            @app = Appointment.all
        else
            redirect_to root_url
        end
    end

    def new
        @student = Student.find(params[:student_id])
        @appointment = @student.appointments.new
    end




    def create
        @student = Student.find(params[:student_id])
        @appointment = current_student.appointments.new(appointment_params)
        # @appointment.student = Student.find_by(id: params[:student_id])
        if @appointment.save
            flash[:success]= "Appointment created"
            redirect_to student_path(@student)
        else
            flash.now[:danger] = "Appointment could not be made."
            render :new
        end
    end

    def show
        @appointment = @student.appointments.find(params[:id])
    end

    def edit
        @appointment = current_student.appointments.find_by(params[:id])
        @student = Student.find(params[:student_id])
    end

    def update
        @appointment = current_student.appointments.find_by(params[:id])
        @appointment.update(appointment_params)
        if @appointment.save
            flash[:success] = 'Appointment updated'
            redirect_to student_path(params[:student_id])
            else
            render 'edit'
        end
    end



    def destroy
        #Keep method and dry 
        @appointment = current_student.appointments.find_by(params[:id])
        if @appointment
            @appointment.destroy    
            flash[:success] = "Your appointment has been deleted"
            redirect_to student_path(current_student)
        else
            flash[:danger] = "You do not have access to delete others appointments"
            redirect_to student_path(current_student, @appointment)
        end
    end

    private

    def appointment_params
        params.require(:appointment).permit(:appointment_time, :tutor_id)
    end

end
