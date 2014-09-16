require 'rails_helper'

describe Book do
  it { should belong_to :list }
  it { should validate_presence_of :title }
  it { should validate_presence_of :author }
  it { should validate_presence_of :description }
end
