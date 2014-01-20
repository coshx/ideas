module ApplicationHelper
  def jsonize(ideas)
    ideas.to_json(include: [:tags, :status, {user: {only: [:name, :id, :image_url]}}, {comments: {include: {user: {only: [:name, :image_url]}}}}], methods: [:voted])
  end
end
