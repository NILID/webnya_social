class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :bg
  validates_attachment :bg, :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/gif", "image/png", "image/pjpeg", "image/x-png" ] },
                                 :size => { :in => 0..5.megabytes }

  has_attached_file :bg, :styles => { :large => "1024x768#", :thumb => "100x100#"}, :convert_options => {:large => "-quality 65"}



end
