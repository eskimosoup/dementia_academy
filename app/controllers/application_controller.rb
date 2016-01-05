class ApplicationController < ActionController::Base
	
  protect_from_forgery
  
  before_filter :fetch_events, :only => [:index, :accessibility, :site_map, :contact, :thank_you]
  
  layout "application_with_right", :only => [:index, :accessibility, :site_map, :contact, :thank_you]
  
  def index
		@page = Page.select{|page| page.home_page?}.first
		@current_leaf = Willow::StaticPage.find_by_name("Home")
		render :layout => @page.layout
	end
  
  def accessibility
		@branches = Willow::Branch.access_key.order(:access_key)
  end
  
  def site_map
		@branches = Willow::Branch.where(tree: "Main").order(:positions_depth_cache)
	end
  
  def contact
		@page = Page.select{|page| page.contact_page?}.first
		@current_leaf = Willow::StaticPage.find_by_name("Contact Us")
		if request.post?
			if params[:name].blank? || params[:enquiry].blank? || (params[:tel].blank? && params[:email].blank?)
				flash[:alert] = "Fields marked with an asterisk (*) are required. Either a telephone number or email address must be provided."
			else
				Mailer.contact(params[:name], params[:tel], params[:email], params[:enquiry]).deliver
				flash[:notice] = "Thank you for your enquiry."
				redirect_to thank_you_path
			end
		end
  end
  
  def thank_you
		flash[:notice] = "Thank you for contacting us. We will be back in touch soon."
  end
  
	private
		
		def fetch_events
			@events = Event.active[0..1]
		end
		
end
