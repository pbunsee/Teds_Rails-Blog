class User < ActiveRecord::Base

  after_initialize :defaults

  def defaults
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  has_many :posts
  has_many :comments
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
end
