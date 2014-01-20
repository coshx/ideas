class IdeasController < ApplicationController
  before_filter :authenticate_user!

  def show
    @idea = Idea.find(params[:id])
  end
end