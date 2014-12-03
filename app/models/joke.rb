class Joke < ActiveRecord::Base
	has_attached_file :video,
    processors: lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
    # do_not_validate_attachment_file_type :video
    # validates_format_of :video, :with => %r{\.(mov|mp4)$}, :message => "whatever"
    validates_attachment_content_type :video, :content_type => /\Avideo\/.*\Z/, :message => "w"

	validates :video, :presence => true, :if => "youtube.blank?"
	validates_format_of :youtube, :with => URI::regexp, :if => "video.blank?"
	validates :description, length: { minimum: 5 }, allow_blank: false
	
	

    has_many :user_comments
    belongs_to :user
    has_many :votes
    
    accepts_nested_attributes_for :user_comments
    

end

