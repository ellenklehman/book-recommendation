require 'rails_helper'

describe "select all books and view discriptions" do
  it "successfully views all books" do
    visit '/'
    click_on 'See all Books!'
    expect(page).to have_content 'All Books'
  end

  it "selects a book to view description" do
    book = FactoryGirl.create(:book)
    visit '/'
    click_on 'See all Books!'
    click_on 'Little Women by Louisa May Alcott'
    expect(page).to have_content 'story'
  end
end
