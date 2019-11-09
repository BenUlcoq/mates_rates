module ApplicationHelper
  
  require 'net/http'
  require 'uri'
  require 'json'

  def requestHelper(url, method = 'Get', body = nil)
    header = {
      'Content-Type': 'text/json',
      'Content-Security-Policy': 'default-src *'
    }

    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    # create new request based on method
    request = Net::HTTP.const_get(method.capitalize).new(uri.request_uri, header)
    request.body = body

    # Send the request
    http.request(request) do |response|
      puts uri
      yield(JSON.parse(response.body))
    end
  end

    def current_class?(test_path)
      request.path == test_path ? "active" : ""
    end
  



end
