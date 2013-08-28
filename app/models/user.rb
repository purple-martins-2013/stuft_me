class User < ActiveRecord::Base

  has_many :plates

  validates_presence_of :username

end
