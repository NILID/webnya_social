class Setting < ActiveRecord::Base
  belongs_to :user
#  attr_accessible :bg, :icon_color, :icon_size

  has_attached_file :bg,
      :styles => { :large => "1024x768#", :thumb => "100x100#"},
      :convert_options => {:large => "-quality 65"},
      :default_url => "/assets/default_bg_:style.jpg"


  validates_attachment :bg, :content_type => { :content_type => [ "image/jpg", "image/jpeg", "image/gif", "image/png", "image/pjpeg", "image/x-png" ] },
                     :size => { :in => 0..5.megabytes }
  validates :icon_color, :css_colour => true

  validates_inclusion_of :icon_size, :in => 30..100
  validates_numericality_of :icon_size, :only_integer => true

end
