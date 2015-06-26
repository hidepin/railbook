# -*- coding: utf-8 -*-
class Book < ActiveRecord::Base
  validates :isbn,
    presence: true,
    uniqueness: true,
    length: { is: 17 },
    format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/ }
  validates :title,
    presence: true,
    length: { minimum: 1, maxmum: 100 },
    uniqueness: { scope: :publish }
  validates :price,
    numericality: { only_integer: true, less_than: 10000 }
  validates :publish,
    inclusion: {in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム'] }

  scope :gihyo, -> { where(publish: '技術評論社') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
end
