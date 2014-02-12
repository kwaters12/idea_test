class DiscussionsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :find_discussion, only: [:edit, :update, :show, :destroy]
  before_action :set_idea

  def new 
    @discussion = Discussion.new 
  end

  def create
    @discussion = current_user.discussions.new discussion_params
    @discussion.idea = @idea
    @discussion.user = current_user
    if @discussion.save
      DiscussionMailer.notify_owner(@discussion).deliver
      redirect_to @idea, notice: "Thanks for your contribution!"
    else
      render "ideas/show"
    end
    
  end

  def edit

  end

  def update
    @discussion.update_attributes(discussion_params)
    redirect_to @idea
  end

  def show

  end

  def destroy
    @discussion = Discussion.find(params[:id])
    if @discussion.user == current_user
      @discussion.destroy    
      redirect_to @idea, notice: "Discussion deleted successfully"
    else
      redirect_to @idea, notice: "Not cool man."      
    end
  end

  def discussion_params
    params.require(:discussion).permit([:title, :body, :image])
  end

  private

  def find_discussion
    @discussion = Discussion.find(params[:id])
  end

  def set_idea
    @idea = Idea.find params[:idea_id]
  end
end
