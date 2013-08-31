module ApplicationHelper

  def unique_instagram_urls_for(user)
    instagrams = Instagram.user_recent_media(user.uid)
    instagram_urls = instagrams.map {|instagram| instagram.caption ? [instagram.images.standard_resolution.url, instagram.caption.text] : [instagram.images.standard_resolution.url, "<Untitled>"]}
    plate_urls = Plate.all.map {|plate| plate.url}
    instagram_urls.select {|instagram_url, caption| !(plate_urls.include?(instagram_url)) }
  end

end
