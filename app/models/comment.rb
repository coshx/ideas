class Comment < ActiveRecord::Base
  belongs_to :admin
  belongs_to :idea

  before_save :notify

  def notify
  	UserMailer.commented(self).deliver
  end	

	def push(action)
		Pusher['ideas_channel'].trigger('comment_changed', {
					action: action,
		      data: self.as_json,
		    })	
	end

end
