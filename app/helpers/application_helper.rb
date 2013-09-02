module ApplicationHelper

  def unique_instagram_urls_for(user)
    instagrams = []
    page_1 = Instagram.user_recent_media(user.uid)
    instagrams << page_1

    page_1_max_id, page_2_max_id = true, true
    while (page_2_max_id && page_1_max_id)
      page_2_max_id = page_1.pagination.next_max_id
      page_2 = Instagram.user_recent_media(user.uid, :max_id => page_2_max_id ) unless page_2_max_id.nil?
      instagrams << page_2 unless page_2_max_id.nil?
      page_1_max_id = page_2.pagination.next_max_id
      page_1 = Instagram.user_recent_media(user.uid, :max_id => page_1_max_id ) unless page_1_max_id.nil?
      instagrams << page_1 unless page_1_max_id.nil?
    end
    instagrams.flatten!(1)

    instagram_urls = instagrams.map {|instagram| instagram.caption ? [instagram.images.standard_resolution.url, instagram.caption.text] : [instagram.images.standard_resolution.url, "<Untitled>"]}
    plate_urls = Plate.all.map {|plate| plate.url}
    instagram_urls.select {|instagram_url, caption| !(plate_urls.include?(instagram_url)) }
  end

  def drooled?(plate)
    drool = Drool.find_by_user_id_and_plate_id(current_user.id, plate.id)
    return drool ? drool.drool_status : false
  end

end
