class Plate < ActiveRecord::Base
  attr_reader :tag_tokens

  belongs_to :user
  has_many :drools
  has_and_belongs_to_many :tags

  validates_presence_of :url
  validates_uniqueness_of :url

  before_create :fill_description
  before_create :fill_location

  def fill_description
    self.description = "Unnamed" if description == ""
    self.description.capitalize!
  end

  def fill_location
    self.location = "It's a secret!" if description == ""
    self.location.capitalize!
  end

end
