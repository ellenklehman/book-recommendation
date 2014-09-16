class Book <ActiveRecord::Base
  belongs_to :list

  validates :title, :author, :description, :presence => true
end
