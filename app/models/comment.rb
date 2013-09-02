class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :plate

  before_save :check_content

  def check_content
    return false if content == ""
  end

end