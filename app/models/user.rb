class User < ApplicationRecord
  attr_reader :password
  before_validation :ensure_session_token

  validates_presence_of :username, :password_digest, :session_token
  validates :password, length: {minimum: 6, allow_nil:true}
  validates_uniqueness_of :username, :session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user && user.is_password?(password) ? user : nil
  end

  def token
    SecureRandom.urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= token
  end

  def reset_session_token!
    self.session_token = token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end
