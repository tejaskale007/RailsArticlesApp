module ApplicationHelper

    def gravatar_for(user,options = {size: 80})
        emailAddress = user.email.downcase 
        hash = Digest::MD5.hexdigest(emailAddress)
        size = options[:size]
        gravatarUrl = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatarUrl, alt: user.username)
    end

    def current_user
        if session[:user_id] 
            @current_user ||= User.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user #current user is present or not, that will be returened in boolean form using !!
    end
end
