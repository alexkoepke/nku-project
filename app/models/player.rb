class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  # validates :game, presence: true

  # def self.recent_players
  #   Player.where("created_at >= ?", 8.hours.ago.utc).order("created_at DESC")
  # end
end