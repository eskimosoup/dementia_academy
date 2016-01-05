module ApplicationHelper
	
  def shorten(text, length=150)
    if text.length > length
      text[0..length].split[0..-2].join(' ') + '...'
    else
      text
    end
  end
	
end
