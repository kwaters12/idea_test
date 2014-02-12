class Idea < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "post_missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :discussions

  belongs_to :user

  has_many :votes

  has_many :joins, dependent: :destroy
  has_many :users, through: :joins
  has_many :joiners, through: :joins, source: :user

  def update_vote_count
    self.votes_count = votes.up.count - votes.down.count
    save
  end

  def join_by user
    joiners << user 
  end

  def unjoin_by user
    joiners.delete(user) 
  end
end
