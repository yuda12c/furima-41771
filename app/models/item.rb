class Item < ApplicationRecord

  has_one_attached :image
  
  validates :image          ,presence: true
  validates :title          ,presence: true
  validates :detail         ,presence: true
  validates :category_id    ,numericality: { other_than: 1, message: "を選択してください" }
  validates :state_id       ,numericality: { other_than: 1, message: "を選択してください" }
  validates :delivery_id    ,numericality: { other_than: 1, message: "を選択してください" }
  validates :place_id       ,numericality: { other_than: 1, message: "を選択してください" }
  validates :dispatch_id    ,numericality: { other_than: 1, message: "を選択してください" }
  validates :price          ,presence: true,
             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, 
             format: { with: /\A[0-9]+\z/, message: 'は半角数字のみ使用できます' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery
  belongs_to :place
  belongs_to :dispatch

end
