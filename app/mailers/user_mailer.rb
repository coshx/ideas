class UserMailer < ActionMailer::Base
  default from: 'ideas@coshx.com'

  def new_idea(idea)
    @author = idea.user
    @idea = idea
    User.all.each do |u|
      @user = u
      mail(to: u.email, subject: "New idea was posted")
    end
  end

  def commented(comment)
  	@comment = comment
  	@user = comment.idea.user
  	@author = comment.user
    mail(to: @user.email, subject: "#{@author.name} just commented on the idea you posted")
  end

end