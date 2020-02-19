class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(appointment_time)
    end
end
