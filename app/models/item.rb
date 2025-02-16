class Item < ApplicationRecord

  has_one_attached :image
  
  validates :image          ,presence: true
  validates :title          ,presence: true
  validates :detail         ,presence: true
  validates :category_id    ,presence: true
  validates :state_id       ,presence: true
  validates :delivery_id    ,presence: true
  validates :place_id       ,presence: true
  validates :dispatch_id    ,presence: true 
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
