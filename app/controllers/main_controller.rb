class MainController < ApplicationController
  def index    
    @ideas = Idea.all
    if @ideas.any?
      Idea.current_admin = current_admin
    end
  end
end
