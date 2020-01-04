class User < ApplicationRecord
    validates :username, :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    before_validation :ensure_token

    attr_reader :password

    def self.find_by_credentials(name, pass)
        user = User.find_by_username(name)
        return nil unless user
        user.is_password?(pass) ? user : nil
    end

    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end

    def is_password?(pass)
        BCrypt::Password.new(self.password_digest).is_password?(pass)
    end

    def reset_token
        self.session_token = SecureRandom::urlsafe_base64
        self.save
        self.session_token
    end

    def ensure_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
