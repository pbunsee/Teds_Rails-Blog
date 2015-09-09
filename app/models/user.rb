class User < ActiveRecord::Base

  # the braces are optional in below 3 lines
  #validates_presence_of :username, :password
   validates :username, { uniqueness: { message: "Pick another username" }}
  #validates :password => { confirmation: true, presence: true }

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
