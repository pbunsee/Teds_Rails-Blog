#for retrieving the image from the remote url
require 'open-uri' 

class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo,
                    :styles => {:thumb => "70x70#", :small => "100x100>"},
                    :url => "/assets/:id/:style/:basename.:extension",
                    :default_url => "dumbbell.jpg",
                    :path => ":rails_root/public/assets/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  #pull the image from the remote url and assign it as the avatar
  def photo_from_url(url)
    self.photo = open(url)
  end

end
