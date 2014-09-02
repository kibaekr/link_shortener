class LinkHit < ActiveRecord::Base
  belongs_to :link
  validates_presence_of :ip_address #could this be bad, if client browser is blocking ip_address?  
end