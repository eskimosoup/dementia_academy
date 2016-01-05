class PartnersController < ApplicationController
	
	layout "application_with_right"
	
  def index
		@partners = Partner.active
		@current_leaf = Willow::StaticPage.find_by_name("Working with Partners")
		@events = Event.active[0..1]
  end
	
  def show
		redirect_to partners_path
  end
	
end
