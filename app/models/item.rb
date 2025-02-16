class Item < ApplicationRecord

  has_one_attached :image
  
  validates :image          ,presence: true
  validates :title          ,presence: true
  validates :detail         ,presence: true
  validates :price          ,presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, 
             format: { with: /\A[0-9]+\z/, message: 'は半角数字のみ使用できます' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery
  belongs_to_active_hash :place
  belongs_to_active_hash :dispatch
 
  validates :category_id    ,numericality: { other_than: 1, message: "を選択してください" }
  validates :state_id       ,numericality: { other_than: 1, message: "を選択してください" }
  validates :delivery_id    ,numericality: { other_than: 1, message: "を選択してください" }
  validates :place_id       ,numericality: { other_than: 1, message: "を選択してください" }
  validates :dispatch_id    ,numericality: { other_than: 1, message: "を選択してください" }


end
