class User < ActiveRecord::Base

  after_initialize :defaults

  def defaults
    self.created_at = Date.now
    self.updated_at =Date.now
  end
end
