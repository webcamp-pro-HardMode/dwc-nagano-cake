class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #管理者は会員登録機能不要のためregisterableをコメントアウト
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable


end
