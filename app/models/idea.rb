class Idea < ActiveRecord::Base
  belongs_to :admin
  has_many :votes
  has_many :comments
  cattr_accessor :current_admin
  has_and_belongs_to_many :tags, join_table: "ideas_tags"

  def voted
    if current_admin.present?
      votes.where(:admin_id => current_admin.id).any?
    end
  end

  def json
  	self.to_json(include: [{admin: {only: [:name, :id, :image_url]}}, {comments: {include: {admin: {only: [:name, :image_url]}}}}], methods: [:voted])
  end

  def asjson
  	self.as_json(include: [{admin: {only: [:name, :id, :image_url]}}, {comments: {include: {admin: {only: [:name, :image_url]}}}}], methods: [:voted])
  end

end
