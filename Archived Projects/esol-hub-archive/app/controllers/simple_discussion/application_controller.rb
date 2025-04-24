class SimpleDiscussion::ApplicationController < ::ApplicationController
  include Secured
  
  layout "simple_discussion"
  helper_method :user_signed_in?, :current_user # TODO: why is this needed?

  def page_number
    page = params.fetch(:page, "").gsub(/[^0-9]/, "").to_i
    page = "1" if page.zero?
    page
  end

  def is_moderator_or_owner?(object)
    is_moderator? || object.user == current_user
  end
  helper_method :is_moderator_or_owner?

  def is_moderator?
    current_user.respond_to?(:moderator) && current_user.moderator?
  end
  helper_method :is_moderator?

  def require_mod_or_author_for_post!
    unless is_moderator_or_owner?(@forum_post)
      redirect_to_root
    end
  end

  def require_mod_or_author_for_thread!
    unless is_moderator_or_owner?(@forum_thread)
      redirect_to_root
    end
  end

  private

  def redirect_to_root
    redirect_to simple_discussion.root_path, alert: "You aren't allowed to do that."
  end

  def current_user # TODO: we need to check if user exists, and if not, redirect to info page that user needs to be activated on the system first. Check with client on desired flow. 
    if session[:userinfo].present?
      @current_user ||= User.find_or_create_by(email: session[:userinfo]['email']) do |user|
        user.first_name = session[:userinfo]['name'].first # TODO: set first/last if not in database?
        user.last_name = session[:userinfo]['name'].last
        user.email = session[:userinfo]['email']
        # look up ismoderator in a priveleges table? 
        # user.moderator = Privilege.find_by(email: session[:userinfo]['email']).present?

        # save user? Will this overwrite existing user data?
        user.save
      end
    else
      nil
    end
  end
  

  # This helper makes user_signed_in? available in views.
  def user_signed_in?
    if session[:userinfo].present?
      current_user.present?
    else
      false
    end
  end

end
