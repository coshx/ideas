class Vote < ActiveRecord::Base
  belongs_to :admin
  belongs_to :idea
end
