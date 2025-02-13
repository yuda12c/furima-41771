class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ファッション' },
    { id: 3, name: 'ベビー・キッズ' },
    { id: 4, name: 'ゲーム・おもちゃ・グッズ' },
    { id: 5, name: 'ホビー・楽器・アート' },
    { id: 6, name: 'チケット' },
    { id: 7, name: '本・雑誌・漫画' },
    { id: 8, name: 'CD・DVD・ブルーレイ' },
    { id: 9, name: 'スマホ・タブレット・パソコン' },
    { id: 10, name: 'テレビ・オーディオ・カメラ' },
    { id: 11, name: '生活家電・空調' },
    { id: 12, name: 'スポーツ' },
    { id: 13, name: 'アウトドア・釣り・旅行用品' },
    { id: 14, name: 'コスメ・美容' },
    { id: 15, name: 'ダイエット・健康' },
  ]

  include ActiveHash::Associations
  has_many :items
end