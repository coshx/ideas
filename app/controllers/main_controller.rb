class MainController < ApplicationController
  before_filter :signed_in?, except: :wrong_domain

  def signed_in?
    if !user_signed_in?
      redirect_to "/auth/google_oauth2"
    end
  end

  def index
    @tags = Tag.popular
    if params[:tag]
      tag = Tag.find_by title: params[:tag].downcase
      if tag.present?
        @ideas = tag.ideas
      else
        @ideas = []        
      end
    else
      @ideas = Idea.all
    end
    @show_new_idea = params[:show_new_idea] ? true : false
    if @ideas.any?
      Idea.current_user = current_user
    end
  end
end
