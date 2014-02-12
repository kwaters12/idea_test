class JoinsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_idea

  def create

    if @idea.join_by current_user
      redirect_to @idea, notice: "Thanks for liking the idea"
    else
      redirect_to @idea, notice: "Sorry there was trouble liking your idea."
    end
  end

  def destroy
    if @idea.unjoin_by current_user
      redirect_to @idea, notice: "The idea has been quit successfully."
    else
      redirect_to @idea, notice: "Sorry there was trouble liking your idea."
    end
  end

  private

  def find_idea
    @idea = current_user.ideas.find(params[:idea_id])
  end
end
