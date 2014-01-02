class Idea < ActiveRecord::Base
  belongs_to :admin
  has_many :votes
  has_many :comments
  cattr_accessor :current_admin

  def voted
    if current_admin.present?
      votes.where(:admin_id => current_admin.id).any?
    end
  end
end
