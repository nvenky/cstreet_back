class User < ApplicationRecord
  def self.from_token_payload payload
    puts "Payload: #{payload}"
    puts "payload - #{payload.empty?}"
    return nil if payload.empty?

    find_by({auth_id: payload['sub']})  ||
      User.create!({auth_id: payload['sub'], email: payload['email'], email_verified: payload['email_verified'],
            auth_name: payload['name']})
  end
end
