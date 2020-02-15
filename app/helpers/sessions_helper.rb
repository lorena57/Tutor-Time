module SessionsHelper

    def log_in(student)
        session[:student_id] = student.id
    end


end
