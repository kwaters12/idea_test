class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea


  validates :user_id, uniqueness: {scope: :idea_id}
  
  scope :up,   -> { where(is_up: true) }
  scope :down, -> { where(is_up: false) }

  after_save :update_idea_vote_count
  after_destroy :update_idea_vote_count

  def is_down?
    !is_up?
  end

  private

  def update_idea_vote_count
    idea.update_vote_count
  end
end
