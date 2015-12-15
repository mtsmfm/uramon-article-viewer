require "faraday"

module UramonArticleViewer
  class ApplicationController < ActionController::Base
    BASE_URI = "http://localhost:3000/"

    before_filter :setup_connection

    private

    def setup_connection
      @connection = Faraday::Connection.new(:url => BASE_URI) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Logger
        builder.use Faraday::Adapter::NetHttp
      end
    end
  end
end
