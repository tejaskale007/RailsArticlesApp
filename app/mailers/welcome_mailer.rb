class WelcomeMailer < ApplicationMailer
    default from: 'tejas.kale@coditas.com'
    # default to: 'ajinath.ghodake@coditas.com'
    default to: 'waino67@ethereal.email'

    def send_welcome_mail(article)
        @article = article
        mail(subject: @article.title , message: @article.description)
    end
end
