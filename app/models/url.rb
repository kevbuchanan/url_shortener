class Url < ActiveRecord::Base
  validates :original, presence: true, uniqueness: true
  validates :original, format: {with: /^http[s]?/, message: "Must start with http"}
  before_save :generate_shortened_url

  def add_click
    self.clicks += 1
    self.save
  end
  def generate_shortened_url
    characters = "0123456789abcdefghijklmnopqrstuvwxyz".split(//)
    if Url.last
      id = Url.last.id + 1
    else
      id = 1
    end
    self.shortened_url ||= characters.sample(2).join + (id + 1).to_s + characters.sample(2).join
  end

end
