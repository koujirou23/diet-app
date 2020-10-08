class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: 'Include both letters and numbers' }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX,
                              message: 'Include (@)' }

  with_options presence: true do
    validates :nickname, :password_confirmation
    validates :tall, format: { with:/\A[0-9]{3}+\z/ }
    validates :weight, format: { with:/\A[0-9]{3}+\z/ }
  end

end
