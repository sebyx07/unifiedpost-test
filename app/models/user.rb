require 'securerandom'
class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  before_create :set_confirmation_code

  def get_country
    CountriesService.instance.get_countries[self.country_id]
  end

  def set_confirmation_code
    self.confirmation_code = SecureRandom.urlsafe_base64 25
  end

  def email_confirmation; end
end
