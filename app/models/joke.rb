class Joke < ActiveRecord::Base
	has_attached_file :video,
    processors: lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }
    do_not_validate_attachment_file_type :video

    has_many :user_comments
    belongs_to :user
    has_many :votes
    
    accepts_nested_attributes_for :user_comments
    

end

