class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # UserモデルにPostImageモデルを関連付ける(アソシエーション)
  has_many :post_images, dependent: :destroy
  # dependent: :destroy has_manyで使えるオプション
  # 1:Nの関係において、1のデータが削除された場合、関連するNのデータも削除される設定
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
end
