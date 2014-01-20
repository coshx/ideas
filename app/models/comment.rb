class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  has_many :notification, as: :objectable

  #before_save :notify

  def notify
  	Notification.generate(self.user, self)
  	#UserMailer.commented(self).deliver
  end	

	def push(action)
		Pusher['ideas_channel'].trigger('comment_changed', {
					action: action,
		      data: self.as_json,
		    })	
	end

end
