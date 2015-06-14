# -*- coding: utf-8 -*-
class ViewController < ApplicationController
  def form_tag
    @book = Book.new
  end
  def form_for
    @book = Book.new
  end
  def field
    @book = Book.new
  end
  def html5
    @book = Book.new
  end
  def select
    @book = Book.new(publish: '技術評論社')
  end
  def col_select
    @book = Book.new(publish: '技術評論社')
    @books = Book.select(:publish).distinct
  end
  def dat_select
    @book = Book.find(1)
  end
  def col_radio
    @book = Book.new(publish: '技術評論社')
    @books = Book.select(:publish).distinct
  end
  def multi
    render layout: 'layout'
  end
  def nest
    @msg = '今日も良い天気です。'
    render layout: 'child'
  end
end
