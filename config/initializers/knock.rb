Knock.setup do |config|

  ## Expiration claim
  ## ----------------
  ##
  ## How long before a token is expired. If nil is provided, token will
  ## last forever.
  ##
  ## Default:
  # config.token_lifetime = 1.day


  # config.current_user_from_token = -> (claims) { User.find_by claims['sub'] }
  # config.current_user_from_token = -> (claims) { User.find_or_create_by(auth_id: claims['sub']) }

  ## Audience claim
  ## --------------
  ##
  ## Configure the audience claim to identify the recipients that the token
  ## is intended for.
  ##
  ## Default:
  # config.token_audience = nil
  config.token_audience = -> { Rails.application.secrets.auth0_client_id }

  ## If using Auth0, uncomment the line below
  # config.token_audience = -> { Rails.application.secrets.auth0_client_id }

  ## Signature algorithm
  ## -------------------
  ##config.current_user_from_token = -> (claims) { User.find claims['sub'] }
  ## Configure the algorithm used to encode the token
  ##
  ## Default:
  # config.token_signature_algorithm = 'HS256'

  ## Signature key
  ## -------------
  ##
  ## Configure the key used to sign tokens.
  ##
  ## Default:
  # config.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }
  # config.token_secret_signature_key = -> {
  #   puts "token_secret_signature_key:  #{Rails.application.secrets.auth0_client_secret }"
  #   puts "token_secret_signature_key:  #{JWT.base64url_decode Rails.application.secrets.auth0_client_secret }"
  #   JWT.base64url_decode Rails.application.secrets.auth0_client_secret
  # }
  # config.token_secret_signature_key = -> {
  #     secret = Rails.application.secrets.auth0_client_secret
  #     secret += '=' * (4 - secret.length.modulo(4))
  #
  #     puts "token_secret_signature_key:  #{Rails.application.secrets.auth0_client_secret }"
  #     puts "token_secret_signature_key:  #{JWT.base64url_decode Rails.application.secrets.auth0_client_secret }"
  #     puts "token_secret_signature_key:  #{Base64.decode64(secret.tr('-_', '+/'))}"
  #     Base64.decode64(secret.tr('-_', '+/'))
  #   }
  ## If using Auth0, uncomment the line below
  config.token_secret_signature_key = -> { Rails.application.secrets.auth0_client_secret }

  ## Public key
  ## ----------
  ##
  ## Configure the public key used to decode tokens, if required.
  ##
  ## Default:
  # config.token_public_key = nil

  ## Exception Class
  ## ---------------
  ##
  ## Configure the exception to be used when user cannot be found.
  ##
  ## Default:
  # config.not_found_exception_class_name = 'ActiveRecord::RecordNotFound'
end
