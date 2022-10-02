class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name, presence: true,  format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :family_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :birth_date, presence: true

  has_many :reservations
  #has_many :comments
end

#ゲストログイン機能
  #def self.guest
    #find_or_create_by(email: 'guest@example.com') do |user|
      #user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    #end
  #end
#end
