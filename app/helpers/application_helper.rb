module ApplicationHelper
  def jsonize(ideas)
    ideas.to_json(include: [{admin: {only: [:name, :id]}}, {comments: {include: {admin: {only: [:name]}}}}], methods: [:voted])
  end
end
