require 'spec_helper'

describe "the register process", :type => :feature do

  describe 'register form' do
    let(:example_user){FactoryGirl.build(:user)}

    context 'when valid data' do
      it 'saves the user and redirects me to the confirmation page' do
        visit '/user_registration'

        within 'form' do
          fill_in 'First name', with: example_user.first_name
          fill_in 'Last name', with: example_user.last_name
          fill_in 'Email', with: example_user.email, :match => :prefer_exact
          fill_in 'Email confirmation', with: example_user.email, :match => :prefer_exact
        end

        click_button 'Register'

        expect(User.find_by(email: example_user.email)).not_to be nil
      end
    end

    context 'when invalid data' do
      it 'returns back to registration form page' do
        visit '/user_registration'

        within 'form' do
          fill_in 'First name', with: example_user.first_name
          fill_in 'Last name', with: nil
          fill_in 'Email', with: example_user.email, :match => :prefer_exact
          fill_in 'Email confirmation', with: example_user.email + 'omg', :match => :prefer_exact
        end

        click_button 'Register'

        expect(User.find_by(email: example_user.email)).to be nil
        expect(page).to have_content 'Recheck your email'
        expect(page).to have_content "Last name can't be blank"
      end
    end
  end
end