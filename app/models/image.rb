class Image < ActiveRecord::Base

  belongs_to :user

  validates :url, presence: true

end
