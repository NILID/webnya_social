class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :bg

  has_attached_file :bg, :styles => { :large => "1024x768#", :thumb => "100x100#" }

end
