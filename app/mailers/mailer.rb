class Mailer < ActionMailer::Base
	
  default :to   => SITE_SETTINGS['Email']
  default :from => SITE_SETTINGS['Email']
	
  def contact(name, tel, email, enquiry)
		@name    = name
		@tel     = tel
		@email   = email
		@enquiry = enquiry
    mail :subject => "#{SITE_SETTINGS['Name']} - contact form completed"
  end
	
end
