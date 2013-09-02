class Tag < ActiveRecord::Base

  before_save { |tag| tag.name.downcase! }

  has_and_belongs_to_many :plates

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.tokens(query)
    tags = where("name like ?", "%#{query.downcase}%")
    if tags.empty?
      [{id: "#{query.capitalize}", name: "New: #{query.capitalize}"}]
    else
      tags.each{|tag| tag.name.capitalize! }
    end
  end
end

