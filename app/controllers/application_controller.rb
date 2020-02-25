class ApplicationController < ActionController::Base

    include SessionsHelper

    def logged_in_student
        unless logged_in?
            flash[:danger] = "Please log in."
                redirect_to login_url
        end
    end

    

end
