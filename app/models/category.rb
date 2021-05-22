class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'インテリア・住まい・小物' },
    { id: 5, name: '本・音楽・ゲーム' },
    { id: 6, name: 'コスメ・美容・香水' },
    { id: 7, name: '家電・スマホ・カメラ' },
    { id: 8, name: 'スポーツ・レジャー' },
    { id: 9, name: 'チケット' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  end