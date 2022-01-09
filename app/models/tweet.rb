class Tweet < ApplicationRecord
  validates :message, length: { maximum: 140 }, presence: true

  belongs_to :user
end
