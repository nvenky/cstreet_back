class ApplicationRecord < ActiveRecord::Base
  include Camelize
  self.abstract_class = true
end
