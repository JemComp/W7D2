class User < ApplicationRecord

    validates :email, uniqueness: true, presence: true
    validates :password_digest, presence: true
    validates :password, allow_nil: true, length: {minimum: 6}
    validates :session_token, presence: true, uniqueness: true
    attr_reader :password
    after_initialize :ensure_session_token

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token! 
        self.session_token = User.generate_session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def self.find_by_credentials(email, password)
        @user = user.find_by(email: email)
        if @user
            @user.is_password?(password)
        end
    end

    def password=(password)
        self.password_digest = BCrypt::password.create(password)
        @password = password
    end

    def is_password?(password)
        password_object = BCrypt::password(self.password_digest)
        password_object.is_password?(pass)
    end

end
