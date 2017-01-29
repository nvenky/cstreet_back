class ApplicationController < ActionController::API
  include Knock::Authenticable

  # protect_from_forgery with: :null_session
end
