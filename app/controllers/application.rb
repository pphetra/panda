# all your other controllers should inherit from this one to share code.
class Application < Merb::Controller
  # Auth plugin
  attr_accessor :user
  
  def index
    redirect "/dashboard"
  end

private

  def require_login
    provides :json
    unless params[:account_key] == Panda::Config[:api_key]
      response_string = {:error => "InvalidAccountKey"}.to_json
      throw :halt, render(response_string, :status => 401) 
    end
  end
	
	def swfobject2_link
	 	"<script type=\"text/javascript\" charset=\"utf-8\" src= \"#{request.protocol}://#{request.host}/javascripts/swfobject2.js\"><\/script>"
	end
end  