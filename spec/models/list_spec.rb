require 'rails_helper'

describe List do
  it { should have_many :books }
  it { should belong_to :user }
  it { should validate_presence_of :name }
end
