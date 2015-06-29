module Helpers
  module OmniAuthStub
    def stub_github(opts = {})
      if Rails.env.test?
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github] if opts[:request]
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
          provider: 'github',
          uid: '123545',
          info: {
            first_name: "Gaius",
            last_name:  "Baltar",
            email:      "test@example.com",
            nickname:   "cyloncollaborator"
          },
          credentials: {
            token: "123456",
            expires_at: Time.now + 1.week
          },
          extra: {
            raw_info: {
              gender: 'male'
            }
          }
        })
      end
    end
  end
end
