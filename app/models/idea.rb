class Idea < ActiveRecord::Base
  belongs_to :admin
  has_many :comments
end
