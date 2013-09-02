class Plate < ActiveRecord::Base
  attr_reader :tag_tokens

  belongs_to :user
  has_many :drools
  has_many :comments

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
    tags.order(:name).each {|tag| value_map << {id: tag.name, name: tag.name.capitalize}}
    value_map
  end

  def add_tags(tags_string)
    tags_string ||= ""
    tags_array = tags_string.split(",")
    tags_array.each do |tag_name|
      add_tag(tag_name)
    end
  end

  def add_tag(tag_name)
    tag_name.downcase!
    return if self.tags.find_by_name(tag_name)
    self.tags << Tag.find_or_create_by(name: tag_name)
  end
end
