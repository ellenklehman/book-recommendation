require 'rails_helper'

describe "the signup process" do
  it "signs a user up" do
    visit '/users/sign_up'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    page.should have_content 'successfully.'
  end

  it "gives a user an error who uses the wrong password confirmation" do
    visit '/users/sign_up'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'passWord'
    click_button 'Sign up'
    page.should have_content 'error'
  end
end
