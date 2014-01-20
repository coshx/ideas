class Api::VotesController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery except: [:create, :destroy]

  def create
    v = current_user.votes.where(idea_id: params[:id]).first
    idea = Idea.find(params[:id])
    if v
      idea.upvotes = idea.upvotes - 1
      v.destroy
      result = {destroyed: true}
    else
      idea.upvotes = idea.upvotes + 1
      v = current_user.votes.create(idea_id: params[:id])
      result = v
    end
    idea.save!    
    Notification.generate(current_user, v) if v.present?
    render json: result.to_json
  end

  def destroy
    v = current_user.votes.where(idea_id: params[:id]).first.destroy
    render json: {success: true}
  end

end