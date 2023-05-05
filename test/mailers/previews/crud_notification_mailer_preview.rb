# Preview all emails at http://localhost:3000/rails/mailers/crud_notification_mailer
class CrudNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crud_notification_mailer/create_notification
  def create_notification
    CrudNotificationMailer.with(user: User.first, question: Question).create_notification
  end
end
