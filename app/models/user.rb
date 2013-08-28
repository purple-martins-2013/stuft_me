class User < ActiveRecord::Base

  has_many :images

  validates :username, presence: true

end
