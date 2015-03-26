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
          fill_in 'Email', with: example_user.email
          fill_in 'Email confirmation', with: example_user.email
        end

        click_button 'Register'

        expect(page).to have_content 'Success'
      end
    end
  end
end