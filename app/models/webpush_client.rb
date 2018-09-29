require 'webpush'
class WebpushClient
  def self.public_key
    return ENV['VAPID_PUBLIC_KEY']
  end

  def self.public_key_bytes
    Base64.urlsafe_decode64(public_key).bytes
  end

  def self.private_key
    return ENV['VAPID_PRIVATE_KEY']
  end

  # Send webpush message using subscription parameters
  #
  # @param message [String] text to encrypt
  # @param subscription_params [Hash<Symbol, String>]
  # @option subscription_params [String] :endpoint url to send encrypted message
  # @option subscription_params [Hash<Symbol, String>] :keys auth keys to send with message for decryption
  # @return true/false
  def send_notification(message, endpoint: "", p256dh: "", auth: "")
    raise ArgumentError, ":endpoint param is required" if endpoint.blank?
    raise ArgumentError, "subscription :keys are missing" if p256dh.blank? || auth.blank?

    puts("Sending WebPush notification...............")
    puts("message: #{message}")
    puts("endpoint: #{endpoint}")
    puts("p256dh: #{p256dh}")
    puts("auth: #{auth}")

    puts("public_key_bytes #{public_key}")
    puts("private_key #{private_key}")
    
    Webpush.payload_send(
      message: message,
      endpoint: endpoint,
      p256dh: p256dh,
      auth: auth,
      vapid: {
        subject: "mailto:ishwar@initcoders.com",
        public_key: public_key.to_s,
        private_key: private_key.to_s
      })
  end

  def public_key
    self.class.public_key
  end

  def private_key
    self.class.private_key
  end
end
