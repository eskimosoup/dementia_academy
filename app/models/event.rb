class Event < ActiveRecord::Base
	
	mount_uploader :image, EventImageUploader
	
	default_scope  :order => "date_start DESC"
	scope :active, :conditions => ["display = ?", true]
	
	before_validation do |event|
		event.date_end = event.date_start if event.date_end.to_s.blank?
	end
	
	validates :title,
		{:presence => true}
	validates :venue,
		{:presence => true}
	validates :summary,
		{:presence => true,
		 :length => {:maximum => 500}}
	validates :content,
		{:presence => true}
	validates :price,
		{:numericality => true, :if => Proc.new{|event| !event.price.blank?}}
	validate :dates
	
  def dates
		errors[:base] << "Start date must be before the end date" if (date_start > date_end)
	end
	
	def is_free?
		price.to_f <= 0
	end
	
	def proper_price
		is_free? ? "FREE" : ActionController::Base.helpers.number_to_currency((price * 100), :unit => "&pound;")
	end
	
  def meta_tags=value
    self[:meta_tags] = value.strip.blank? ? nil : value
  end
  
  def meta_description=value
    self[:meta_description] = value.strip.blank? ? nil : value
  end
	
end
