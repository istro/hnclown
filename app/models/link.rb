class Link < ActiveRecord::Base
  belongs_to :users
  attr_accessible :rank, :title, :url

  before_create :prepend_http


  private
  def prepend_http
    self.url = "http://#{self.url}" unless self.url =~ /^http:\/\//
  end
end
