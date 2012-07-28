class Link  < ActiveRecord::Base
  belongs_to :user
  attr_accessible :rank, :title, :url, :user_id

  before_validation :prepend_www_http
  validates :url, :uniqueness => true

  has_many :votes, :as => :content


  def prepend_www_http
    puts 'starting..'
    if self.url.starts_with? 'http://www'
      self.url
    elsif self.url.starts_with? 'http://'
      self.url = "http://www.#{self.url[7..-1]}"
    elsif self.url.starts_with? 'www.'
      self.url = "http://www.#{self.url[4..-1]}"
    else
      self.url = "http://www.#{self.url}"
    end
    self.url
  end
end
