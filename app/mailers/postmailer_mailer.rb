class PostmailerMailer < ApplicationMailer

    def post_send_mail(user)
        @user = user
        mail to: "@user.gmail.com", subject: "Confirming Mail for Posting Successful!"
      end

end
