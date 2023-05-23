module ApplicationHelper

    def gravatar_for(user,options = {size: 80})
        emailAddress = user.email.downcase 
        hash = Digest::MD5.hexdigest(emailAddress)
        size = options[:size]
        gravatarUrl = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatarUrl, alt: user.username)
    end
end
