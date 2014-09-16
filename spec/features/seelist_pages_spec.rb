require 'rails_helper'

describe "select all lists" do
  it "successfully views all lists" do
    visit '/'
    click_on 'See all Lists!'
    expect(page).to have_content 'All Lists'
  end
end
