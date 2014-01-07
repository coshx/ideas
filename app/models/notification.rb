class Notification < ActiveRecord::Base
	def self.push(object)
		Pusher['ideas_channel'].trigger('idea_changed', {
		      message: 'hello world',
		      data: object.asjson,
		      id: object.id
		    })	
	end
end
