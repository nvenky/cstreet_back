require 'test_helper'
require 'knock'
require 'jwt'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NzdHJlZXQuYXUuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDU4OGMxNjcwMGJjZjQ0MGZiZGVkNmViMiIsImF1ZCI6IkVaTmYzNm1BYlpmNENGcXBmVVpqZndna1Q3RjRkWmhCIiwiZXhwIjoxNDg1NzI2ODE1LCJpYXQiOjE0ODU2OTA4MTV9.SwdvAycKwDARmLa7DeLY-78OPU5tMmGW3v4rjdqHPbs'

    # puts "#{Rails.application.secrets.auth0_client_secret}"
    # puts "#{Knock.token_secret_signature_key.call}"

    # puts JWT.decode token, 'aAWo0XC3mZleIH205rcq8hwkGnH9CbBX54IFzClTVOw0MSNxzNuGmjg0kd-QFxYO', true, {algorithm: 'HS256'}
    puts Knock::AuthToken.new({token: token, payload: nil}).to_json
    @payload, _ = JWT.decode token, Knock.token_secret_signature_key.call, true, {algorithm: 'HS256'}
    assert @payload == 123
  end

end
