class PagesController < ApplicationController
	
  def show
    @page = Page.find(params[:id])
    @current_leaf = @page
    @events = Event.active[0..1]
    unless @page.meta_description.blank?
			@meta_description = @page.meta_description
		end
		unless @page.meta_tags.blank?
			@meta_tags = @page.meta_tags
    end
    render :layout => @page.layout
  end
	
end
