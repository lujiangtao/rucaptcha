module RuCaptcha
  class CaptchaController < ActionController::Base
    def index
      return head :ok if request.head?
      session_id = Time.now.to_i
      session[:session_id] = session_id
      headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
      headers['Pragma'] = 'no-cache'
      data = {data: Base64.strict_encode64(generate_rucaptcha), code: 1000, session_id: session_id}
      render json: data.to_json
    end
  end
end
