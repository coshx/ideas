class UserMailer < ActionMailer::Base
  default from: 'ideas@coshx.com'

  def new_idea(idea)
    mail(to: user.email, subject: "New idea")
  end

  def commented(comment)
  	@comment = comment
  	@user = comment.idea.admin
  	@author = comment.admin
    mail(to: user.email, subject: "#{author.name} just commented on the idea you posted")
  end

end