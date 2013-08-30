class Plate < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :url
  validates_uniqueness_of :url

  before_create :fill_description

  def fill_description
    self.description = "Unnamed" if description == ""
    self.description.capitalize!
  end

end
