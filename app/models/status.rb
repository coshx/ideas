class Status < ActiveRecord::Base
  has_many :ideas
  has_many :notification, as: :objectable

end
