class EventsController < ApplicationController
	
	layout "application"
	
  def index
		@events = Event.active.page(params[:page]).per(10)
		@current_leaf = Willow::StaticPage.find_by_name("Events")
  end
	
  def show
		@event = Event.find(params[:id])
    unless @event.meta_description.blank?
			@meta_description = @event.meta_description
		end
		unless @event.meta_tags.blank?
			@meta_tags = @event.meta_tags
    end
  end
	
end
