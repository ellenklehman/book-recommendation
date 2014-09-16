require 'rails_helper'

describe "the create list and add books process" do
  it "creates a list successfully", js: true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit '/'
    find('#make-list').click
    fill_in 'Name', :with => 'Fiction'
    click_button 'Create List'
    expect(page).to have_content 'saved'
  end

  it "accesses list page successfully", js: true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit '/'
    find('#make-list').click
    fill_in 'Name', :with => 'Fiction'
    click_button 'Create List'
    click_on 'Fiction'
    expect(page).to have_content 'List!'
  end

  it "adds a book to a list successfully", js: true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit '/'
    find('#make-list').click
    fill_in 'Name', :with => 'Fiction'
    click_button 'Create List'
    click_on 'Fiction'
    click_on 'Add a book'
    fill_in 'Title', :with => 'Pride and Prejudice'
    fill_in 'Author', :with => 'Jane Austen'
    fill_in 'Genre', :with => 'Historical Fiction'
    fill_in 'Description', :with => 'A couple find out they have been blinded by pride and prejudice.'
    expect(page).to have_content 'Pride'
  end
end
