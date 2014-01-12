module ApplicationHelper
  def jsonize(ideas)
    ideas.to_json(include: [:tags, :status, {admin: {only: [:name, :id, :image_url]}}, {comments: {include: {admin: {only: [:name, :image_url]}}}}], methods: [:voted])
  end
end
