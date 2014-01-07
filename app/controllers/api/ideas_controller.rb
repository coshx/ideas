class Api::IdeasController < ApplicationController
  before_filter :authenticate_admin!
  protect_from_forgery except: [:create, :destroy]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.admin_id = current_admin.id
    @idea.save!
    Notification.push(@idea)
    render json: @idea.to_json(include: [{admin: {only: [:name, :id, :image_url]}}, {comments: {include: {admin: {only: [:name, :image_url]}}}}], methods: [:voted])
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])
    if @idea.admin = current_admin
      respond_to do |format|
        if @idea.update_attributes(params[:idea])
          format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @idea.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy if @idea.admin = current_admin


    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end