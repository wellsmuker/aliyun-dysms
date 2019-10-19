# frozen_string_literal: true

RSpec.describe Aliyun::Dysms do
  describe "#Aliyun::Sms" do
    before do
      Aliyun::Dysms.configure do |config|
        config.access_key_id     = "test_access_key_id"
        config.access_key_secret = "test_access_key_secret"
        config.sign_name         = "test_sign_name"
      end
    end

    it "send" do
      phone_numbers  = "15912345678"
      template_code  = "SMS_176030203"
      template_param = { code: "123456" }
      request = Aliyun::Dysms.send(phone_numbers, template_code, template_param)
      expect(request.response["Code"]).to eql("OK")
    end
  end
end
