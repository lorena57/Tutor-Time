class TutorsController < ApplicationController

    def index
        @tutors = Tutor.all
    end

    def show
        @tutor = Tutor.find_by(id: params[:id])
    end

    def new
        @tutor = Tutor.new
    end

    def create
        @tutor = Tutor.create(tutor_params)
        if @tutor.save
            flash[:success] = "New tutor added"
            redirect_to appointment_path(@appointment)
        else
            flash[:danger] = "Appointment could not be made"
            redirect_to new_appointment_path
        end
    end

    def search
        @appointments = Appointment.seach(params[:query])
        render :index
    end

    private

    def appointment_params
        params.require(:appointment). permit(:appointment_time)
    end

end
