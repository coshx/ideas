class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  has_many :notification, as: :objectable

end
