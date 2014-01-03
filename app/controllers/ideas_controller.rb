class IdeasController < ApplicationController
  before_filter :authenticate_admin!

  def show
    @idea = Idea.find(params[:id])
  end
end