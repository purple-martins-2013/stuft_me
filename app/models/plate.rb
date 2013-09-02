class Plate < ActiveRecord::Base
  attr_reader :tag_tokens

  belongs_to :user
  has_many :drools
  has_and_belongs_to_many :tags

  validates_presence_of :url
  validates_uniqueness_of :url

  before_create :fill_description
  before_create :fill_location
  before_save :make_tags_unique

  def fill_description
    self.description = "Unnamed" if description == ""
    self.description.capitalize!
  end

  def fill_location
    self.location = "It's a secret!" if description == ""
    self.location.capitalize!
  end

  def make_tags_unique
    self.tags = tags.uniq
  end

  def ordered_tags
    value_map = []
    tags.order(:name).each {|tag| value_map << {id: tag.name, name: tag.name}}
    value_map
  end

end
