require 'rails_helper'

describe "the signin process" do
 it "signs a user in who uses the right password" do
     user = FactoryGirl.create(:user)
     sign_in(user)
     expect(page).to have_content 'successfully'
   end

   it "gives a user an error who uses the wrong password" do
     user = FactoryGirl.create(:user)
     visit '/users/login'
     fill_in 'Email', :with => 'example@example.com'
     fill_in 'Password', :with => 'passWord'
     click_button 'Log in'
     expect(page).to have_content 'Invalid'
   end
end
