class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  has_many :votes
  has_many :comments
  has_many :notification, as: :objectable

  cattr_accessor :current_user
  has_and_belongs_to_many :tags, join_table: "ideas_tags"

  def voted
    if current_user.present?
      votes.where(:user_id => current_user.id).any?
    end
  end

  def json
  	self.to_json(include: [{user: {only: [:name, :id, :image_url]}}, {comments: {include: {user: {only: [:name, :image_url]}}}}], methods: [:voted])
  end

  def asjson
  	self.as_json(include: [{user: {only: [:name, :id, :image_url]}}, {comments: {include: {user: {only: [:name, :image_url]}}}}], methods: [:voted])
  end

end
