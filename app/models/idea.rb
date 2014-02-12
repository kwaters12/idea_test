class Idea < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "post_missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :discussions
  belongs_to :user
end