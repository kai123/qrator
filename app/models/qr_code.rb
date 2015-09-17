class QrCode < ActiveRecord::Base
	validates :url, presence: true

	before_save :validateUrl 


	def full_url
		uri =  URI.parse(url)
		
		if uri.query.blank?
			new_query_ar = []
		else
			new_query_ar = URI.decode_www_form(uri.query)
		end

		new_query_ar << ["utm_medium", medium] unless medium.blank?
		new_query_ar << ["utm_campaign", campaign] unless campaign.blank?
		new_query_ar << ["utm_source", src] unless src.blank?
		new_query_ar << ["utm_term", term] unless term.blank?
		new_query_ar << ["utm_content", content] unless content.blank?
		
		uri.query = URI.encode_www_form(new_query_ar)
		uri.to_s		
	end

	private
		def validateUrl
			
			self.url = self.url.to_s.strip		
			if self.url[0..6] != 'http://' && self.url[0..7] != 'https://'
				self.url = "http://#{self.url}"			
			end				
		end

end
