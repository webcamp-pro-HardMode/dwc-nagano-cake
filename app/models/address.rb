class Address < ApplicationRecord
  belongs_to :customer

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

def all_address
  # 変数展開#{〇〇}のことで以下カラムを提示してインスタンス（実例）を展開する
  "〒#{self.postal_code}  #{self.address}  #{self.name}"
end

end
