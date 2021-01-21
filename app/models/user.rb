class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :family_name,      presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角文字を使用してください" }
  validates :given_name,       presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "全角文字を使用してください" }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナを使用してください" }
  validates :given_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カナを使用してください" }
  validates :birthday,         presence: true
  validates :password,         presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "Include both letters and numbers" }

  has_many :items
  has_many :purchases

end
