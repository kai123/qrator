class QrCode < ActiveRecord::Base
	validates :url, presence: true
end
