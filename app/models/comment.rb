class Comment < ApplicationRecord
  belongs_to :my_thread
  validates :comment, presence: true
end
