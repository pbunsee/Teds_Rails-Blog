#for retrieving the image from the remote url
require 'open-uri' 

class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo,
                    :styles => {:sprite => "20x20#", :thumb => "70x70#", :small => "100x100>"},
                    :url => "/assets/:id/:style/:basename.:extension",
                    :default_url => ":style/dumbbell.jpg",
                    :path => ":rails_root/public/assets/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  #pull the image from the remote url and assign it as the avatar
  #def photo_from_url(url)
    #self.photo = open(url)
  #end

  #before_validation :download_remote_image, :if => :photo_url_provided?
 
  #validates_presence_of :photo_remote_url, :if => :photo_url_provided?, :message => 'is invalid or inaccessible'
    
  private
  
  def photo_url_provided?
    #!self.photo_url.blank?
    photo_url.blank?
  end
  
  def download_remote_photo
    io = open(URI.parse(photo_url))
    self.original_filename = io.base_uri.path.split('/').last
    self.photo = io
    self.photo_remote_url = photo_url
  #rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end
  
end
