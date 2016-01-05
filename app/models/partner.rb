class Partner < ActiveRecord::Base
	
	mount_uploader :image, PartnerImageUploader
	
	validates :title,
		{:presence => true}
	validates :web,
		{:format => {:with => /^(|https?:\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?)$/i}} unless Proc.new{|partner| partner.web.blank?}
	validates :summary,
		{:length => {:maximum => 500}}
	
	default_scope :order => "position"
	scope :active, :conditions => {:display => true}
	
end
