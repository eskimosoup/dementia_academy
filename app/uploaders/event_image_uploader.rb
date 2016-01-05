class EventImageUploader < Chronicler::ImageUploader
	
  version :index do
    process :resize_to_fill => [110, 110]
  end
  
  version :show do
    process :resize_to_fit => [220, 1000]
  end
	
	version :home do
    process :resize_to_fill => [70, 70]
  end
	
end
