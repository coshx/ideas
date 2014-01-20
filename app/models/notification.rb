class Notification < ActiveRecord::Base
    belongs_to :user
    belongs_to :objectable, polymorphic: true

    def self.push(object)

        Pusher['ideas_channel'].trigger('idea_changed', {
              data: object.asjson,
              id: object.id
            })  
    end

    def self.generate(user, object)
        n = Notification.new
        n.objectable = object
        n.user = user
        n.save!
        if n.objectable_type = "Idea"
            UserMailer.new_idea(object).deliver
        end
        if n.objectable_type = "Comment"
            UserMailer.commented(object).deliver
        end
        

    end 

end
