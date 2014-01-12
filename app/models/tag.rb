class Tag < ActiveRecord::Base
  has_and_belongs_to_many :ideas, join_table: "ideas_tags"
  def self.popular
  	Tag.order("used desc").limit(10)
  end
end
