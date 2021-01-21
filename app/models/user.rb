class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :birthday
    validates :password
  end

  with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :given_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
    validates :family_name_kana
    validates :given_name_kana
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'Include both letters and numbers' }

  has_many :items
  has_many :purchases
end
