class TutorsController < ApplicationController

    def index
        @tutors = Tutor.all
    end

    def show
        @tutor = Tutor.find(id: params[:id])
    end

    def new
        @tutor = Tutor.new
    end

    def create
        @tutor = Tutor.create(tutor_params)
        if @tutor.save
            flash[:success] = "New tutor added"
            redirect_to 
    end
end
