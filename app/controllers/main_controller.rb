class MainController < ApplicationController
  before_filter :signed_in?, except: :wrong_domain

  def signed_in?
    if !admin_signed_in?
      redirect_to "/auth/google_oauth2"
    end
  end

  def index
    @ideas = Idea.all
    if @ideas.any?
      Idea.current_admin = current_admin
    end
  end
end
