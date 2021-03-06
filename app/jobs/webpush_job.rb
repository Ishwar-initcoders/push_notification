class WebpushJob < ActiveJob::Base
  queue_as :default

  def perform(message, params)
    puts "ishwar singh gehlot ============= #{params}"
    client = WebpushClient.new

    log("sending #{message} to #{params[:endpoint]}")
    response = client.send_notification(message, params)
    log(response ? "success" : "failed")    
  end

  def log(message)
    puts("[WebpushClient] #{message}")
  end
end
