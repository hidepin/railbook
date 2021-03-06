# -*- coding: utf-8 -*-
class Book < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_and_belongs_to_many :authors
  after_destroy :history_book

  validates :isbn,
    presence: { message: 'は必須です。' },
    uniqueness: { allow_blank: true },
    length: { is: 17, allow_blank: true },
    isbn: { allow_old: true }
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

  private
  def history_book
    logger.info('deleted: ' + self.inspect)
  end
end
