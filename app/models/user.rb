class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  has_many :players
  has_many :memberships
  has_many :communities, :through => :memberships

  validates :handle, presence: true
  validates :network, presence: true
 
  def subscriptions 
    communities.where(:memberships => { status: "subscribed" } )
  end

  def moderations 
    communities.where(:memberships => { moderator: "true" } )
  end
end