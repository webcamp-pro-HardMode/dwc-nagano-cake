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


  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :kana_sei, presence: true, format: { with: KATAKANA_REGEXP, message: "全角カタカナのみで記入してください"}
  validates :kana_mei, presence: true, format: { with: KATAKANA_REGEXP, message: "全角カタカナのみで記入してください"}
  #validates :postal_code, presence: true
  #validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :is_exist, inclusion: { in: [true, false]}

  # 住所自動入力（jp_prefecture）==================================
  # 都道府県コードから都道府県名に自動で変換
  include JpPrefecture
  jp_prefecture :prefecture_code
  # ~.prefecture_nameで都道府県名を参照出来るようにする
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
