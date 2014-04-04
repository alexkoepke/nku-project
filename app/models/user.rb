class User < ActiveRecord::Base
  has_many :players
  has_secure_password

  #attr_accessible :email, :password, :password_confirmation
  validates :handle, presence: true
  validates :network, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email


  # # attr_accessor :password
  # # before_save :encrypt_password

  # # attr_accessor :password
  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  # validates_presence_of :email
  # validates_uniqueness_of :email

  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end
end