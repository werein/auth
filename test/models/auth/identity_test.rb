require 'test_helper'

module Auth
  describe Identity do 
    before do
      OmniAuth.config.test_mode = true 
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        provider: 'twitter',
        uid:      '12345',
        info: {
          name:   'Steve Jobs'
        }
      })
    end

    let(:auth_twitter) { OmniAuth.config.mock_auth[:twitter] }

    it "should invoke to user, when current user doesn't exist" do 
      auth = OmniAuth.config.mock_auth[:twitter] # Load mock omniauth hash

      User.expects(:from_omniauth).with(auth_twitter)
      Identity.from_omniauth auth_twitter, nil
    end 
  end
end