class Profile < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # do_not_validate_attachment_file_type :avatar
end
