class MainController < ApplicationController
  def index
    @ideas = Idea.all
  end
end
