class UserRegistrationBuilder
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user

  def initialize(attributes = {})

  end

  def persisted?
    false
  end
end