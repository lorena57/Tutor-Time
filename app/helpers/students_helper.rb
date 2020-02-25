module StudentsHelper

    def gravatar_for(student, options = {size: 80})
        gravatar_id = Digest::MD5::hexdigest(student.email)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: student.username, class: 'gravatar')
    end

end
