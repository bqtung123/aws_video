require "rails_helper"

RSpec.feature "Signin", type: :feature do
  describe "the signin process", :type => :feature do

    let!(:user) { create :user }

    it "signs me in" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', :with => 'joe@gmail.com'
        fill_in 'Password', :with => 'abcd1234'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
