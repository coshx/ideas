class UserMailer < ActionMailer::Base
  default from: 'ideas@coshx.com'

  def new_idea(idea)
    mail(to: user.email, subject: "New idea")
  end
end