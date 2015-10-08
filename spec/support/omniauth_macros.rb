module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:twitter] = {
      'provider' => 'twitter',
      'uid' => '123545',
      'user_info' => {
        'name' => 'mockuser',
        'image' => 'assets/Rails.png'
      },
      'credentials' => {
        'token' => '50235474-NQezNFqMVjDvEWFRlqJL8GriLEf6VnWEcdiQ5Ua1O',
        'secret' => 'm3vbxbKD6jfq3Ah6qCguuKwLemg0weQxv4HVtSwfhCDCz'
      }
    }
  end
end
