class Join < ActiveRecord::Base
  belongs_to :user

  validates :game, presence: true
end