class Tag < ActiveRecord::Base

  has_and_belongs_to_many :plates

  validates_presence_of :name

  def self.tokens(query)
    tags = where("name like ?", "%#{query.capitalize}%")
    if tags.empty?
      [{id: "#{query.capitalize}", name: "New: #{query.capitalize}"}]
    else
      tags
    end
  end

end