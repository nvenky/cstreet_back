class User < ApplicationRecord
  before_save :update_names
  def self.from_token_payload payload
    find_by({auth_id: payload['sub']})  ||
      User.create!({auth_id: payload['sub'], email: payload['email'], email_verified: payload['email_verified'],
            auth_name: payload['name']})
  end

  def update_names
    if care_for == 'me'
      elder_first_name = first_name
      elder_last_name = last_name
    end
  end
end
