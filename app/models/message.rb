class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: {minimum: 1}
  validates :user_id, presence: true
  scope :custom_display, -> { order(:created_at).last(45) }
end
