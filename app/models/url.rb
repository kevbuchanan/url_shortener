class Url < ActiveRecord::Base
  validates :original, presence: true
  validates :original, format: {with: /^http[s]?/, message: "Must start with http"}
  before_save :generate_shortened_url

  def generate_shortened_url
    
    self.shortened_url = 
  end
end
