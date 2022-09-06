class User < ApplicationRecord
  attribute :login, :string
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  validates :phone_number,:email, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2, maximum: 30 }
  validates :phone_number, length: { minimum: 10, maximum:15  }
  validates :encrypted_password, format: {with: /\A[a-zA-Z0-9. ! @ # $ % ^ & * ( ) _ - + =]+\Z/,message: "(minimum 8 characters with at least one capital letter and a special character)"}        
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(phone_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
