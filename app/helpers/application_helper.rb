module ApplicationHelper

  def owner_check(current_user, post_user)
    unless current_user.id == post_user.user_id
      redirect_to root_url
    end
  end
end
