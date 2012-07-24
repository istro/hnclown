class Link < ActiveRecord::Base
  belongs_to :users
  attr_accessible :rank, :title, :url

  before_validation :prepend_http
  validates :url, :uniqueness => true




  def prepend_http
    self.url = "http://#{self.url}" unless self.url =~ /^http:\/\//
  end
end
