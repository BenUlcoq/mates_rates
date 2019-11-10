module ApplicationHelper
  
  # Require Helpers
  require 'net/http'
  require 'uri'
  require 'json'

  # Built in method for helping send requests
  def requestHelper(url, method = 'Get', body = nil)

    # Set header value
    header = {
      'Content-Type': 'text/json',
      'Content-Security-Policy': 'default-src *'
    }

    # Set the uri value based on the url sent through.
    uri = URI(url)
    # Format request
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    # Create new request based on method
    request = Net::HTTP.const_get(method.capitalize).new(uri.request_uri, header)
    request.body = body

    # Send the request
    http.request(request) do |response|
      puts uri
      yield(JSON.parse(response.body))
    end
  end

    # Set the value of a link to active if it is the current page.
    def current_class?(test_path)
      request.path == test_path ? "active" : ""
    end
  
end
