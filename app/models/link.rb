require 'digest/md5'

class Link < ActiveRecord::Base
  has_many :link_hits

  before_save :shortenize_link
  validates :original_link, url: true, presence: true

  def shortenize_link
    self.short_link = Digest::MD5.hexdigest(original_link)[0..5]
  end
end
