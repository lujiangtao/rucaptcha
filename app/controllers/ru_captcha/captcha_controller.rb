module RuCaptcha
  class CaptchaController < ActionController::Base
    def index
      return head :ok if request.head?
      session_id = Digest::SHA256.hexdigest()
      session[:session_id] = session_id
      headers['session_id'] = session_id
      headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
      headers['Pragma'] = 'no-cache'
      data = generate_rucaptcha
      opts = { disposition: 'inline', type: 'image/gif' }
      send_data data, opts
    end
  end
end
