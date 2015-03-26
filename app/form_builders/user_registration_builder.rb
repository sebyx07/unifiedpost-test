class UserRegistrationBuilder
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user, :country_id
  attr_reader :countries, :errors

  def initialize(attributes = {})
    @user = User.new
    @countries = CountriesService.instance.get_countries
    @errors = []
    unless attributes[:user].nil?
      @user.attributes = attributes[:user].except(:email_confirmation)
      @emails = [attributes[:user][:email], attributes[:user][:email_confirmation]]
    end
  end

  def save_models
    valid_form? ? @user.save! : false
  end

  def valid_form?
    valid = true

    unless @countries[user.country_id]
      @errors << 'Country not found'
    end

    unless CitiesService.instance.get_cities_names(user.country_id).include? user.city
      @errors << 'City not found'
    end

    unless @user.valid?
      @errors.concat(@user.errors.full_messages)
      valid = false
    end

    unless @emails.uniq.size == 1
      @errors << 'Recheck your email'
      valid = false
    end

    valid
  end

  def persisted?
    false
  end
end