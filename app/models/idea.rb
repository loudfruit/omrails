class Idea < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :topic, :method, :category, :element, :action, presence: true
end
