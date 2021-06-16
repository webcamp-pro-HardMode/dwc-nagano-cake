class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :addresses, dependent: :destroy

# カタカナ入力にバリデーションをかける定義
KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/


  validates :fast_name, presence: true
  validates :family_name, presence: true
  validates :kana_sei, presence: true, format: { with: KATAKANA_REGEXP, message: "全角カタカナのみで記入してください"}
  validates :kana_mei, presence: true, format: { with: KATAKANA_REGEXP, message: "全角カタカナのみで記入してください"}
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :is_exist, inclusion: { in: [true, false]}

end
