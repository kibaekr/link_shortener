require 'digest/md5'

class Link < ActiveRecord::Base
  before_save :shortenize_link
  validates_presence_of :original_link

  def shortenize_link
    self.short_link = Digest::MD5.hexdigest(original_link)[0..5]
  end
end
