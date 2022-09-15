# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :login

  has_many :posts
  has_many :favourites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable,
         authentication_keys: [:login]

  validates :email, uniqueness: true, confirmation: { case_sensitive: false }
  validates :phone_number, phone: true
  validates :user_name, length: { minimum: 2, maximum: 30 }

  validates :password,
            presence: true, confirmation: true,
            format: { with: PASSWORD_FORMAT,
                      message: '(minimum 8 characters with at least one capital letter and a special character)' }

  def login
    @login || phone_number || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['phone_number = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:phone_number) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
