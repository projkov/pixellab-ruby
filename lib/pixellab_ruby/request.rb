require 'net/http'
require 'json'
require 'uri'

module PixellabRuby
  class Request
    SERVER_URL = "https://api.pixellab.ai/v1"

    def initialize(api_key, path)
      @api_key = api_key
      @path = path
      @uri = nil
      @http = nil
      @request = nil
      @data = nil

      after_initialize
    end

    def post(body)
      @request = Net::HTTP::Post.new(@uri.path, {'Content-Type' => 'application/json'})
      @request.body = body.to_json
      add_authorization_header
      execute_request
    end

    def get
      @request = Net::HTTP::Get.new(@uri.path)
      add_authorization_header
      execute_request
    end

    private

    def add_authorization_header
      @request['Authorization'] = "Bearer #{@api_key}"
    end

    def after_initialize
      prepare_uri
      prepare_http
    end

    def execute_request
      response = @http.request(@request)
      @data = JSON.parse(response.body)
    end

    def prepare_uri
      @uri = URI(SERVER_URL + @path)
    end

    def prepare_http
      @http = Net::HTTP.new(@uri.host, @uri.port)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
  end
end