module ManticoreHelper
	
  def hide_flash
    @hide_flash = true
  end
  
  def hide_flash?
    @hide_flash
  end
  
  def title(value)
    content_for(:title) { h(value.to_s) }
    value
  end
  
  def meta_description(value)
    @meta_description = value
  end
  
  def meta_tags(value)
    @meta_tags = value
  end
  
end
