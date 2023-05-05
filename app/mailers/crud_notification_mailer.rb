class CrudNotificationMailer < ApplicationMailer

  def create_notification
    @question = params[:question]
    @question_count = @question.class.count

    mail(
      to: email_address_with_name(User.first.email, User.first.email), 
      cc: User.all.pluck(:email), 
      subject: "A new entry for #{@question.class} has been created " 
      )

  end
end
