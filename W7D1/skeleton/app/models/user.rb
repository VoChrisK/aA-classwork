class User < ApplicationRecord
  validates :username, :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true
  before_validation :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(user_name, pass_word)
    user = User.find_by(username: user_name)
    return nil unless user
    user.is_password?(pass_word) ? user : nil
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
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

  def logged_in?
    !!@current_user
  end

  attr_reader :password

end
