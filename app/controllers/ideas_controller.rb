class IdeasController < ApplicationController
  before_action :find_idea, only: [:update]
  before_action :authenticate_user!, except: [:index, :show]

  def new 
    @idea = Idea.new 
  end

  def create
    @idea = current_user.ideas.new idea_params
    @idea.save
    redirect_to ideas_path
    #@idea.user = current_user
  end

  def index
    @ideas = Idea.all
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea.update_attributes(idea_params)
    redirect_to ideas_path
  end

  def show
    @idea = Idea.find(params[:id])
    @discussion = Discussion.new
  end

  def destroy
    @idea = Ideas.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  def idea_params
    params.require(:idea).permit([:title, :body, :image])
  end

  private

  def find_idea
    @idea = current_user.ideas.find(params[:id])
  end
end
