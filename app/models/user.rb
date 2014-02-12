class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :discussions

  has_many :votes

  has_many :joins, dependent: :destroy
  has_many :ideas, through: :joins


  def name_display
    if first_name || last_name
      "#{first_name} #{last_name}".strip
    else
      email
    end
  end

  def vote_for idea
    Vote.where(idea: idea, user: self).first
  end

  def join_for idea
    joins.where(idea_id: idea.id).first
  end

  def has_joined? idea
    joined_ideas.include? idea
  end

end
