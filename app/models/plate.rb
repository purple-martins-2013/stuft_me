class Plate < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :url
  validates_uniqueness_of :url

  before_save 'description ||= "Unnamed"',
              'description.capitalize!'

end
