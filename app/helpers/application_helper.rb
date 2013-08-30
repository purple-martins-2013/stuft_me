module ApplicationHelper

  def unique_instagram_urls_for(user)
    instagrams = Instagram.user_recent_media(user.uid)
    instagram_urls = instagrams.map {|instagram| instagram.images.standard_resolution.url}
    plate_urls = Plate.all.map {|plate| plate.url}
    instagram_urls -= plate_urls
  end

end
