class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :likes, dependent: :destroy

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  before_save {self.email = email.downcase}
  before_save {self.username = username.downcase}
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,authentication_keys: [:login]

    validate :validate_username

    def validate_username
    if User.where(email: username).exists?
    errors.add(:username, :invalid)
    end
    end

has_many :discussions, dependent: :destroy

  attr_writer :login

  def login
    @login || self.username || self.email
  end

     def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end





end #main end
