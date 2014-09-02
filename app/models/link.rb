require 'digest/md5'

class Link < ActiveRecord::Base
  has_many :link_hits

  before_save :shortenize_link
  validates :original_link, url: true, presence: true
  validates :short_link, uniqueness: true

  def shortenize_link
    self.short_link = Digest::MD5.hexdigest(original_link)[0..5]<< Link.count.to_s #append uniq digits to differentiate links with same original link
  end
end
