class Community < ActiveRecord::Base
  #belongs_to :user
  has_many :room
  has_many :player
  has_many :memberships
  has_many :users, :through => :memberships
  # validates :game, presence: true

  # def self.recent_players
  #   Player.where("created_at >= ?", 8.hours.ago.utc).order("created_at DESC")
  # end
end