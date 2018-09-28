class CreateNotification < ApplicationRecord
	 validates :endpoint, :p256dh, :auth ,presence: true
end
