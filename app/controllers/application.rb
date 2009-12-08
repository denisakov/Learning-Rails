# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fd4cffc11c23c7f3e22b8586edafe095'
  
  include AuthenticatedSystem
  
  before_filter :get_pages_for_tabs
  
  def get_pages_for_tabs
    if logged_in?
      @tabs = Page.find_main
    else
      @tabs = Page.find_main_public
    end
  end
  
  def get_page_metadata
    @page = Page.find_by_name(params[:name])
    @pagetitle = @page.title
  end
end
