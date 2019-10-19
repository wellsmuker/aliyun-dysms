# frozen_string_literal: true

require "aliyun/dysms/version"
require "aliyunsdkcore"

module Aliyun
  module Dysms
    class Configuration
      attr_accessor :access_key_id, :access_key_secret, :action,
                    :region_id, :sign_name, :api_version

      def initialize
        @access_key_id     = ""
        @access_key_secret = ""
        @sign_name         = ""
        @action            = "SendSms"
        @region_id         = "cn-hangzhou"
        @api_version       = "2017-05-25"
      end
    end # class Configuration

    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def send(phone_numbers, template_code, template_param, out_id = "")
        @response = client.request(
          action: configuration.action,
          params: {
            "RegionId": configuration.region_id,
            "SignName": configuration.sign_name,
            "PhoneNumbers": phone_numbers,
            "TemplateCode": template_code,
            "TemplateParam": template_param,
            "OutId": out_id
        },
          opts: {
            method: "POST"
          }
        )
      rescue StandardError => e
        { Code: "BadRequest", Message: "Request failed: #<#{e.class}: #{e.message}>" }
      end

      def client
        @client ||= RPCClient.new(
          access_key_id:     configuration.access_key_id,
          access_key_secret: configuration.access_key_secret,
          api_version:       configuration.api_version,
          endpoint:          "https://dysmsapi.aliyuncs.com"
        )
      end

      attr_reader :response
    end # class << self
  end # module Dysms
end # module Aliyun
