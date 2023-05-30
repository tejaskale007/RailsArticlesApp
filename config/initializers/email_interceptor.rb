class EmailInterceptor
    def self.delivering_email(message)
      message.to = ['tejaskale648@gmail.com']
    end
end
  